function [Group,op]=Fitness(Group,Task,opx)
[P,N]=size(Group);
%costt=[Task(4,:);Task(4,:);Task(4,:);Task(4,:)];
op=zeros(P,2+(N-1)*2);
for i=1:P
    op(i,:)=DP(Group(i,1:N-1),Task,opx);
    Group(i,N)=op(i,1);
end

