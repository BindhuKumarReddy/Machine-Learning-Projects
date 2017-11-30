%% knn classification with n=1
% written by :bindhu Kumar reddy
% 0029054149
clc
close all
clear all
load('dataP1c.mat');
X1=X1';X2=X2';
x1_training=X1(:,1);
x2_training=X1(:,2);
x1_test=X2(:,1);
x2_test=X2(:,2);
y1=y1';
figure 
pos=find(y1==1);
neg=find(y1==-1);
plot(x1_training(pos,1),x2_training(pos,1),'+');
hold on
plot(x1_training(neg,1),x2_training(neg,1),'.');
hold off

% nearest neigbhour with n=1 algorithm begins
for i=1:length(x1_training)
    for j=1:length(x1_training)
      dis(j)=sqrt((x1_training(j,1)-x1_test(i,1))^2+(x2_training(j,1)-x2_test(i,1))^2);
    end
    [val,ind]=min(dis);
    y2(i,1)=y1(ind,1);
end
pos=find(y2==1);
neg=find(y2==-1);
figure 
plot(x1_test(pos,1),x2_test(pos,1),'+');
hold on
plot(x1_test(neg,1),x2_test(neg,1),'.');


%% knn with n=3
clc
close all
clear all
load('dataP1c.mat');
X1=X1';X2=X2';
x1_training=X1(:,1);
x2_training=X1(:,2);
x1_test=X2(:,1);
x2_test=X2(:,2);
y1=y1';
figure 
pos=find(y1==1);
neg=find(y1==-1);
plot(x1_training(pos,1),x2_training(pos,1),'+');
hold on
plot(x1_training(neg,1),x2_training(neg,1),'.');
hold off
xlabel('x1_training');
ylabel('x2_training');
title('scatter plot of training data')
for i=1:500
    for j=1:500
      dis(j)=sqrt((x1_training(j,1)-x1_test(i,1))^2+(x2_training(j,1)-x2_test(i,1))^2);
    end
    [a,b]=sort(dis);
    

    if (y1(b(1))+y1(b(2))+y1(b(3))>=1);
        y2(i,1)=1;
    else 
        y2(i,1)=-1;
    end
end
pos=find(y2==1);
neg=find(y2==-1);
figure 
plot(x1_test(pos,1),x2_test(pos,1),'+');
hold on
plot(x1_test(neg,1),x2_test(neg,1),'.');
hold off
xlabel('x1_test');
ylabel('x2_test');
title('knn with n=3');
