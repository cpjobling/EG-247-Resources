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

## Lab Exercise 20: Playing With Sound

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

Create a script called `ex20.m` that records your experiments in this part of the lab. Include your thoughts
in the comments.

## Exercise 21: Aliasing and Antialiasing Filters

This Exercise is based on the demonstration we performed in the Week 9 Lecture on Sampling. The original scripts `aliaseg1.m` and `aliaseg2.m` are to be found in the <a href="https://github.com/cpjobling/EG-247-Resources/tree/master/week9/matlab" target="_blank">week9/matlab</a> folder of the EG-247-Resources collection in GitHub.</p>


### Part 5: Aliasing

Modify your copy of `aliaseg1.m` so that it works on the audio signal that you used in Exercise 20. You will need to adjust the settings so that the correct sampling frequencies are used. Run the script and note the results. Adapt the code that produces the spectra so that it outputs spectrograms as well. This allows you to see the effect of sampling and aliasing in both frequency and time.

Note that this script uses a down-sampling process called decimation to remove samples from the data and simulate the effect of reducing the sampling frequency. For example, to halve the sampling rate, the data is processed using:

```matlab
datar2=datar(1:2:dsize);
soundsc(datar2,Fs/2)
```
Here, `dsize` is the length of the original data sequence, `Fs` is the sampling frequency and `datar(1:2:dsize)` extracts every other sample from the original sequence. The resampled sound is then played at half the sampling frequency.

### Part 6 Antialiasing

The file `aliaseg2.m` performs down-sampling using the Matlab function `resample()`. This function also performs *decimation*, but it uses a low-pass *antialiasing* filter to band-limit the signal before it is resampled. This reduces the change-of-pitch errors (that is apparent reduction of the frequencies) that is a typical manifestation of aliasing on audio signals.

This is the code that reduces the sampling to half the original frequency:</span></span></p>

```matlab
datar2=resample(datar,1,2);
soundsc(datar2,Fs/2)
```

Modify your copy of the script so that it uses the correct parameters for your audio sample and add the spectrogram plots as you did for Part 5.

Save both modified versions of the alias example scripts as `ex21_1.m` and `ex21_2.m` and include the original audio file in your folder for submission.

## Exercise 22: Sound Generation

### Part 7: Making Music with Matlab

This section of the lab will teach you how to create music using different tones created in Matlab.

First we are going to code a sine wave of amplitude A = 1, with at an audio frequency of 26.62 Hz (which corresponds to Middle-C) which plays for 0.5 seconds.

```matlab
Fs = 8000;
Ts = 1/Fs;
middle_c = sin(2*pi*261.62*[0:Ts:0.5]);
sound(middle_c);
```
This vector `middle_c` now contains samples of the sine wave from t = 0s to t = 0.5s, in samples that are spaced `Ts` seconds apart. Note that this sampling interval corresponds to a sampling frequency of 8 kHz (1/Ts = fs) and Ts will be 0.125 ms. This is standard for voice grade audio channels.

Now to write this sound to a sound file we have the following command:

```matlab
audiowrite('middle_c.wav',middle_c,Fs);
```

To play the sound, same as before use the `sound()` function. That is the single note that you just created. Now that you’ve got one down… only several more to go!!</p>

I’ve done some of the easy work here for you. The following webpage gives the frequencies of different notes which are also shown on the table below. <a href="http://www.dolmetsch.com/musictheory27.htm" target="_blank_">http://www.dolmetsch.com/musictheory27.htm</a>.

*Table 1: Notes and Frequencies in the Octave Containing Middle C*
<table border="1" style="width: 200px;">
<tbody>
<tr>
<td><strong>Number</strong></td>
<td><strong>Note</strong></td>
<td><strong>Frequency Hz</strong></td>
</tr>
<tr>
<td>0 </td>
<td>A</td>
<td>440</td>
</tr>
<tr>
<td>1</td>
<td>A#</td>
<td>466.1</td>
</tr>
<tr>
<td>2</td>
<td>B </td>
<td>493.88</td>
</tr>
<tr>
<td>3</td>
<td>Middle C</td>
<td>523.25 </td>
</tr>
<tr>
<td>4</td>
<td>C# </td>
<td>554.36</td>
</tr>
<tr>
<td>5</td>
<td>D</td>
<td>587.33</td>
</tr>
<tr>
<td>6 </td>
<td>D#</td>
<td>622.25</td>
</tr>
<tr>
<td>7 </td>
<td>E</td>
<td>659.25</td>
</tr>
<tr>
<td>8 </td>
<td>F</td>
<td>698.45</td>
</tr>
<tr>
<td>9 </td>
<td>F#</td>
<td>739.98</td>
</tr>
<tr>
<td>10 </td>
<td>G</td>
<td>783.99</td>
</tr>
<tr>
<td>11</td>
<td>G#</td>
<td>830.6</td>
</tr>
</tbody>
</table>

Using this information create tune that plays the musical equivalent of your student number.

For example if your student number starts 605..., from the table 6 = D#, 0 = A, 5 = D, so

```matlab
d_sharp = sin(2*pi*622.25*(0:Ts:0.5));
a = sin(2*pi*440*(0:Ts:0.5));
d = sin(2*pi*587.33*(0:Ts:0.5))
...
```

To "record" the sequence use:

```matlab
tune = [d_sharp,a,d,...];
```

To play the sequence use:

```matlab
sound(tune)
```

Store the sequence in a file called <em>your_student_number</em>.wav.


You can experiment with different lengths of note and also insert silence between notes using

```matlab
wait = zeros(1,length(0:Ts:time));
```

If you wish, you can create real tunes using the same method.

Save the commands you used to create, play and save your musical student number as a script `ex22.m` and add this to your
*lab9* folder.

## What to hand in

You should add all the scripts and audio files created or downloaded for this exercise in your portfolio.

See <a href="https://docs.google.com/spreadsheet/ccc?key=0AljOJ7w63DbTdERaUkhYako2V3VEemdabnd6angxSEE&amp;usp=sharing#gid=0" target="_blank">**Assessment and Feedback: Labwork Assessment**</a> for a detailed marking scheme.
