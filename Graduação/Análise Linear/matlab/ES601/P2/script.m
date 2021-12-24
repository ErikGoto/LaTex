clc
close all

A=[
    0 1;
    -2340 -23.4
];
B=[
    0;
    1
];
C=[
    2340 23.4
];
D=[
    0
];

%Resposta Impulsiva
t = 0:0.001:3;
hexp = zeros(size(t));

[empty, sizeT] = size(t);
for i=1:sizeT
    hexp(i) = C*expm(A*t(i))*B;
end
sysC = ss(A, B, C, D);
h = impulse(sysC, t);
plot(t,hexp, t, h, 'o'); 

%Conversão de estados para a função transferencia
[num, den] = ss2tf(A, B, C, D);
H = tf(num, den);

%Resposta a um pulso retangular
u = 0.1*(heaviside(t) - heaviside(t-0.01));
yRet = lsim(sysC, u, t);
yRet = yRet/(sum(u)*0.001)
figure
plot(t, yRet, 'b', t, h, 'r');

%Exponencial Matricial eAT por Cayley-Hamilton
syms time

autovalores= eig(A);
I = eye(size(A));
alfa = inv(vander(autovalores))*exp(autovalores*time);

eACH = alfa(1)*A + alfa(2)*I;
vpa(eACH, 2)


%Questão 2----------------------------------------------------------------
A=[
    0 1 0;
    0 0 1;
    -0.234 0 0
];
B=[
    0;
    0;
    1
];
C=[
    1 0 0
];
D=[0];

%Resposta ao impulso
k = 0:20;
h = zeros(size(k));
ik = 1;

for ik = 2:21
    h(ik) = C*A^(k(ik)-1)*B;
end

%Comparando com o impulse
sys = ss(A, B, C, D, 1);
hi = impulse(sys, k);

stairs(k, h, 'rs')
hold on;
stairs(k, hi, 'b-')
hold off;

%Resposta para entrada nula
u = zeros(size(k));
x0 = [0; 2.34; 0];

rh = lsim(sys, u, k, x0);

ik = 1;
for ik=1:21
    rHA(ik) = C*A^k(ik)*x0;
end

figure
stairs(k, rh);
hold on
stairs(k, rHA, 'ro');
