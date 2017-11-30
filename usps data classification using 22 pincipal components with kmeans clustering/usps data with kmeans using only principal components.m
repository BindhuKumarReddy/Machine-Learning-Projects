%% Name: Bindhu Kumar Reddy Pulyala
% 0029054149
% problem-3
% pca
clc
close all
clear all
load('usps2.mat')
% principal component analysis
y1(y1==-1)=0;
x=[x1 x2];
[coef,score,latent,t2]=pca(x');
princ_compo=score(:,1:22);
train_d_pc=princ_compo;
for i=1:length(y1)
    train_label(i)=find(y1(:,i)==1);
end

% k-means clustering
[cluster_no]=kmeans(train_d_pc,10);
combining=[train_label' cluster_no(1:4649)];
b=zeros(10,4649);
predict_out=zeros(10,4649);
for j=1:10
    temp=find(combining(:,1)==j);
    a=mode(combining(temp,2));
    inde=find(combining(:,2)==a);
    a_array(j)=a;
    
    b(j,inde)=1;
   
end
accur=0;
for i=1:4649
    if find(b(:,i)==1)==find(y1(:,i)==1)
        accur=accur+1;
    else
        accur=accur+0;
    end
end
accur=(accur/4649)*100
% predicting y2
y2=zeros(10,4649);
for j=1:4649
    a=a_array(1:10)==cluster_no(j+4649);
    ind=find(a==1);
    y2(ind,j)=1;
end