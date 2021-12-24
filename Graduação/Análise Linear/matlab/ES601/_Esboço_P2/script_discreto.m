A = [
    0 1;
    0.3 0
    ];
B = [
        0;
        1
    ];
C = [
        0 1
    ];
D = [
        0
    ];

%Resposta ao impulso
k = 0:20;
h = zeros(size(k));
ik = 1;

for ik = 2:21
    h(ik) = C*A^(k(ik)-1)*B;
end

%Usando o impulse
sys = ss(A, B, C, D, 1);
hi = impulse(sys, k);

stairs(k, h, 'o')
hold on;
stairs(k, hi, '-')
hold off;