clc 

t = out.tout;
y = 1/10000 - (exp(-10.*t).*(cos(30*11^(1/2).*t) + (11^(1/2).*sin(30*11^(1/2).*t))/33))/10000;

plot(out.tout, out.simout, "r-", t, y, "bo");
legend("Simulink", "Analítica")