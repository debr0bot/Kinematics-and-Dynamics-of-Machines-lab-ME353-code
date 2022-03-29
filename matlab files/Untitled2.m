clc;
clearvars;

a=30;
b=50;
c=45;

count=0;
for i=[0:30:360]
    count= count+1;
    th21 = i;
    th31(count)= asind((c*sind(55)-a*sind(th21))/b);
    d(count)= (a*cosd(th21) + b*cosd(th31(count)) - c*cosd(55));
    tr(count) = 90 - th31(count);
end

th31 = th31.';
tr=tr.';
d=d.';