function [x,sigma,qxx,v]=JQzypc(l,B,d,px,r)
%�˺���������Ȩ�ȿ�������ƽ��
   p=1./d;
   p=diag(p);
   N=B'*p*B;
   qx=pinv(px);
   Nm=qx*N*pinv((N*qx*N));
   x=Nm*B'*p*l;
   v=(B*x-l).*1000;
   sigma=sqrt(v'*p*v/r);   %��λȨ�����
   qxx=Nm*N*Nm';    %x��Э������
end