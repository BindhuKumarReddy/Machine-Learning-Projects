%bindhu Kumar Reddy 
%0029054149
%September 2016


% linear Regression
A = xlsread('AutoData_HW1(1).xlsx');
x = A(:,4);
y = A(:,6);
x=x./1000;
plot(x,y,'b.');
xlabel('weights of each car')
ylabel('miles per gallon/predicted outputs through hypothesis
function')
hold on
m=length(y);
x= [ones(m, 1), x];
theta=[0 0]';
alpha=0.1;
theta_zero=0;
theta_one=0;
n=1000;%number of iterations
for k=1:n;
h_vec=x*theta ;
theta_zero=theta_zero-alpha*1/m*sum(h_vec-y);
theta_one=theta_one-alpha*1/m*sum((h_vec-y).*x(:,2));
theta=[theta_zero theta_one]';
cost=0.5/m*sum(h_vec-y).^2;
j(k)=cost;
end
min_j=min(j);
plot(x,h_vec);
figure()
plot(1:1000,j,'r');
ylabel('cost function')
x=3.100;%normalized by dividing x with 1000
h=theta_zero+theta_one*x;
disp('predicted output is');
disp(h);
disp('minimum of cost function is')
disp(min_j)
disp('hypothesis parameters are')
disp(theta)