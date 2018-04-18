function [newpop]=Intersect(Group)
[P,N]=size(Group);
% pc=0.3*exp(1-k/P);
pc=0.7;
for i=1:P
    r1 = rand(); 
    newpop(i,:)=Group(i,:);
    %Selmother = floor(rand()*(P-1))+1;  %随机选择母亲
    if(r1<pc)
        InterNum = floor(rand()*(N-1)) + 1;     %随机确定交叉点
        newpop(i,InterNum+1:N-1)=Group(i,1:N-InterNum-1);
        newpop(i,1:InterNum)=Group(i,N-InterNum:N-1);
    end
end