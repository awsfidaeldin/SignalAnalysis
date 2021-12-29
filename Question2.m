% Read the audio file
fileName = ('C:\MathProjectRecording - flac.flac');
[y, fs]=audioread(fileName);
% Sampling rate
t=(1:length(y))/fs;
% Plotting the sample
subplot(2,1,1)
plot(t,y);
title('Original Audio');
xlabel('Time per Second');
ylabel('Amplitute per Voltage');
% Setting the Downsampling value
M = 4;
x = decimate(y, M, 'fir');
t1 = linspace(1,length(x)/fs,length(x));
% Plotting the Downsampled Signal
subplot(2,1,2);
plot(t1,x);
title('Downsampled Audio');
xlabel('Time per Second');
ylabel('Amplitute per Voltage');
