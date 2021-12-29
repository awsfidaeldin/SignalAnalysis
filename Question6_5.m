% Assigning the Frequency, Amplitute and Degree
f=60;
A=1.0;
ph=45;
fs=8*f;
Ts=1/fs;
t=0:Ts:200;
% Generate a 200 Samples
x=A*(ph*sin(2*pi*fs*t)+(1/3)*sin(2*pi*3*fs*t));
function y = add_awgn_noise(x,SNR_dB)
    %y=awgn_noise(x,SNR) adds AWGN noise vector to signal 'x' to generate a
    %resulting signal vector y of specified SNR in dB
    %rng('default');%set the random generator seed to default (for comparison only)
    L=length(x);
    SNR = 10^(SNR_dB/10); %SNR to linear scale
    Esym=sum(abs(x).^2)/(L); %Calculate actual symbol energy
    N0=Esym/SNR; %Find the noise spectral density
    if(isreal(x)),
        noiseSigma = sqrt(N0);%Standard deviation for AWGN Noise when x is real
        n = noiseSigma*randn(1,L);%computed noise
    else
        noiseSigma=sqrt(N0/2);%Standard deviation for AWGN Noise when x is complex
        n = noiseSigma*(randn(1,L)+1i*randn(1,L));%computed noise
    end    
    y = x + n; %received signal    
end




SNR_dB = 5.0; %Signal to noise ratio in dB
t = 0:.1:10;%time base

x = sqrt(2)*(sin(t)+3*sin(t));
%x = sin(t); % Create a sine signal.
 

y_custom = add_awgn_noise(x,SNR_dB); %our custom function
 
%
 
%Plotting results
 
figure; subplot(1,2,1);
plot(t,x,'b',t,y_custom,'r') % Plot both signals.
legend('signal','signal with noise');
xlabel('timebase');ylabel('y_{custom}');
title('custom add\_awgn\_noise function');