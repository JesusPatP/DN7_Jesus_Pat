var myModal = document.getElementById('ModalCenter');
var modal = bootstrap.Modal.getOrCreateInstance(myModal);

//Return de modal and close it after 3 seconds
function onModal(evt) {
    //To have the name of the object
    var InOut = inputText.getAttribute("name");
    //To have the value of the object
    var valor = inputText.value;


    if (InOut == "enterInput") {
        labelTitle.innerHTML = "La entrada para el miembro";
        textBody.innerHTML = "Member: " + valor + " Date: " + moment(new Date()).format("DD-MM-YYYY HH:mm:ss");
    } else {
        labelTitle.innerHTML = "La salida para el miembro";
        textBody.innerHTML = "Member: " + valor + " Date: " + moment(new Date()).format("DD-MM-YYYY HH:mm:ss");

    }
    //To show the modal
    modal.show();
    //to wait 3 seconds
    setTimeout(function () {
        modal.hide();
    }, 3000);

};

var btnCerrrar = document.getElementById('btnCerrarModal');
var btbSend = document.getElementById('buttonSend');
var labelTitle = document.getElementById('labelTitle');
var inputText = document.getElementById('InputMember');
var textBody = document.getElementById('textBody');

//To enter in the input

inputText.addEventListener("keyup", function (event) {
    if (event.keyCode === 13) {
        onModal();
    }
});

//To show the modal
btbSend.addEventListener("click", onModal);

//To close the modal
btnCerrrar.addEventListener('click', function () {
    modal.hide();
});
