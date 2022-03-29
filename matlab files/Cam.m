clear
close all
clc

syms t
r_base = 20;
w = pi/30;

%SHM
h_shm = 20;
fy_shm = 10*w;
th_shm = (0:60)*(pi/180);
s_shm = (h_shm/2)*(1-cos(pi*t/fy_shm));
v_shm = diff(s_shm,t);
s_shm = subs(s_shm,t,th_shm);
v_shm = subs(v_shm,t,th_shm);
fy = th_shm;
v = v_shm;

%DWELL
th_dwell = w*2;
th_dwell_t = linspace(fy(end),fy(end)+th_dwell,15);
s_dwell = s_shm(end).*ones(1,15);
fy = [th_shm th_dwell_t];
s = [s_shm s_dwell];
v_d1 = zeros(1,15);
v = [v_shm v_d1];

%CYCLOIDAL
h = 10;
fy_cyc = 10*w;
th_cyc = linspace(0,fy_cyc,61);
th_cyc_t = th_dwell_t(end) + th_cyc;
s_cyc = s(end) + (h)*((t/fy_cyc) - (1/(2*pi))*sin(2*pi*t/fy_cyc));
v_cyc = diff(s_cyc,t);
s_cyc = subs(s_cyc,t,th_cyc);
v_cyc = subs(v_cyc,t,th_cyc);
s=[s s_cyc];
fy = [fy th_cyc_t];
v = [v v_cyc];

%DWELL
th_dwell = w*3;
th_dwell_t = linspace(fy(end),fy(end)+th_dwell,15);
s_dwell = s(end).*ones(1,15);
fy = [fy th_dwell_t];
s = [s s_dwell];
v_d2 = zeros(1,15);
v = [v v_d2];

%3-4-5
h = -15;
fy_345 = 15*w;
th_345 = linspace(0,fy_345,91);
th_345_t = fy(end) + th_345;
s_345 = s(end) + (h)*(10*(t/fy_345).^3 - 15*(t/fy_345).^4+6*(t/fy_345).^5);
v_345 = diff(s_345,t);
s_345_r = subs(s_345,t,th_345);
v_345_r = subs(v_345,t,th_345);
s = [s s_345_r];
fy = [fy th_345_t];
v = [v v_345_r];

%DWELL
th_dwell = w*4;
th_dwell_t = linspace(fy(end),fy(end)+th_dwell,15);
s_dwell = s(end).*ones(1,15);
fy = [fy th_dwell_t];
s = [s s_dwell];
v_d3 = zeros(1,15);
v = [v v_d3];

%CYCLOIDAL
h = -15;
fy_cyc = 10*w;
th_cyc = linspace(0,fy_cyc,61);
th_cyc_t = th_dwell_t(end)+ th_cyc;
s_cyc = s(end) + (h)*((t/fy_cyc) -(1/(2*pi))*sin(2*pi*t/fy_cyc));
v_cyc = diff(s_cyc,t);
s_cyc_r = subs(s_cyc,t,th_cyc);
v_cyc_r = subs(v_cyc,t,th_cyc);
s = [s s_cyc_r];
fy = [fy th_cyc_t];
v = [v v_cyc_r];

%DWELL
th_dwell = w*6;
th_dwell_t = linspace(fy(end),fy(end)+th_dwell,15);
s_dwell = s(end).*ones(1,15);
fy = [fy th_dwell_t];
s = [s s_dwell];
v_d4 = zeros(1,15);
v = [v v_d4];

plot(fy*180/pi,s)

Dis = s+r_base;
tha = fy*180/pi;

x = Dis.*cosd(tha);
y = Dis.*sind(tha);

x_base = (r_base).*cosd(tha);
y_base = (r_base).*sind(tha);

%pressureangle
al_inline = atand(v./(w*Dis)); % Inline knife
e = 5; %offset
r_f = 5; %roller radius
al_offset = double(atand((v./w).*(Dis./(e.^2 +Dis.^2 - e.*(v./w)))) - atand(e./Dis)); %offset knife
al_roller = atand(v./(w.*(r_f+Dis))); %roller

figure(1)
plot(fy*180/pi,s)
grid on
axis([0 400 -5 33])
xlabel('Cam Angle (Deg) ');
ylabel('Follower Displacement(mm)');
title('T2 - Follower Displacement Graph');

%cam profile in cartesian plane
figure(2)
plot(x,y, '-r',x_base,y_base,'--k')
title('Cam Profile(Cartesian Graph)');

%cam profile in polar coordinate
figure(3)
polar(tha*(pi/180),Dis)
title('T2 - Follower Displacement Graph');
grid on
axis square

t = 0:5:60;
th = w*t*180/pi;
T = ((pi/180)*tha./w)';
A = double([T,tha',s',v',al_inline',al_offset',al_roller']);

disp('Time   Cam angle   Disp.   Vel.   PA(inline)   PA(Offset)   PA(Roller)  ')
disp(A)









































