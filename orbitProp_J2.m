function [r_new, v_new] = orbitProp_J2(r, v, h)
% using 4th order Runge-Kutta
% [r, v]: position and velocity
% h: step
%% k1
ha = 0;
r_v = [r, v];
[dr, dv] = CALdr_v(r_v(1:3), r_v(4:6), ha);
k1 = [dr, dv];

%% k2
ha = 0.5 * h;
r_v = [r, v] + k1 * ha;
[dr, dv] = CALdr_v(r_v(1:3), r_v(4:6), ha);
k2 = [dr, dv];

%% k3
ha = 0.5 * h;
r_v = [r, v] + k2 * ha;
[dr, dv] = CALdr_v(r_v(1:3), r_v(4:6), ha);
k3 = [dr, dv];

%% k4
ha = h;
r_v = [r, v] + k3 * ha;
[dr, dv] = CALdr_v(r_v(1:3), r_v(4:6), ha);
k4 = [dr, dv];

%% calculate r_v
dr_v = (k1 + 2 * k2 + 2 * k3 + k4) / 6;
r_v = [r, v] + dr_v * h;
%
r_new = r_v(1:3);
v_new = r_v(4:6);
end