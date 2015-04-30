# Lab 9: Sounds and Sampling  

## Acknowledgments

This lab has been adapted from <a href="http://class.ee.iastate.edu/mmina/ee186/labs/Audio.htm" title="Audio Processing with MatLab An Introduction" target="_blank">**Audio Processing with Matlab: An Introduction**</a> by Rachel Hager from the Electrical and Computer Engineering Department at Iowa State University.

This lab is an introduction to audio processing with Matlab. This lab will help to familiarize you with some of the main functions to read in and play music files in Matlab.

It is an opportunity to try some basic digital signal processing.

## Preparation

Download and run the <a href="https://github.com/cpjobling/EG-247-Resources/blob/master/portfilio/lab9/soundex.m" target="_blank">linked script</a> to familiarise yourself with the basic tools that Matlab provides for manipulating and visualizing audio files. You will need to download a sound file and store it in the same folder then edit the script so that it loads your file. Music might be best for this initial exercise but you can use any audio file.

You will need headphones to hear the sounds.

## [Sound Samples](http://www.ee.columbia.edu/~dpwe/sounds/) (web link)

The web link above points to a source of sound samples. Choose one of these or find some other files from the internet. I downloaded and used the file <a href="http://www.ee.columbia.edu/~dpwe/sounds/musp/msmv2.wav">Music (Vocals) Example 2</a> from <a href="http://www.ee.columbia.edu/~dpwe/sounds/musp/" target="_blank">this page</a> in my example script.

## Lab Exercise 22: Playing With Sound

### Part 1: Read and Store an Audio File in Matlab

To read and store an audio file, you can use one of two different commands. The following stores the file into variable x.

```matlab
x = audioread('filename');
```

Unless the audio file is in the same folder as the script, you will need to include the entire filename including the directory.

Example: `C:\My Documents\EG-247-Lab\portfolio\lab9\Audio.wav`

The command below stores the audio file into variable `x` and the sampling frequency in variable `Fs`.

```matlab
[x,Fs] = audioread('filename');
```

### Part 2: Play the Audio File

To play an audio file in Matlab you use the `sound()` function. The following function plays the sound. If the `Fs` variable is not defined or included in the command, it will assume the default sample rate of 8192 Hz.

```matlab
sound(x,Fs);
```

In the PC lab, the speakers may have been disabled. But even if they are not, it will probably be best if you use head phones with either a standard 3.5 mm phone socket or USB connection to hear the sounds.

### Part 3: Audio Scaling

To scale an audio file the `sound()` command is used. This allows for the modification of an audio signal’s amplitude or frequency.

```matlab
sound(x,Fs);
```

To increase the volume of the audio track you can multiply the variable it is stored in by a scalar. To slow down or speed up the track played you can adjust the sampling rate. Comment on your observations using different values.

Now experiment with different bit values (8,16,24) in the following command:
```matlab
sound(x,Fs,bits);
```

Comment on your observations.

### Part 4: Playing a Sound Backwards

The command to reverse the order of the samples in a matrix is `flipud()`. Experiment with this command.

Create a script called `ex22.m` that records your experiments in this part of the lab. Include your thoughts in the comments.
