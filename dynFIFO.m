lamata=0.2;
for outloop=1:30
%for jj=1:10
    st=1;
    et=5;
    opx=0.7;

    quitflag=0;
    sumf=0;%���ջر�
    %�������Ա�Ĺ���ʱ���ͻر�
    reops=zeros(1,80);
    for ii=1:20%���Ĳ���ÿ��10������
        if(et>=40)
            et=40;
            quitflag=1;
        end
        task=param(:,st:et);
        %opx=opxs(:,st);%��һ�׶β���Ա������
        group=1:et-st+1;
        [ReOps]=DP(group,task,opx);
        sumf=sumf+ReOps(1);
        reops(st:et)=ReOps(2:et-st+2);
        reops(40+st:et+40)=ReOps(et-st+3:2*(et-st)+3);
        opleft=reops(st:et)+reops(40+st:et+40);
        %��һ�׶�״̬����
        opx=ReOps(2*(et-st)+4);
        st=et+1;
        tempt=sum(opleft);
        et=et+floor(tempt*lamata);
        if(quitflag==1)
            break;
        end
    end
    sumff(outloop)=sumf;
%end
lamata=lamata+0.1;
end