R = 1*10^3
C = 2000*10^-6

t = out.tout
vc_t = 10 - 10*exp(-1/2*t)

plot(out.tout, out.simout, "k-", out.tout, vc_t, "bo")
legend('Simulink','Analitica')