n1 = 13;
n2 = -7;
n3 = -3;
t = 0:0.001:1;
z = exp(i*2*pi*n1*t)+exp(i*2*pi*n2*t)+exp(i*2*pi*n3*t);
plot(real(z),imag(z));