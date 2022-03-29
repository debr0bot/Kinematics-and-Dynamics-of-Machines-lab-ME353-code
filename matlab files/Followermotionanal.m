clc
clear vars

h = 25;
fy = 120*(pi/180);
th1 = (0:120)*(pi/180);
syms th

%SHM
S_shm = (h/2)*(1- cos(pi*th/fy));
V_shm = diff(S_shm,th);
A_shm = diff(V_shm,th);
J_shm = diff(A_shm,th);
s_shm = double(subs(S_shm,th1));
v_shm = double(subs(V_shm,th1));
a_shm = double(subs(A_shm,th1));
j_shm = double(subs(J_shm,th1));

%Cycloid
S_cyc = (h)*((th/fy) - (1/(2*pi))*sin(2*pi*th/fy));
V_cyc = diff(S_cyc,th);
A_cyc = diff(V_cyc,th);
J_cyc = diff(A_cyc,th);
s_cyc = double(subs(S_cyc,th1));
v_cyc = double(subs(V_cyc,th1));
a_cyc = double(subs(A_cyc,th1));
j_cyc = double(subs(J_cyc,th1));

%3-4-5
S_345 = (h)*(10*(th/fy)^3 - 15*(th/fy)^4 + 6*(th/fy)^5);
V_345 = diff(S_345,th);
A_345 = diff(V_345,th);
J_345 = diff(A_345,th);
s_345 = double(subs(S_345,th1));
v_345 = double(subs(V_345,th1));
a_345 = double(subs(A_345,th1));
j_345 = double(subs(J_345,th1));

%4-5-6-7
S_4567 = (h)*(35*(th/fy)^4 - 84*(th/fy)^5 + 70*(th/fy)^6 - 20*(th/fy)^7);
V_4567 = diff(S_4567,th);
A_4567 = diff(V_4567,th);
J_4567 = diff(A_4567,th);
s_4567 = double(subs(S_4567,th1));
v_4567 = double(subs(V_4567,th1));
a_4567 = double(subs(A_4567,th1));
j_4567 = double(subs(J_4567,th1));

th1 = th1*(180/pi);

figure(1)
plot(th1,s_shm,'-r',th1,s_cyc,'--k',th1,s_345,'.g',th1,s_4567,':k');
xlabel('CamAngle');
ylabel('FollowerDisplacement');
title('Follower Displacement Analysis For Different Mechanisms');
legend('SHM','Cycloidal','3-4-5','4-5-6-7');
grid on;

figure(2)
plot(th1,v_shm,'-r',th1,v_cyc,'--k',th1,v_345,'.g',th1,v_4567,':k');
xlabel('CamAngle');
ylabel('FollowerVelocity');
title('Follower Velocity Analysis For Different Mechanisms');
legend('SHM','Cycloidal','3-4-5','4-5-6-7');
grid on;

figure(3)
plot(th1,a_shm,'-r',th1,a_cyc,'--k',th1,a_345,'.g',th1,a_4567,':k');
xlabel('CamAngle');
ylabel('FollowerAcceleration');
title('Follower Acceleration Analysis For Different Mechanisms');
legend('SHM','Cycloidal','3-4-5','4-5-6-7');
grid on;

figure(4)
plot(th1,j_shm,'-r',th1,j_cyc,'--k',th1,j_345,'.g',th1,j_4567,':k');
xlabel('CamAngle');
ylabel('FollowerJerk');
title('Follower Jerk Analysis For Different Mechanisms');
legend('SHM','Cycloidal','3-4-5','4-5-6-7');
grid on;



