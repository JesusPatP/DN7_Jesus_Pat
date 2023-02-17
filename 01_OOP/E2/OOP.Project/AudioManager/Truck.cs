using NAudio.Wave;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AudioManager
{

    public class Truck: Vehicle
    {
        public override void VehicleSound()
        {
            //Route
            AudioFileReader audioFile = new AudioFileReader("Resources/Truck.wav");

            //Event 
            WaveOutEvent waveOutEvent = new WaveOutEvent();

            //Initialize file
            waveOutEvent.Init(audioFile);

            waveOutEvent.Play();

            // The system waits half a second until the audio ends
            while (waveOutEvent.PlaybackState == PlaybackState.Playing)
            {
                System.Threading.Thread.Sleep(500);
            }

            //Free up system resources
            audioFile.Dispose();
        }

    }
}
