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
            //Invocation of the animal class
            animal.AnimalSound();

            //Access to the class
            Dog dog = new Dog();

            //the class inherit from the animal class
            dog.AnimalSound();

            Elephant elephant = new Elephant();
            elephant.AnimalSound();

            Cat cat= new Cat();
            cat.AnimalSound();

            //Wait a key to continue the program
            Console.ReadKey();
        }
    }
}
