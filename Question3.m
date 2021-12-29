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
% Setting the Upsampling value
[P,Q]=rat(52000/fs);
z = resample(y,P,Q);
t2 = linspace(1,length(z)/(48000),length(z));
% Plotting the Upsampled Signal
subplot(2,1,2);
plot(t2,z);
title('Upsampled Audio');
xlabel('Time per Second');
ylabel('Amplitute per Voltage');
