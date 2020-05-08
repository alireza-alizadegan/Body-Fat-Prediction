function ktilde=ktilde(x)
global x_train
for i=1:n
        sum2=0;
        for r=1:n
            sum2=sum2+gaus_ker(x_train(i),x_train(r));
        end
        sum3=0;
        for s=1:n
            sum3=sum3+gaus_ker(x_train(s),x);
        end
        sum45=0;
        for r=1:n
            for s=1:n
                sum45=sum45+gaus_ker(x_train(r),x_train(s))
            end
        end
        ktilde(i)=gaus_ker(x_train(i),x)-1/n*sum2-1/n*sum3+1/n^2*sum45;
end
end
