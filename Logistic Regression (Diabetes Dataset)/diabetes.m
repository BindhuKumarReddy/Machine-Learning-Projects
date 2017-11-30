%% Bindhu Kumar Reddy 
% 0029054149
% Problem 2
clear all;
clc
close all;

load('diabet2.mat');
train_set = X1';
train_label = Y1';
test_set = X1';
test_label = train_label;

% cliassify the testing set 
train_scale = size(train_set);
test_scale = size(test_set);
test_classify_label = zeros(test_scale(1),1);

for i=1:test_scale(1)
    test_point = test_set(i,:);
    dist = zeros(train_scale(1),1);
    for j=1:train_scale(1)
        % calculate the distance between test point i and train point j
        train_point = train_set(j, :);
        tmp = test_point - train_point;
	    dist(j) = sqrt(sum(tmp.*tmp)); %eucledian distance
    end
    [val,ind]=sort(dist);
    test_temp(i)=mode(Y1(ind(1:3)));
end
test_temp=test_temp';

accur=0;
% calculate accuracy
for i=1:384
    if test_temp(i)==train_label(i)
        accur=accur+1;
    else
        accur=accur+0;
    end
end

disp('the accuracy is using 3 nearest neighbhours is')
accuracy = accur / test_scale(1);
disp(accuracy);
%% predicting the output
% classify the testing set 
train_set = X2';
train_label = Y1';
test_set = X1';
test_label = train_label;
train_scale = size(train_set);
test_scale = size(test_set);
test_classify_label = zeros(test_scale(1),1);

for i=1:test_scale(1)
    test_point = test_set(i,:);
    dist = zeros(train_scale(1),1);
    for j=1:train_scale(1)
        % calculate the distance between test point i and train point j
        train_point = train_set(j, :);
        tmp = test_point - train_point;
	dist(j) = sqrt(sum(tmp.*tmp)); %eucledian distance
    end
    [val,ind]=sort(dist);
     my_out(i)=mode(Y1(ind(1:3)));
end
Y2_prob2=my_out';

