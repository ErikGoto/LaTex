%Matrizes de estado
A = [
    0 0 1 0;
    0 0 0 1;
    -100 100 -10 10;
    100 -200 10 -10
    ];

B = [
    0;
    0;
    1;
    0
    ];

C = [
    1 0 0 0
    ];

D = [
    0
    ];

%Criação do sistema
sys = ss(A, B, C, D);
%Entrada do sistema
t = 0:0.01:5;
u = zeros(size(t));

%Resolve o sistema
%Definindo as Condições iniciais
x0 = [0.1; -0.1; 0; 0];
y = lsim(sys, u, t, x0);
plot(t, y);

%Conversão para a função transferência
[Num, Den] = ss2tf(A, B, C, D);
H = tf(Num, Den);

%A partir da função transferência conseguir o valor das matrizes
[a, b, c, d] = tf2ss(Num,Den)

%--------------------------------------------------------------------------
%Calcular a matriz exponencial por autovalores e autovetores
syms time;
[U, L] = eig(A);
ea = U*diag(exp(diag(L*time)))*inv(U);

%Calcular a matriz exponencial por Cayley-Hamilton
lambda = eig(A);
I = eye(size(A));
alfa = inv(vander(lambda))*exp(lambda);

eACH = real(alfa(1)*A^3 + alfa(2)* A^2 + alfa(3)*A^3 + alfa(4)*A^4)

%Resposta Impulsiva
t = 0:0.1:20;
he = zeros(size(t));

[null, sizeT] = size(t);
for i=1:sizeT
    he(i) = C*expm(A*t(i))*B;
end
sys = ss(A, B, C, D);
h = impulse(sys, t);
plot(t,he, t, h, 'o'); 
