lamata=1;
% for outloop=1:5
%for jj=1:100%100次统计
    st=1;
    et=5;
    opx=0.7;
    schere=zeros(4,40);
    quitflag=0;
    sumf=0;%最终回报
    %保存操作员的工作时长和回报
    reops=zeros(1,80);
    for ii=1:20%分四步，每次10个任务
        if(et>=40)
            et=40;
            quitflag=1;
        end
        task=param(:,st:et);
        %opx=opxs(:,st);%下一阶段操作员利用率

        [ReOps,Result,ReGroup]=Allocate(task,opx);%分配结果
        sumf=sumf+Result(10);
        reops(st:et)=ReOps(2:et-st+2);
        reops(40+st:et+40)=ReOps(et-st+3:2*(et-st)+3);
        opleft=reops(st:et)+reops(40+st:et+40);
        schere(ii,1:et-st+2)=ReGroup;
        %下一阶段状态更新
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