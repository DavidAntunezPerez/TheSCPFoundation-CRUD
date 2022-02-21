// BOOTSTRAP 5 JAVASCRIPT FROM MODALS
var myModal = document.getElementById('myModal');
var myInput = document.getElementById('myInput');

myModal.addEventListener('shown.bs.modal', function () {
  myInput.focus();
});

