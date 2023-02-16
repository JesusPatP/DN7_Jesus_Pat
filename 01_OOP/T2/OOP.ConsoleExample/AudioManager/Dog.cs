using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NAudio.Wave;

namespace AudioManager
{
    public class Dog : Animal
    {
        public override void AnimalSound()
        {
            //Route
            AudioFileReader audioFile = new AudioFileReader("Resources/POO_AnimalSounds_dog.wav");
            //Event 
            WaveOutEvent waveOutEvent= new WaveOutEvent();

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
            waveOutEvent.Dispose();

        }
    }
}
