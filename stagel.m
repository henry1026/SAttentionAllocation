%lΪ�׶Σ�fΪÿһ�׶ε����Ž⣬ymxΪ���׶����Ž⣬tmx��rmxΪ��Ӧ�Ĺ�����Ϣʱ��
%indexmxΪ���Ž��Ӧ����һ�׶εĹ�����������

function [ymx,tmx,rmx,indexmx]=stagel(f,task)

a=task(2);
b=task(3);
c=task(4);
w=task(1);
for i=0:20
    xi=0.5+i*0.02;
    for j=0:20
        xi1=0.5+j*0.02;
        [y1,tmx1(j+1),rmx1(j+1)]=fmax(a,b,c,w,xi,xi1);
        ymx1(j+1)=y1+f(j+1);%-r*(tmx1(j+1)+rmx1(j+1));
        ymx1(j+22)=y1+f(j+22);%-r*(tmx1(j+1)+rmx1(j+1));
        tmx1(j+22)=tmx1(j+1);
        rmx1(j+22)=rmx1(j+1);
    end
    [ymx(i+1),k]=max(ymx1);
    tmx(i+1)=tmx1(k);
    rmx(i+1)=rmx1(k);
    indexmx(i+1)=k;%��¼�켣

    fchoice=[f(i+1),f(i+22)];%z=0,Ѱ����������ͬ��
    [ymx(i+22),k]=max(fchoice);
    tmx(i+22)=0;
    rmx(i+22)=0;
    indexmx(i+22)=i+1+(k-1)*21;%��¼�켣
end
        