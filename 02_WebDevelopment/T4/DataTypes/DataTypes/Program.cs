// See https://aka.ms/new-console-template for more information


string text = "This is a string";

int age = 35;

DateTime now= DateTime.Now;

double amount = 0;

string string2 = text + " a second string " + age + now + amount;

//Format the text
string string3 = string.Format("The age is {0}, the time is {1}, and the amount is {2}",age,now,amount);

//Format the text
string string4 = $"The age is {age}, the time is {now}, and the amount is {amount}";

char sampleChar = 'C';
char[] arrayChar = string4.ToCharArray();


for(int i = 0;i < string4.Length; i++)
{
    Console.WriteLine(string4[i]);
}

Console.WriteLine(sampleChar);

Console.ReadKey();
