%clear all
close all
N=20;

% A entrada
im = sqrt(-1);
T= 0.1;
fo=1/T;
A=100;
i=0;
for k=-N:1:N
    i=i+1;
    if k~= 0
        X(i)=(A*im)/(k*2*3.1415);
    else
        X(i) = A/2;
    end
end
nexttile
stem(abs(X))
title("Fourier da Entrada")

% O sistema
M=1;
K=10000;
C=10;
i=0;
for k=-N:1:N
    i=i+1;
    w=k*2*pi*fo;
    H(i)=1/(-M*w^2+im*C*w+K);
end
nexttile
stem(abs(H))
title("FRF")

% A resposta
Y=H.*X;
nexttile
stem(abs(Y))
title("Resposta na frequência")
t=0:.001:10;
y=zeros(size(t));
i=0;
for k=-N:1:N
    i=i+1;
    y=y+Y(i)*exp(im*2*pi*k*fo*t);
end
figure
plot(t,real(y),out.tout,out.simout, '+')
legend('Script','Simulink')


