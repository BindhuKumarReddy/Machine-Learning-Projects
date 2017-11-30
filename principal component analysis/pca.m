%bindhu Kumar Reddy 
%PUID :0029054149
%November 2016

% principal component Analysis
load('pcadata1.mat')
x=X;
m=length(x);
a=mean(x);
b=std(x);
for j=1:2
for i=1:m
x(i,j)=(X(i,j)-a(1,j))/b(1,j);
end
end
r=1/m*(x'*x);% coviarnce matrix
[U,S,V]=svd(r);
R1=s(1,1)/(s(1,1)+s(2,2));
u_reduce=u(:,1);
z1=u_reduce'*x';
x_app1=u_reduce*z1;
x_app1=x_app1';
figure();
plot(x_app1(:,1),x_app1(:,2),'y*')
hold on
u_reduce=u(:,2);
z1=u_reduce'*x';
x_app2=u_reduce*z1;
x_app2=x_app2';
plot(x_app2(:,1),x_app2(:,2),'b*')
legend('first principal component','second principal component')
R2=var(x_app1(:,1))/(var(x_app1(:,1))+var(x_app2(:,1)))