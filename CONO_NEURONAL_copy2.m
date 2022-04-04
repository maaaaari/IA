[x,y]=meshgrid(-7:0.5:15, -6:0.5:16);
z=7-7.*sqrt((x-4).^2+(y-5).^2)./11;

[r,c]=size(x);

for i=1:r
    for j=1:r
        if z(i,j)<=0
           z(i,j)=0;
        end
    end
end

surf(x,y,z);
P=[]; D=[];

for i=1:r
    for j=1:c
        P=[P,[x(i,j);y(i,j)]];
        D=[D,z(i,j)];
    end
end

%declaración de la neurona

net=newff([-7 15;-6 16],[30,1],{'tansig','purelin'},'trainlm');
net.trainParam.show=50;
net.trainParam.epochs=1500;
net.trainParam.goal=0.00001;
net.trainParam.lr=0.02;

%entrenamiento uno

net=train(net,P,D);

% output=sim(net,P);
% aprox=zeros(r,c);
% k=1;
% for i=1:r
    
