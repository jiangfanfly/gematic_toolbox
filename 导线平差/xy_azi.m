function[dis,azi]=xy_azi[x1,y1,x2,y2]
%%xy_zai���귴�㺯��
%x1��y1�������
%x2��y2�յ�����
%dis����
%azi��λ��
dx=x2-x1;
dy=y2-y1;
tx=atan2(dy,dx);
dis=sqrt(dx.^2+dy.^2);
if (tx<0)
    azi=tx+2*pi;
else
    azi=tx;
end
end