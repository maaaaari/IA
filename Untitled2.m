hold off
P1=rand(2,15)
P2=rand(2,15)
I1=[3.5*ones(1,15);6.5*ones(1,15)]
I2=[6.5*ones(1,15);3.5*ones(1,15)]
C1=P1+I1
C2=P2+I2
plot(C1,C2,'+r')
net=newc([3.5 7.5;3.5 7.5],2)
w=net.IW{1}
net.trainParam.epochs=150
C=[C1 C2]
net=train(net,C)
w=net.IW{1}
hold on; plot(w(1,:),w(2,:),'*g')
Y=sim(net,[4;5])
Yc=vec2ind(Y)