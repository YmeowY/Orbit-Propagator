function [dr, dv] = CALdr_v(r, v, ha)
% calculate [dr, dv] with [r, v] and ha
% [r, v]: position and velocity
% ha: step
%% global variables
J2 = 1.0826e-3; % geopotential variable of earth
J2 = 0; % set to 0 for 2 body mode
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
A_J2 = 0.5 * J2 * Re ^ 2;

a_J2(1) = mu * A_J2 * (15 * x * z ^ 2 / (R ^ 7) - 3 * x / (R ^ 5));
a_J2(2) = mu * A_J2 * (15 * y * z ^ 2 / (R ^ 7) - 3 * y / (R ^ 5));
a_J2(3) = mu * A_J2 * (15 * z ^ 3 / (R ^ 7) - 9 * z / (R ^ 5));

dv = a_2body + a_J2;

end