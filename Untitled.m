%neurona adaline, ley windrow-hoff
clear all, close all, clc
%parámetros del modelo que serán identificados
A=conv([1 -0.8],[1 0]); B=[1 -0.5];
%señal de entrada PRBS (length 1023)
u=(-1).^(1:10);
N=500; %Número de puntos
for i = 11:N
u(i)=-u(i-7)*u(i-10);
end
y=(dlsim(B,A,u))';
%inicialización de pesos y bias
W=rands(1,3);
b=rands(1,1);
weights_W=cat(3,W);
bias_b=cat(3,b);
eta=0.09; %ganacia de entrenamiento
for i = 3:length(u)-1
    p=[y(i-1) u(i-1) u(i-2)]';
    
    %neurona de salida
    o=W*p+b;
    %Error
    e=y(i)-o;
    
    %variación de pesos y bias
    %[dw,db]=learnwh(p,e,eta); (No funciona)
dw=eta*p'*e;
db=eta*e;
%ley  de adaptació de pesos W y b bias
W=W+dw;
b=b+db;
%almacenamiento pesos y bias
weights_W= cat(3,weights_W,W);
bias_b=cat(3,bias_b,b);
end
disp('Valor final de pesos y bias');
W,b

%graficamos la variación en el tiempo de los pesos
for k=1:3
    x = weights_W(1,k,:);
    plot(x(:)), hold on
end
eta=num2str(eta);
title(['Pesos W y Bias b, \eta= ' eta])
xlabel('muestras')
plot(bias_b(:),':')
    


    

