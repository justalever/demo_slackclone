document.addEventListener("turbolinks:load", function() {
  var messageForm = document.getElementById('new_message');

  messageForm.addEventListener('submit', function(e) {
    this.reset();
  })
});