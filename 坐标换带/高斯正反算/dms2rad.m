function [rad]=dms2rad(dms)
%dms��Ϊ�������
[m,n]=size(dms);
dms=reshape(dms.',1,m*n);         %���Ƕ���Ϊ������
d=fix(dms);
f1=(dms-d).*100;
f=fix(f1);
m=(f1-f).*100;
deg=dms2degrees([d',f',m']);
rad=(deg2rad(deg))';
end