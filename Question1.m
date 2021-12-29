% Read the audio file
fileName = ('C:\MathProjectRecording - flac.flac');
[y, fs]=audioread(fileName);
% Sampling rate
t=(1:length(y))/fs;
% Plotting the sample
plot(t,y);
title('Sound Wave');
xlabel('Time per Second');
ylabel('Amplitute per Voltage');
% Sample Rate Info
info = audioinfo(fileName)
