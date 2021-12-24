%Matrizes
A = [0 1; -10^4 -10];
B = [0; 10^4];
C = [1 1];
D = [0];
%Condição inicial
x0 = [1; 5];

%Sitema
sys = ss(A, B, C, D);
%Entrada degrau
sympref('HeavisideAtOrigin',1);
t = 0:0.01:5;
u = heaviside(t);

y = lsim(sys, u, t, x0);
plot(t, y, out.tout, out.simout, 'x');

%Conversão para a função transferência
[N, D] = ss2tf(A, B, C, D);
H = tf(N, D)

%A partir da função transferência conseguir o valor das matrizes
[a, b, c, d] = tf2ss(N,D)


