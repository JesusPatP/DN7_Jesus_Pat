function onButtonClick(evt) {

    var b = evt.currentTarget;

    var classes = b.classList;

    var isGreen = false;

    for (var i = 0; i < classes.length; i++) {
        var c = classes[i];

        if (c == "greenButton") {
            isGreen = true;
            break;
        }
    }

    if (isGreen) {
        b.className = "btn redButton";
    } else {
        b.className = "btn greenButton";
    }

    var t = document.getElementById("sampleTable");
    var currentHtml = t.innerHTML;

    t.innerHTML += "<tr><td>" + b.getAttribute("name") + "</td><td>" + new Date() + "</td></tr>";



    //var buttonName = b.getAttribute("name");
    //debugger;
    //alert("Click on: " + buttonName);

};

//to locate the button
//var button = document.getElementsByTagName("button")[0];
//var button = document.getElementById("button1");
//var button = document.getElementsByName("testButton")[0];

//var buttons = document.getElementsByClassName("btn");

var buttons = document.getElementsByTagName("button");

for (var i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener("click", onButtonClick);
}

//debugger;

//button.addEventListener("click", onButtonClick);

