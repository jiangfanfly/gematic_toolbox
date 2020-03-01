function [X,Y,Z]=BLH2XYZ(B,L,H,n)
%��ɴ������ת���ɿռ�ֱ������
%BLH��γ�ȴ�ظߣ�n�������
B=dms2rad(B);
L=dms2rad(L);
ellipsoid=get_ellipsoid(n);
a=ellipsoid.a;
b=ellipsoid.b;
e=(sqrt(a^2-b^2))/a;
e1=(sqrt(a^2-b^2))/b;
V=sqrt(1+(e1.^2).*cos(B).^2);
c=a.^2/b;
N=c./V;
X=(N+H).*cos(B).*cos(L);
Y=(N+H).*cos(B).*sin(L);
Z=(N.*(1-e.^2)+H).*sin(B);
end
