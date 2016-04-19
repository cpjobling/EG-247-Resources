%% Simple Voice Recorder
%
% Records your voice for 5 seconds using your PC's audio input device.
%
% Prepared for EG-247 Signals and Systems
% by Dr Chris P. Jobling
%
%% Set up audio recorder
recObj = audiorecorder;
%% Record so
disp('Start speaking: say "Hello, My name is [say your name]')
disp('and this is EG-247 Signals and Systems"')
disp('Press any key when you are ready...')
pause
recordblocking(recObj, 5);
disp('End of Recording.');
% Display meta data
recObj
%% Play back the recording.
disp('Press any key to hear playback ...')
pause
play(recObj);
%% Store data in double-precision array.
myRecording = getaudiodata(recObj);
%% Plot the waveform.
disp('Press any key to see plot of signal ...')
pause
plot(myRecording);
title('Time plot of sampled sound - zoom to see details')
xlabel('Sample number [n]')
ylabel('Sampled sound value')

%%
% Plot the samples
disp('Press any key to see part of the sampled data sequence ...')
pause
stem([1000:1049],myRecording(1000:1049))
title('Stem plot of small sample of waveform: n = 1000 to 1049')
xlabel('Sample number [n]')
ylabel('Sampled sound value')

%% Save the result
Fs = recObj.SampleRate;
audioFile = 'eg-247-message.wav';
audiowrite(audioFile,myRecording,Fs);
disp(['Audiofile Written as: ',audioFile]);