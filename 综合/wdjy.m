function [wdd,bwdd]=wdjy(X1,X2,sigma1,sigma2,qxx1,qxx2,r,wzd_count)
%�˺������������Ƿ��ȶ�
 X1=X1.*1000;
 X2=X2.*1000;
  qx1=diag(qxx1,0);
  qx2=diag(qxx2,0);
  wzd_count=wzd_count(1:1);
  t(1:5)=nan;
  for k=1:wzd_count
  t(k)=abs((X1(k)-X2(k))/sqrt(sigma1^2.*qx1(k)+sigma2^2.*qx2(k)));  %����ͳ����
  end
  %����t�����������ȶ��̶�
  f=r+r;                 %�������ɶ�
  tf=icdf('t',0.975,f);  %������fΪ���ɶ�ʱ��tֵ
  i=1;
  j=1;
  wdd(1:size(qx1))=nan;
  bwdd(1:size(qx1))=nan;
  for k=1:wzd_count
      if t(k)>tf        %�ܾ�����,�����ȶ�
        bwdd(i)=k;
        i=i+1;
      end
      if t(k)<=tf
          wdd(j)=k;
          j=j+1;
      end
  end
  bwdd=bwdd(1:i-1);
  wdd=wdd(1:j-1);
end