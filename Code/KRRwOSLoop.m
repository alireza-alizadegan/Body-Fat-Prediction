close all; clear all; clc
load bodyfat_data.mat

n=150;
lambda=3e-3;
d=2;

x_train=X(1:n,:);
y_train=y(1:n);

xbar=sum(x_train,1)/n;
ybar=sum(y_train)/n;

xtilde=x_train-repmat(xbar,[n 1]);
ytilde=y_train-ybar;

%%%%%%%%% Ktilde %%%%%%%%
for i=1:n
    for j=i:n
        sum2=0;
        for r=1:n
            sum2=sum2+gaus_ker(x_train(i),x_train(r));
        end
        sum3=0;
        for s=1:n
            sum3=sum3+gaus_ker(x_train(s),x_train(j));
        end
        sum45=0;
        for r=1:n
            for s=1:n
                sum45=sum45+gaus_ker(x_train(r),x_train(s));
            end
        end
        Ktilde(i,j)=gaus_ker(x_train(i),x_train(j))-1/n*sum2-1/n*sum3+1/n^2*sum45;
        Ktilde(j,i)=Ktilde(i,j);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x_test=X(n+1:end,:);
y_test=y(n+1:end);     


for i=1:numel(y_test)
    yhat_test(i)=ybar+ytilde'*(Ktilde+n*lambda*eye(n))^-1*ktilde(x_test(i));
end

e=y_test-yhat_test;
MSE=sum(e.^2)/98
