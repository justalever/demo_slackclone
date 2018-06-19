document.addEventListener("turbolinks:load", function() {
  const newMessageForm = document.getElementById('new_message');

  if (newMessageForm) {
    newMessageForm.addEventListener('keypress', function(e) {
      if (e && e.keyCode == 13) {
        e.preventDefault();
        this.submit();
      }
    });
  }

});
