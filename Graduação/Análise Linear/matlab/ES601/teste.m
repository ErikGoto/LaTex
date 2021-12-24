clc
close all

% A=[
%     0 1;
%     -21.906 -2.1906
% ];
% B=[
%     0;
%     1
% ];
% C=[
%     21.906 2.1906
% ];
% D=[0];
% 
% 
% % N = 1024;
% % T = 0.01;
% % t = 0:T:(N-1)*T;
% % sys = ss(A, B, C, D);
% % h = impulse(sys, t);
% % he = zeros(size(t));
% % figure
% % for i=1:N
% %     he(i) = C*expm(A*t(i))*B;
% % end
% % plot(t, h, t,he, 'o'); 
% 
% 
% N = 2048;
% T = 0.001;
% t = 0:T:(N-1)*T;
% he = zeros(size(t));
% 
% for i=1:N
%     he(i) = C*expm(A*t(i))*B;
% end
% sys = ss(A, B, C, D);
% h = impulse(sys, t);
% plot(t,he, t, h, 'o');
% 
% %--------------------------------------------------------------------------
% [num, den] = ss2tf(A, B, C, D);
% H = tf(num,den);
% 
% %Resposta ao obstáculo
% 
% N = 2048;
% T = 0.001;
% t = 0:T:(N-1)*T;
% u = 0.1*exp(-(t-0.005).^2/0.002^2);
% resp = lsim(sys, u, t);
% resp = resp/sum(u)/T;
% 
% figure
% plot(t, resp, t, h, 'o');
% 
% %Matriz exponencial por Cayley Hamilton
% lambda = eig(A);
% I = eye(size(A));
% syms t;
% alfa = inv(vander(lambda))*exp(lambda*t);
% eACH = real(alfa(1)*A^1+alfa(2)*I);



%-----Questão 2------------------------------------------------------------
A=[
    0 1;
    -0.21906 0
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

sysD = ss(A, B, C, D, 1);
impD = impulse(sysD);
stairs(k, h);
hold on
stairs(k, impD, 's');

%Resposta para entrada nula
u = zeros(size(k));
x0 = [2.1906; 0];

rh = lsim(sysD, u, k, x0);

k = 0:20;
ik = 1;
for ik=1:21
    rHA(ik) = C*A^k(ik)*x0;
end

figure
stairs(k, rh);
hold on
stairs(k, rHA, 'o');





