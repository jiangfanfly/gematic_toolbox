function [n,deta,rr,t]=cucha(v,r,N,B,d,cd_count)
%n�ֲ�����·�ߺţ�deta�ֲ��������rrƽ�����ӣ�tͳ����
s=1./d;
p=diag(s);
qxx=pinv(N);
qll=B*qxx*B';
qvv=pinv(p)-qll;
J=B*pinv(N)*B'*p;
I=ones(cd_count);
rr=I-J;                %��ƽ������
qvv=diag(qvv);
tf=icdf('t',0.975,r-1);
for i=1:cd_count
    s=sqrt((v'*p*v-v(i)^2/qvv(i))/(r-1));
    t(i)=v(i)/(s*sqrt(qvv(i)));
end
n=nan;deta=nan;
for i=1:cd_count
    if abs(t(i))>tf
    n=i;                   %�õ��ֲ����ڹ۲�·�ߺ�
    z=rr(i,i);
    deta=v(i)/z       %��ֲ������
    end
end
end



        