clc
close all

A=[
    0 1;
    -0.219016 0
];
B=[
    0;
    1
];
C=[
    1 0
];
D=[
    0
];

%Resposta ao impulso
k = 0:20;
ik = 1;
h = zeros(size(k));
for ik=2:21
    h(ik) = C*(A^(k(ik)-1))*B;
end

sys = ss(A, B, C, D, 1);
imp = impulse(sys);

u = zeros(size(k));
u(1) = 1;
Lsim = lsim(sys, u, k);

stairs(k, h);
hold on
stairs(k, imp, 'ro');
hold on
stairs(k, Lsim, 'gx');
hold off

%Resposta para entrada nula
u = zeros(size(k));
x0 = [2.1906 0]';
respNula_1 = lsim(sys, u, k, x0);

ik = 1;
h = zeros(size(k));
for ik=1:21
    respNula_2(ik) = C*A^(k(ik))*x0;
end

figure
stairs(k, respNula_1);
hold on
stairs(k, respNula_2, 'gs');
