clc;
clearvars;
%d=Frame,c=Follower,a=Crank,b=Coupler
a=30;
b=45;
c=45;
d=60;
count=0;
for i=[0:30:180]
    count=count+1;
    th21=i;
    k1=d/a;
    k2=d/c;
    k3=(a^2 + c^2 + d^2 - b^2)/(2*a*c);
    A = cosd(th21)-k1-(k2*cosd(th21))+k3;
    B=-2*sind(th21);
    C=k1-((k2+1)*cosd(th21))+k3;
    Dis1=sqrt(B^2-4*A*C);
    op_th41(count)=2*atand((-B-Dis1)/(2*A));
    cr_th41(count)=2*atand((-B+Dis1)/(2*A))+360;
    k4=d/b;
    k5=(c^2-d^2-a^2-b^2)/(2*a*b);
    D=cosd(th21)-k1+k4*cosd(th21)+k5;
    E=B;
    F= k1+(k4-1)*cosd(th21)+k5;
    Det2=sqrt(E^2-4*D*F);
    op_th31(count)=2*atand((-E-Det2)/(2*D));
    cr_th31(count)=2*atand((-E+Det2)/(2*D))+360;
    
    op_trans(count)= op_th41(count) - op_th31(count);
    cr_trans(count)= cr_th41(count) - cr_th31(count)+360;
    
    xmid(count)=a*cosd(th21)+(b/2)*cosd(op_th31(count));
    ymid(count)=a*sind(th21)+(b/2)*sind(op_th31(count));
    
    x_off(count)=a*cosd(th21)+10*cosd((op_th31(count)+45));
    y_off(count)=a*sind(th21)+10*sind((op_th31(count)+45));
    
end
cr_th31=cr_th31.';
cr_th41=cr_th41.';
op_th31=op_th31.';
op_th41=op_th41.';
copy1=[op_th31;op_th41];
copy2=[cr_th31;cr_th41];
copy3=[xmid;ymid].';
copy4=[x_off;y_off].';
copy5=[op_trans;cr_trans].';


