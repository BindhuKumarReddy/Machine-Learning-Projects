%bindhu Kumar Reddy 
%0029054149
%September 2016

% Polynomial Regression

A = xlsread('AutoData_HW1(1).xlsx');
x=A(:,4);
y=A(:,6);
m=length(y);
close all;
x1=x;x2=x.^2;x3=x.^3;
x=[x1 x2 x3];
b=mean(x);
c=std(x);
%feature normalization
for j=1:3;
for i=1:50;
x(i,j)=(x(i,j)-b(1,j))./c(1,j);
end
end
a=ones(m,1);
x=[a x];
alpha=0.1;
theta=[0 0 0 0]';
theta_not=0;
theta_one=0;
theta_two=0;
theta_three=0;
j=99;
for k=1:1000
h=x*theta;
theta_not=theta_not-(alpha)*(1/m)*sum(h-y);
theta_one=theta_one-(alpha)*(1/m)*sum((h-y).*x(:,2));
theta_two=theta_two-(alpha)*(1/m)*sum((h-y).*x(:,3));
theta_three=theta_three-(alpha)*(1/m)*sum((h-y).*x(:,4));
theta=[theta_not theta_one theta_two theta_three ]';
Cost=(0.5/m)*sum(h-y).^2;
j(k)=Cost;
end
min_j=min(j);
x=3100;
x1=x^2;x2=x^3;
x=[1 ((x-b(1,1))./c(1,1)) ((x1-b(1,2))./c(1,2)) ((x2-b(1,3))./
c(1,3))];
h=x*theta
plot(A(:,4),A(:,6),'.')
xlabel('weights of the car')
ylabel('miles per gallon/hypothesis')
hold on;
s=1000:100:6000;
s=s';
x1=s.^2;x2=s.^3;
2
x=[ones(51,1) ((s-b(1,1))./c(1,1)) ((x1-b(1,2))./c(1,2)) ((x2-
b(1,3))./c(1,3))];
plot(s,x*theta,'r')
figure();
plot(1:1000,j)
disp('minimum of j')
disp(min_j)
disp('hypothesis parameters are')
disp(theta)
disp('the predicted output for x=3100 is')
disp(h)