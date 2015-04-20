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
disp('Start speaking: say "EG-247 Signals and Systems"')
disp('Press any key when your are ready...')
pause
recordblocking(recObj, 5);
disp('End of Recording.');
% Display meta data
recObj
%% Play back the recording.
disp('Press any key when your are ready...')
pause
play(recObj);
%% Store data in double-precision array.
myRecording = getaudiodata(recObj);
%% Plot the waveform.
plot(myRecording);
title('Time plot of sampled sound - zoom to see details')
xlabel('Sample number [n]')
ylabel('Sampled sound value')
disp('Press any key when your are ready...')
pause
%%
% Plot the samples
stem([1000:1049],myRecording(1000:1049))
title('Stem plot of small sample of waveform: n = 1000 to 1049')
xlabel('Sample number [n]')
ylabel('Sampled sound value')
disp('Press any key when your are ready...')
pause
%% Save the result
Fs = recObj.SampleRate;
audioFile = 'eg-247-message.wav';
audiowrite(audioFile,myRecording,Fs);
disp(['Audiofile Written as: ',audioFile]);