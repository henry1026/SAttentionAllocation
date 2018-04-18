function [Group]=Initial(N,P)
Group=zeros(P,N);
x=1:N-1;
for i=1:P
    Group(i,1:N-1)=x(randperm(numel(x)));
end
Group(1,1:N-1)=x;