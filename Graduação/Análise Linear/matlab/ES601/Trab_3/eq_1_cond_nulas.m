clc 

t = out.tout
y = 1 - exp(-10*t);

plot(out.tout, out.simout, "r-", t, y, "bo");
legend("Simulink", "Analítica")