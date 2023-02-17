using AudioManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;

namespace OOP.Project
{
    internal class Program
    {
        static void Main(string[] args)
        {

            //repeat 10 times
            for (int i = 0; i < 10; i++)
            {
                //Console class with satatic method 
                Console.WriteLine("Type the vehicle!");

                // Request a string
                //ToLower convert uppercase to lowercase
                String vehicleType = Console.ReadLine().ToLower();

                Vehicle vehicle = null;

                switch (vehicleType)
                {
                    case "truck":
                        vehicle = new Truck();        
                        break;
                    case "car":
                        vehicle = new Car();
                        break;
                    case "train":
                        vehicle = new Train();
                        break;
                    default:
                        Console.WriteLine("Vehicle not found!");
                        System.Threading.Thread.Sleep(2000);
                        break;

                }

                if (vehicle != null)
                {
                    vehicle.VehicleSound();
                }

            }

        }
    }
}
