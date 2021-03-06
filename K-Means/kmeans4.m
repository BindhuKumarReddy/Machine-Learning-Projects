%bindhu Kumar Reddy 
%PUID :0029054149
%November 2016

%Kmeans clustering with 4 centroids
clc
close all
clear all
load('KmeansDat');
x1=X(:,1);
x2=X(:,2);
x=[x1 x2];
m=length(X);
iterations=200;
u=[1 1;3 3;6 3;6 5];
figure();
plot(x1,x2,'*',1,1,'s',3,3,'d',6,3,'p',6,5,'h');
xlabel('x1');
ylabel('x2');
title('scatter plot with initial centroids');
figure();
for i=1:iterations
t=1;
s=1;
r=1;
z=1;
for j=1:m
A=[sqrt((x(j,:)-u(1,:))*(x(j,:)-u(1,:))') sqrt((x(j,:)-
u(2,:))*(x(j,:)-u(2,:))') sqrt((x(j,:)-u(3,:))*(x(j,:)-u(3,:))')
sqrt((x(j,:)-u(4,:))*(x(j,:)-u(4,:))')];
d(j)=sum(A);
[val, ind]=min(A);
c(j)=ind;
if c(j)==1
l(r,:)=x(j,:);
r=r+1;
d(j)=A(c(j));
elseif c(j)==2
q(s,:)=x(j,:);
s=s+1;
d(j)=A(c(j));
elseif c(j)==3
n(t,:)=x(j,:);
t=t+1;
d(j)=A(c(j));
else
h(z,:)=x(j,:);
z=z+1;
d(j)=A(c(j));
end
end
u(1,:)=(1/length(l))*sum(l);
u(2,:)=(1/length(q))*sum(q);
u(3,:)=(1/length(n))*sum(n);
4
u(4,:)=(1/length(h))*sum(h);
D(i)=sum(d);
title('final centroids after 10 iterations');
plot(l(:,1),l(:,2),'r*')
hold on
plot(q(:,1),q(:,2),'b*')
hold on
plot(n(:,1),n(:,2),'k*');
hold on
plot(h(:,1),h(:,2),'g*');
hold on
plot(u(1,1),u(1,2),'s');
plot(u(2,1),u(2,2),'d');
plot(u(3,1),u(3,2),'p');
plot(u(4,1),u(4,2),'h');
clear q;
clear l;
clear n;
clear h;
end
figure()
plot(1:iterations,D);
xlabel('iterations');
ylabel('costfunction D');
title('cost function');
disp('the final centroid points are');
disp(u);