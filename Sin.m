f=10;
A=7;
Fs=f*20;
Ts=1/Fs;
t=0:Ts:0.2;
x=A*sin(2*pi*f*t);
plot(t,x);
 	 
title('Sine Wave');	 	 
xlabel('Signal Time (Seconds)')	 	 
ylabel('Simgnal Amplitude (Voltage)');

