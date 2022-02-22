%predicción a un instante de muestreoooo
clear, close all
clc

time=0:0.05:10;
r=0.5+sin(time*2*pi);

%inicialización aleatoria de pesos y bias
S=1; %neurona adaline
R=5; %número de entradas
W=rands(R,1)';
b=rands(S,1)';

%valores inciales de pesos y bias
weights_W= cat(3,W);
bias_b=cat(3,b);
eta=0.1; %ganancia de entrenamiento
for i= 5: length(r)-1
    %primer estímulo
    x=[r(i) r(i-1) r(i-2) r(i-3) r(i-4)]';
    y=W*x+b;
    dr_est(i+1)=y;
    r_est(i+1)=dr_est(i+1)+r(i); %predicción
    
    %error
    e=r(i)-r(i-1)-dr_est(i);
    
    %ley de adaptación de pesos
    W=W+eta*e*x';b=b+eta*e;
    
    %almacenamiento de pesos y bias
    Weights_W=cat(3, weights_W,W);
    bias_b=cat(3,bias_b,b);
end

disp('Valores finales de pesos y bias:'); W, b

%graficamos las señales
figure(1), hold on
plot(time,r_est,'r'),plot(time,r,':')
title(['Señal real y predicción \eta=' num2str(eta)])
xlabel('Tiempo')

figure(2), plot(e)
plot(time,r_est,'r'),plot(time,r,':')
title(['Error de predicción \eta=' num2str(eta)])
hold on, plot(time, r-r_est)
xlabel('Tiempo')

hold off

%evolución de los pesos

figure(3)
for k = 1:R
    x = weights_W(1,k,:);
    plot(x(:))
    hold on
end
xlabel('muestras')
hold off
title(['Varaciaciónde los pesos,  \eta = ' num2str(eta)])

%curva del bias
figure(4), plot(bias_b(:))
title(['Bias,  \eta = ' num2str(eta)])
xlabel('Muestras')

