% Assigning the Frequency, Amplitute and Degree
f=60;
A=1.0;
ph=45;
fs=8*f;
Ts=1/fs;
t=0:Ts:200;
% Generate a 200 Samples
x=A*(ph*sin(2*pi*fs*t)+(1/3)*sin(2*pi*3*fs*t));
% Plotting the Signal
plot(t,x);
title('Noise Sample');
xlabel('Time per Second');
ylabel('Amplitute per Voltage');
