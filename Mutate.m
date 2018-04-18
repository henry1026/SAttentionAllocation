function [Group]=Mutate(Group,fmax,fmin,m)
[M,N,P]=size(Group);
for i=1:P
%     if(fmax==fmin)
       mutationRate=0.8;
%     else
%         mutationRate=0.2*((fmax-Group(1,N,i))/(fmax-fmin))^m;
%     end
    if(rand()<mutationRate)
        MutNum=floor(rand()*(N-1))+1;
        %MutNum=randint(1,1,[1,N-1]);
        %[a,temp]=max(Group(:,MutNum,i));
        excNum=MutNum+floor(rand()*(N-1))+1;
        %excNum=temp+randint(1,1,[1,M-1]);
        if(excNum>N-1)
            excNum=excNum-N+1;
        end
        a=Group(i,MutNum);
        Group(i,MutNum)=Group(i,excNum);
        Group(i,excNum)=a;
    end
end