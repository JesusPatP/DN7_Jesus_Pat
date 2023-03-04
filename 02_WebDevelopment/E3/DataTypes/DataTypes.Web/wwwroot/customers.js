var element = document.getElementById("CustomerList");

var customerList = [
    { Name : "Juan", creationDate : Date.parse("03/09/2011 09:42:18 pm") },
    { Name: "Pedro", creationDate: Date.parse("03/09/2012 10:42:18 pm") },
    { Name: "Carlos", creationDate: Date.parse("03/09/2013 11:42:18 pm") },
    { Name: "Dionicio", creationDate: Date.parse("03/09/2014 12:42:18 pm") },
    { Name: "Andrit", creationDate: Date.parse("03/09/2015 01:42:18 pm") },
    { Name: "Lalo", creationDate: Date.parse("03/09/2016 02:42:18 pm") },
    { Name: "Edwin", creationDate: Date.parse("04/09/2011 08:42:18 pm") },
    { Name: "Mayra", creationDate: Date.parse("05/09/2012 07:42:18 pm") },
    { Name: "Maria", creationDate: Date.parse("06/09/2013 06:42:18 pm") },
    { Name: "Zulema", creationDate: Date.parse("07/09/2014 05:42:18 pm") }
];


var ul = "<ul>";

for (var i = 0; i < customerList.length; i++) {
    ul += ("<ul>" + "<li>" + `Name = ${customerList[i].Name}, Creation Date = ${customerList[i].creationDate}` + "</li>" + "</ul>");
}

ul += "</ul>";

element.innerHTML = ul;