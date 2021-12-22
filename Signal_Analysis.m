[y,fs,BPS]=wavread('octaveRecord.wav');
t=linspace(0,length(y)/fs,length(y));
plot(t,y);
printf("The Sampling Rate is %d \n",fs);
printf("The # of bits per sample %d \n",BPS);



[y,fs,BPS]=wavread('octaveRecord.wav');
t=linspace(0,length(y)/fs,length(y));
subplot(411);
plot(t,y);
F=fft(y);
subplot(412);
plot(t,F,'b');
F_Shift=fftshift(F);
subplot(413);
plot(t,F_Shift);
NFFT=1024;
F=fft(y,NFFT);
F_Shift=fftshift(F);
freqVals_scaling=fs*(-NFFT/2:NFFT/2-1)/NFFT;
subplot(414);
plot(freqVals_scaling,abs(F_Shift),'b');



f1=60;
A1=1.0;
ph=45*pi/180;
fs=8*f1;
ts=1/fs;
t=0:ts:0.8;
x=A1*(ph*sin(2*pi*fs*t)+(1/3)*sin(2*pi*3*fs*t));
subplot(411);
plot(t,x);
subplot(412);
plot(t,x);
F=fft(x);
subplot(413);
plot(t,F);
NFFT=1024;
F=fft(y,NFFT);
F_Shift=fftshift(F);
freqVals_scaling=fs*(-NFFT/2:NFFT/2-1)/NFFT;
subplot(414);
plot(freqVals_scaling,abs(F_Shift),'b');



SNR_dB=1;
f1=60; %This is the given frequency
A1=1; %This is the given amplitude
ph=45*pi/180; % Phase converted to Radians
fs=f1*60; %This is the result sample frequency which is the result of multiplying the given sample frequency value by the given frequency value
Ts=1/fs; %The sampling time which is 1 over the sampling frequency
t=0:Ts:0.2;  %This is the time value
y=A1*(ph*sin(2*pi*fs*t)+(1/3)*sin(2*pi*3*fs*t)); %This is the signal formula provided by the question as x(t)
subplot(211);
plot(t,y);
title('Generated Samples of Given Wave');
xlabel('Time(s)');
ylabel('Samples(Hz)');
hold on;

y_custom = add_awgn_noise(y,SNR_dB); %This is the custom function
 
function y = add_awgn_noise(y,SNR_dB)
    %y=awgn_noise(y,SNR) adds AWGN noise vector to signal 'Y' to generate a
    %resulting signal vector y of specified SNR in dB
   L=length(y);
    SNR = 10^(SNR_dB/10); %Convert SNR in dB to Linear
    Esym=sum(abs(y).^2)/(L); %Calculate actual symbol energy
    N0=Esym/SNR; %Find the noise spectral density
   if(isreal(y)),
        noiseSigma = sqrt(N0); %Standard deviation for AWGN Noise when x is real
        n = noiseSigma*randn(1,L); %computed noise
   else
       noiseSigma=sqrt(N0/2); %Standard deviation for AWGN Noise when x is complex
       n = noiseSigma*(randn(1,L)+1i*randn(1,L)); %computed noise
    end    
    y = y + n; %received signal 
end


subplot(212);
plot(t,y,'b',t,y_custom,'r') %plots both signals.
legend('signal','signal with noise');
xlabel('timebase');
ylabel('y_{custom}');
title('custom add\_awgn\_noise function')


[y,fs,BPS]=wavread('octaveRecord.wav');
t=linspace(0,length(y)/fs,length(y));
subplot(211);
plot(t,y);
M=2;
ynew=decimate(y,M,'fir');
tnew=linspace(0,length(ynew)/fs,length(ynew));
subplot(212);
plot(tnew,ynew);


[y,fs,BPS]=wavread('octaveRecord.wav');
t=linspace(0,length(y)/fs,length(y));
subplot(211);
plot(t,y);
[P,Q]=rat(48e3/fs);
ynew=resample(y,P,Q);
tnew=linspace(0,length(ynew)/fs,length(ynew));
subplot(212);
plot(tnew,ynew);