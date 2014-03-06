class User < ActiveRecord::Base
  validates :email, format: { with: /^.+@.+$/, :multiline => true, message: "Please enter a valid email address"}
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 4 } # doesn't work
  validates :password, presence: true

  has_many :event_attendances
  has_many :events, through: :event_attendances




  include BCrypt

  # users.password_hash in the database is a :string
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return user if user && (user.password == password)
    nil
  end
end
