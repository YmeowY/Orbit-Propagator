function [dr, dv] = orbitProp_J2(r, v, ha)
% orbit propagator
%% global variables
J2 = 1.0826e-3; % geopotential variable of earth
% J2 = 0; % set to 0 for 2 body mode
mu = 3.986005e14; % gravitational constant of earth
Re = 6378.1363e3; % radius of earth

%% velocity <--- dr
dr = v;

%% acceleration <--- dv
x = r(1);
y = r(2);
z = r(3);
R = norm(r);

% 2 body part
a_2body = mu * (-r) / (R ^ 3);

% J2 part
A_J2 = 3 * J2 * mu * Re ^ 2 / (2 * R ^ 5);

a_J2(1) = A_J2 * (5 * z ^ 2 / R ^ 2 - 1) * x;
a_J2(2) = A_J2 * (5 * z ^ 2 / R ^ 2 - 1) * y;
a_J2(3) = A_J2 * (5 * z ^ 2 / R ^ 2 - 3) * z;

dv = a_2body + a_J2;

end