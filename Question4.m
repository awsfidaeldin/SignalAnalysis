% Read the audio file
fileName = ('C:\MathProjectRecording - flac.flac');
[y, fs]=audioread(fileName);
% Convert from Time Domain to Frequency Domain
F=fft(y);
NFFT=1024;
F=fft(y,NFFT);
F_Shift=fftshift(F);
freqVals_scaling=fs*(-NFFT/2:NFFT/2-1)/NFFT;
% Sampling rate
t=(1:length(y))/fs;
% Plotting the sample
subplot(3,1,1)
plot(freqVals_scaling,abs(F_Shift),'b');
title('Original Audio');
xlabel('Frequency');
ylabel('DFT Value');
% Setting the Downsampling value
M = 4;
x = decimate(y, M, 'fir');
% Convert from Time Domain to Frequency Domain
F1=fft(x);
F1=fft(x,NFFT);
F_Shift1=fftshift(F1);
freqVals_scaling1=fs*(-NFFT/2:NFFT/2-1)/NFFT;
% Sampling rate
t1 = linspace(1,length(x)/fs,length(x));
% Plotting the Downsampled Signal
subplot(3,1,2);
plot(freqVals_scaling1,abs(F_Shift1),'b');
title('Downsampled Audio');
xlabel('Frequency');
ylabel('DFT Value');
% Setting the Upsampling value
[P,Q]=rat(52000/fs);
z = resample(y,P,Q);
% Convert from Time Domain to Frequency Domain
F2=fft(z);
F2=fft(z,NFFT);
F_Shift2=fftshift(F2);
freqVals_scaling2=fs*(-NFFT/2:NFFT/2-1)/NFFT;
% Sampling rate
t2 = linspace(1,length(z)/(48000),length(z));
% Plotting the Upsampled Signal
subplot(3,1,3);
plot(freqVals_scaling2,abs(F_Shift2),'b');
title('Upsampled Audio');
xlabel('Frequency');
ylabel('DFT Value');
