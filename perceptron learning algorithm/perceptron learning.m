%bindhu Kumar Reddy 
%PUID :0029054149
%October 2016

% percepton learning algorithm
clear all
clc
close all
p=[1 3 1;1 3 2; 1 4 1; 1 1 5;1 3 4; 1 2 5];
t=[1 1 1 0 0 0];
theta=[0 0 0];
iterations=5;
for j=1:iterations;
for i=1:5
y =myperceptron(i,theta,p);
e=t(1,i)-y;
theta=theta+e*p(i,:);
z(i)=e;
end
if z(1:5)==0;
disp('the weight vector values are')
disp(theta);
else
j=j+1;
end
end
u1=[1 1 4];u2=[1 4 2];
v1=theta*u1';
v2=theta*u2';
y1=hardlim(v1);
y2=hardlim(v2);
disp('weight vector is')
disp(theta(1,2))
disp(theta(1,3))
disp('the bias value is')
disp(theta(1,1))
disp('classes for u1 and u2 are')
disp(y1)
disp(y2)