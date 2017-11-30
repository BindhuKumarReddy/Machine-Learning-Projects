%bindhu Kumar Reddy 
%PUID :0029054149
%October 2016

% Multivariate logistic Regression

data = load('ex2data1.txt');
x = data(:, [1, 2]); y = data(:, 3); % y has values of 0 and 1.
scatter(x(:,1),x(:,2),'k+')
hold on
for i=1:100
if(not(y(i)))
plot(x(i,1),x(i,2),'yo',...
'LineWidth',1,...
'MarkerSize',7,...
'MarkerEdgeColor','k',...
'MarkerFaceColor',[1,1,0])
end
end
xlim([30,100]);
ylim([30,100]);
xlabel('Exam 1 score');
ylabel('Exam 2 score');
legend('Admitted','Not Admitted')
hold off
m=length(y);
n=2;
b=mean(x);
c=std(x);
for j=1:2;
for i=1:m;
x(i,j)=(x(i,j)-b(1,j))./c(1,j);
end
end
x=[ones(m,1),x];
alpha=0.1;
theta=zeros(n+1,1);
h_theta=1./(1+exp(-x*theta));
j=-1/100*sum((y.*log(h_theta))+((1-y).*log(1-h_theta))) ;
fprintf('the initial value of cost function is')
disp(j)
iterations=1000;
for i=1:iterations;
h_theta=1./(1+exp(-x*theta));
temptheta=((h_theta-y)'*x);
theta=theta - alpha*1/m*temptheta';
j(i)=-1/100*sum((y.*log(h_theta))+((1-y).*log(1-h_theta)));
end
figure()
plot(1:1000,j);
xlabel('iterations');
ylabel('Cost Function');
disp('theta values are:');
disp(theta);
disp('Cost after 400 iterations of logistic regression algorithm\n');
1
disp(j(400));
x=[1,45,85];
h_theta=1./(1+exp(-[1 (45-b(1,1))/c(1,1) (85-b(1,2))/c(1,2)])*theta);
disp('Probability of getting admitted for a student with Exam 1 score
of 45 and Exam 2 score of 85. ')
disp(h_theta)