function [J2accel] = CalForce_J2(r)
%{
% fucntion: calculate J2 perturbation acceleration. Spacecraft Dynamics and Control.

% params:
> r: position in ECEF frame(earth centered earth fixed).

% return:
> J2accel: J2 perturbation acceleration
%}
x = r(1);
y = r(2);
z = r(3);

J2 = 1.0826e-3; % geopotential variable of earth
mu = 3.986005e14; % gravitational constant of earth
Re = 6378.1363e3; % radius of earth

% J2 perturbation acceleration
R = norm(r);
A_J2 = 0.5 * J2 * Re ^ 2;

a_J2x = mu * A_J2 * (15 * x * z ^ 2 / (R ^ 7) - 3 * x / (R ^ 5));
a_J2y = mu * A_J2 * (15 * y * z ^ 2 / (R ^ 7) - 3 * y / (R ^ 5));
a_J2z = mu * A_J2 * (15 * z ^ 3 / (R ^ 7) - 9 * z / (R ^ 5));

J2accel = [a_J2x, a_J2y, a_J2z];
end