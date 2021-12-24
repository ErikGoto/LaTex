
k=0:9;
N=length(k);
for i=1:N   
    %Separação por causa da função degrau u(t-3)
    if i-1<3
        y(i)=60/7*(0.3)^(i-1)+10/7;
    else
       y(i)=60/7*(0.3)^(i-1)+10/7-(60/7*(0.3)^(i-1-3)+10/7);
       
    end
end

%Solução recursiva
yr(1)=10;
for i=2:N
    if i-1<3
        %Separação por causa da função degrau u(t-3)
        yr(i)=0.3*y(i-1)+1;
    else
        yr(i)=0.3*y(i-1);
    end
end
% stairs(k,y)
% hold on
plot(k,y,'o',k,yr,'+')
legend('analitica','recursiva')
% hold off