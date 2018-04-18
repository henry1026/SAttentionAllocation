function [ReOps,Result,ReGroup]=Allocate(Task,opx)
[~, N]=size(Task);
P=10;%种群
Gen=10;%迭代次数
Group=Initial(N+1,P);
%h=waitbar(0,'wait...');
for i=1:Gen
    [Group,ops]=Fitness(Group,Task,opx);
    totalFitness=sum(Group(:,N+1));
    f=Group(:,N+1)./totalFitness;%归一化处理
    fmax=max(f);
    fmin=min(f);
    
    c=Conn(Group);
    
    tempGroup=Select(Group,c);
    tempGroup=Intersect(tempGroup);
    tempGroup=Mutate(tempGroup,fmax,fmin,1-i/Gen);
    
    [tempGroup,ops1]=Fitness(tempGroup,Task,opx);
    A(1:P)=Group(:,N+1);
    A(P+1:2*P)=tempGroup(:,N+1);
    zGroup(1:P,:)=Group;
    zGroup(P+1:2*P,:)=tempGroup;
    zops(1:P,:)=ops;
    zops(P+1:2*P,:)=ops1;
    [~,ind]=sort(A);%升序排序
%     Group(:,:,1:5)=zGroup(:,:,ind(1:5));
%     Group(:,:,6:P/2)=tempGroup(:,:,6:P/2);
    Group=zGroup(ind(P+1:2*P),:);
    ops=zops(ind(P+1:2*P),:);
    
    tempResult=Group(:,N+1);
    [Result(i),j]=max(tempResult);%这一代中的最优解
    ReGroup=Group(j,:);
    ReOps=ops(j,:);
    %waitbar(i/Gen,h);
end

