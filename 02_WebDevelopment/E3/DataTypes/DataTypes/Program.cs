// See https://aka.ms/new-console-template for more information


using DataTypes;
using System.Collections;
using System.Xml.Linq;

string text = "This is a string";

int age = 35;

DateTime now = DateTime.Now;

double amount = 0;

string string2 = text + " a second string " + age + now + amount;

//Format the text
string string3 = string.Format("The age is {0}, the time is {1}, and the amount is {2}",age,now,amount);

//Format the text
string string4 = $"The age is {age}, the time is {now}, and the amount is {amount}";

char sampleChar = 'C';

//A String is an Array of charts
char[] arrayChar = string4.ToCharArray();


//Cast the value to have the exact amount
amount = (double)10 / (double)3;

DateTime dateTime = new DateTime(2000,1,1);

TimeSpan timeStamp1 = now - dateTime;
//var otherText = "this is a text";

Console.WriteLine(timeStamp1.TotalMilliseconds);

string test = "15";

string booleanValue = "True";

bool isTrue = bool.Parse( booleanValue);

age = int.Parse(test);

List<Customer> custumerList = new List<Customer>();

custumerList.Add(new Customer { Name = "Juan", creationDate = DateTime.Parse("03/09/2011 09:42:18 pm") });
custumerList.Add(new Customer { Name = "Pedro", creationDate = DateTime.Parse("03/09/2012 10:42:18 pm") });
custumerList.Add(new Customer { Name = "Carlos", creationDate = DateTime.Parse("03/09/2013 11:42:18 pm") });
custumerList.Add(new Customer { Name = "Dionicio", creationDate = DateTime.Parse("03/09/2014 12:42:18 pm") });
custumerList.Add(new Customer { Name = "Andrit", creationDate = DateTime.Parse("03/09/2015 01:42:18 pm") });

custumerList.Add(new Customer { Name = "Lalo", creationDate = DateTime.Parse("03/09/2016 02:42:18 pm") });
custumerList.Add(new Customer { Name = "Edwin", creationDate = DateTime.Parse("04/09/2011 08:42:18 pm") });
custumerList.Add(new Customer { Name = "Mayra", creationDate = DateTime.Parse("05/09/2012 07:42:18 pm") });
custumerList.Add(new Customer { Name = "Maria", creationDate = DateTime.Parse("06/09/2013 06:42:18 pm") });
custumerList.Add(new Customer { Name = "Zulema", creationDate = DateTime.Parse("07/09/2014 05:42:18 pm") });


Console.WriteLine("print to screen with ForEach");
foreach(Customer customer in custumerList)
{
    Console.WriteLine($"Name = {customer.Name}, Creation Date = {customer.creationDate}");   
}
Console.WriteLine("print to screen with For");
for (int i = 0; i < custumerList.Count; i++)
{
    Console.WriteLine($"Name = {custumerList[i].Name}, Creation Date = {custumerList[i].creationDate}");
}
Console.WriteLine("print to screen with While");

int contador = 0;
while (custumerList.Count>contador)
{
    Console.WriteLine($"Name = {custumerList[contador].Name}, Creation Date = {custumerList[contador].creationDate}");
    contador++;
}

int contador2 = 0;
Console.WriteLine("print to screen with DoWhile");
do
{
    Console.WriteLine($"Name = {custumerList[contador2].Name}, Creation Date = {custumerList[contador2].creationDate}");
    contador2++;
} while (custumerList.Count > contador2);


Console.ReadKey();
