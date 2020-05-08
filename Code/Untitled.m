close all; clear all; clc
load bodyfat_data.mat

n=150;
lambda=3e-3;
d=2;

x_train=X(1:n,:);
y_train=y(1:n);

for i=1:n
    for j=1:n
        K(i,j)=gaus_ker(x_train(i),x_train(j));
    end
end

for i=1:n
    b(i)=