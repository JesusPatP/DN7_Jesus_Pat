using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AudioManager;

namespace OOP.ConsoleExample
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Console class with satatic method 
            Console.WriteLine("Hello World!");

            //Reference to class Animal in AudioManager
            Animal animal = new Animal();
            animal.AnimalSound();

            //Wait a key to continue the program
            Console.ReadKey();
        }
    }
}
