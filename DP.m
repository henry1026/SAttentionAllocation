function [returnf]=DP(group,task,opx)
[~, n]=size(task);%n1����������
ftmx=zeros(1,n);%����
frmx=zeros(1,n);%��Ϣ

t=task(:,group);%������4��,����������

f=zeros(n+1,42);%0.5��0.9�ļ��0.02Ϊ21����ǰ21Ϊ�������񣬺�21Ϊִ������
tmx=zeros(n,42);
rmx=zeros(n,42);
indexmx=zeros(n,42);
findex1=zeros(1,n+1);

for i=n:-1:1
    tpara(1)=t(1,i);
    tpara(2)=t(2,i);
    tpara(3)=t(3,i);
    %tpara(4)=0;
    tpara(4)=sum(t(4,i:n));
    [f(i,:),tmx(i,:),rmx(i,:),indexmx(i,:)]=stagel(f(i+1,:),tpara);
end
j=(opx-0.5)/0.02+1;
k=round(j);
fchoice=[f(1,k),f(1,k+21)];
[final,i]=max(fchoice);
findex1(1)=k+(i-1)*21;
for i=1:n
    findex1(i+1)=indexmx(i,findex1(i));
    ftmx(i)=tmx(i,findex1(i));
    frmx(i)=rmx(i,findex1(i));
end
if(findex1(n+1)<22)
    opx=0.5+(findex1(n+1)-1)*0.02;
else
    opx=0.5+(findex1(n+1)-22)*0.02;
end

returnf=[final,ftmx,frmx,opx];