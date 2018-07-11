function [gravAccel] = CalForce_Grav(r)
%{
% fucntion: calculate the gravity acceleration.

% params:
> r: position in inertial frame / or others.

% return:
> gravAccel: gravity acceleration.
%}

mu = 3.986005e14; % gravitational constant of earth

R = norm(r);

gravAccel = mu * (-r) / (R ^ 3);

end