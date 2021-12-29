t = linspace(0,10,200);
y = sin(t);
plot(x,y);
y = cos(t);
hold on;
plot(t,y);
title('Sine and Cosine Waves');
xlabel('time');
ylabel('angle');
