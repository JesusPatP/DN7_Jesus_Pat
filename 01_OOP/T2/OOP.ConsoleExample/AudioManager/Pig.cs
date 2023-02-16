using NAudio.Wave;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AudioManager
{
    //animal class inheritance
    public class Pig : Animal
    {
        public override void AnimalSound()
        {

            AudioFileReader audioFile = new AudioFileReader("Resources/POO_AnimalSounds_pig.wav");
            WaveOutEvent waveOutEvent = new WaveOutEvent();

            waveOutEvent.Init(audioFile);
            waveOutEvent.Play();
            while (waveOutEvent.PlaybackState == PlaybackState.Playing)
            {
                System.Threading.Thread.Sleep(500);
            }
            audioFile.Dispose();
            waveOutEvent.Dispose();

        }
    }
}
