function [newpop]=Select(Group,c)
[P,N]=size(Group);
A=Group(:,N);
b=A(:);
Group(:,N)=b'./c;
totalfit=sum(Group(:,N));
fitvalue=cumsum(Group(:,N))/totalfit;
ms=sort(rand(P,1));        %��С�������У���"rand(px,1)"������һ�������������̶���ʽ�ı�ʾ��������С��������
fitin=1;                         %fivalue��һ������fitin����������Ԫ��λ����fitvalue(fitin)�����fitin������ĵ������屻ѡ��ĸ���
newin=1;                         %ͬ��
while newin<=P
      if (ms(newin))<fitvalue(fitin)    %ms(newin)��ʾ����ms�������е�"newin"λ��ֵ��ͬ��fitvalue(fitin)
          newpop(newin,:)=Group(fitin,:); %��ֵ ,��������Ⱥ�еĵ�fitin�����屣������һ��(newpop)
          newin=newin+1;
      else
          fitin=fitin+1;
      end
end
