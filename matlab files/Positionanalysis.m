clc;
clearvars;
crank=50;
coupler=120;
offset=20;
a=crank;
b=coupler;
c=offset;
count=0;
for i=[0:30:360]
    count=count+1;
    th21=i;
    th31(count)=360+asind((c - a*sind(th21))/b);
    disp(count)=a*cosd(th21) + b*cosd(th31(count));
    
    mu(count)=180-acosd(sind(th31(count)));
    
    xmid(count)=a*cosd(th21)+(b/2)*cosd(th31(count));
    ymid(count)=a*sind(th21)+(b/2)*sind(th31(count));
    
    x_off(count)=a*cosd(th21)+(60)*cosd(th31(count)+30);
    y_off(count)=a*sind(th21)+(60)*sind(th31(count)+30);
end
coupler_disp_mu=[th31;disp;mu].'
x_y_mid=[xmid;ymid].'
x_y_off=[x_off;y_off].'