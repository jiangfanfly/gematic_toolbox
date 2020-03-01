function [ellipsoid]=get_ellipsoid(n)
%��ȡ�������
%nΪ������,n=1:��������˹������;n=2,IUGG1975����;n=WGS84����;n=4:CGCS2000����
switch n
    case 1
        a=6378245.0;
        b=6356863.0187730473;
        f=1/298.3;
    case 2
        a=6378140.0;
        b=6356755.2881;
        f=1/298.257;
    case 3
        a=6378137.0;
        b=6356752.3142;
        f=1/298.257223563;
    case 4
        a=6378137.0;
        b=6356752.3141;
        f=1/298.257222101;
end
ellipsoid.a=a;
ellipsoid.b=b;
ellipsoid.f=f;
end
