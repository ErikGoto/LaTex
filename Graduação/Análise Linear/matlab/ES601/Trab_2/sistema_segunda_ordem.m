clc
t = out.tout;



syms s
F = 1/(s*(s^2 + s + 10^3));
G = ilaplace(F)

%Resultado de G = x_t
x_t = 1/1000 - (exp(-t/2).*(cos((3999^(1/2).*t)/2) + (3999^(1/2).*sin((3999^(1/2).*t)/2))/3999))/1000;

plot(t, out.simout, "k-", t, x_t, "bx")
legend("Simulink", "Analítica")