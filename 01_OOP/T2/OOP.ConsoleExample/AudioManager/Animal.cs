using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AudioManager
{
    public class Animal
    {
        //virtual is the specific word to allow the child class to modify the parent class
        public virtual void AnimalSound()
        {
            Console.WriteLine("I'm an animal");
        }
    }
}
