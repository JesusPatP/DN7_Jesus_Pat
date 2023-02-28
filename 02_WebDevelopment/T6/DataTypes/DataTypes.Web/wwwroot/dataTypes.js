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

    t.innerHTML += "<tr><td>" + b.getAttribute("name") + "</td><td>" + moment(new Date()).format("DD-MM-YYYY HH:mm:ss") + "</td></tr>";



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

(function () {

    document.getElementById("button1").addEventListener("click", function () {

        var options = {
            style: {
                main: {
                    background: "#364685",
                    color: "#fff",
                },
            },
        };

        iqwerty.toast.toast('Hello World!',options);
    });

    var bv = new Bideo();
    bv.init({
        // Video element
        videoEl: document.querySelector('#background_video'),

        // Container element
        container: document.querySelector('body'),

        // Resize
        resize: true,

        // autoplay: false,

        // Array of objects containing the src and type
        // of different video formats to add
        src: [
            {
                src: '/lib/bideo/night.mp4',
                type: 'video/mp4'
            }
        ],

        // What to do once video loads (initial frame)
        onLoad: function () {
            document.querySelector('#video_cover').style.display = 'none';
        }
    });
}());
