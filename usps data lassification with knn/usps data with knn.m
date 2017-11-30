%% bindhu Kumar Reddy
% 0029054149
%Problem 1
clear all;
clc
close all;

load('usps2.mat');
train_set = x1';
train_label = y1;
train_label(train_label==-1)=0;
test_set = x1';
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
	dist(j) = sqrt(sum(tmp.*tmp));
    end
    
    % find the 5-nearest neighbor 
%     dist_tmp = sort(dist);
    [val,ind]=sort(dist);
    num = zeros(10, 1);
    for k=1:5
%        idx = find(dist==dist_tmp(k));
       temp=train_label(:,ind(k));
       temp_index(k)=find(temp==1);
       
       
%        num(train_label(idx)+1) = num(train_label(idx)+1)+1;
    end
    repeat=mode(temp_index);
    predict_out=zeros(1,10);
    predict_out(repeat)=1;
    my_out(i,:)=predict_out;
    

end

my_out=my_out';
numerator=0;
% calculate accuracy
for i=1:4649
    if sum(my_out(:,i)==train_label(:,i))==10;
        numerator=numerator+1;
    else
        numerator=numerator+0;
    end
end
% num_correct = sum(test_label==my_out');
disp('the accuracy is using 5 nearest neighbhours is')
accuracy = numerator / test_scale(1);
disp(accuracy);
%% classification of test data

clear all
load('usps2.mat');
train_set = x2';
train_label = y1;
train_label(train_label==-1)=0;
test_set = x2';
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
	dist(j) = sqrt(sum(tmp.*tmp));
    end
    
    % find the 5-nearest neighbor 
%     dist_tmp = sort(dist);
    [val,ind]=sort(dist);
    num = zeros(10, 1);
    for k=1:5
%        idx = find(dist==dist_tmp(k));
       temp=train_label(:,ind(k));
       temp_index(k)=find(temp==1);
    end
    repeat=mode(temp_index);
    predict_out=zeros(1,10);
    predict_out(repeat)=1;
    my_out(i,:)=predict_out;
    

end
Y2_prob1=my_out';


