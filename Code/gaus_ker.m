function k=gaus_ker(u,v)
sigma=1.5;
k=exp(-1/(2*sigma^2)*norm(u-v)^2);
end
