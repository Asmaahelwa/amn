clc
clear
close all
p=[1:100];
t=[p.^2];
% p=repmat(p,1,100);
% t=repmat(t,1,100);
net=newff([1:100],[p.^2],[3 4],{'logsig','purelin'});
net=init(net);
net.divideparam.trainRatio=1;
net.divideparam.testRatio=0;
net.divideparam.valRatio=0;
net.trainparam.lr=0.1;
net.trainparam.min_grad=1e-20;
net.trainparam.goal=1e-30;
net.trainparam.epochs=300;
[net,tr]=train(net,p,t);
plot([1:100].^2,'x')
hold on
plot(round(net(1:100)),'o')
hold on
plot(p,t,'g')
legend('real target','output of net','training samples','Location','northwest')
