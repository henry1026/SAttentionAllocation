lamata=1;
% for outloop=1:5
%for jj=1:100%100��ͳ��
    st=1;
    et=5;
    opx=0.7;
    schere=zeros(4,40);
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

        [ReOps,Result,ReGroup]=Allocate(task,opx);%������
        sumf=sumf+Result(10);
        reops(st:et)=ReOps(2:et-st+2);
        reops(40+st:et+40)=ReOps(et-st+3:2*(et-st)+3);
        opleft=reops(st:et)+reops(40+st:et+40);
        schere(ii,1:et-st+2)=ReGroup;
        %��һ�׶�״̬����
        opx=ReOps(2*(et-st)+4);
        st=et+1;
        tempt=sum(opleft);
        et=et+floor(tempt*lamata);
        if(quitflag==1)
            break;
        end
    end
     sumff(jj)=sumf;
 %end
% lamata=lamata+0.2;
% end