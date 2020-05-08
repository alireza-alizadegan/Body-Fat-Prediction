close all; clear all; clc
load bodyfat_data.mat

n=150;
lambda=3e-3;
d=2;

x_train=X(1:n,:);
y_train=y(1:n);
x_test=X(n+1:end,:);
y_test=y(n+1:end);   
m=numel(y_test);

xbar=sum(x_train,1)/n;
ybar=sum(y_train)/n;

xtilde=x_train-repmat(xbar,[n 1]);
ytilde=y_train-ybar;

O=1/n*ones(n);
for i=1:n
    for j=1:n
        Ktilde(i,j)=gaus_ker(xtilde(i),xtilde(j));
    end
end

yhat_train=ybar+ytilde'*(Ktilde+n*lambda*eye(n))^-1*Ktilde;
yhat_train=yhat_train';
e_train=y_train-yhat_train;
MSE_train=sum(e_train.^2)/98

for i=1:n
    for j=1:m
        Ktildeprime(i,j)=gaus_ker(xtilde(i),x_test(j)-xbar);
    end
end

yhat_test=ybar+ytilde'*(Ktilde+n*lambda*eye(n))^-1*Ktildeprime;
yhat_test=yhat_test';
e_test=y_test-yhat_test;
MSE_test=sum(e_test.^2)/98
