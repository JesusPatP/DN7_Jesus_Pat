// See https://aka.ms/new-console-template for more information


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

Console.ReadKey();
