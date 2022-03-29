clc;
clearvars;
a=20/1000;
b=100/1000;
c=0;
omega_2 = (2*pi*1500)/60;
count=0;
for i=[0:30:360]
 count= count+1;
 th21 = i;
 th31(count)= asind((c-a*sind(th21))/b);
 d(count)= (a*cosd(th21) + b*cosd(th31(count)));
 omega_3(count) = (-1*a*cosd(th21)*omega_2)/(b*cosd(th31(count)));
 linear_velocity(count) = (-1*a*sind(th21)*omega_2) -(b*sind(th31(count))*omega_3(count));
 tr(count) = 90 - th31(count);
 alpha2=0;
 alpha3(count)=(b*omega_3(count)^2*sind(th31(count))+a*omega_2^2*sind(th21)-a*alpha2*cosd(th21))/(b*cosd(th31(count)));
 disp(count)=-a*alpha2*sind(th21)-a*omega_2^2*cosd(th21)-b*alpha3(count)*sind(th31(count))-b*omega_3(count)^2*cosd(th31(count));
end
th31 = th31.';
omega_3 = omega_3.';
linear_velocity = linear_velocity.';
tr=tr.';
d=d*1000;
d=d.';
alpha3=alpha3.'
disp=disp.'