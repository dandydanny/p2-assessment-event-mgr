$(document).ready(function() {
  console.log("JS ready!");
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $("#create-form").submit(function(event){
  event.preventDefault();
  console.log("create clicked");


  var eventName = $("name").val();
  var eventLocation = $("location").val();
  var eventStart = $("start_time").val();
  var eventEnd = $("end_time").val();

  console.log(eventName);
  console.log(eventLocation);
  console.log(eventStart);
  console.log(eventLocation);

    $.ajax({
      type: "POST",
      url: "/add",
      dataType: 'json',
      data: {name: teaName, location: teaOpinion},
    }).done(function(msg) {


  });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
