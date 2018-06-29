function dkpl = CAL_dkpl(t, kpl)
%{
% function: calculation of dkpl
> kpl = [a, e, i, W, w, M]
> a: semimajor axis
> e: eccentricity
> i: inclination
> W: right ascension of ascending node
> w: argument of perigee
> M: mean anomaly

% params: kpl
> kpl: Keplerian orbits

% return: dkpl
> dkpl: Keplerian orbits differentiate

% ref: <Spacecraft Dynamics and Control> P36
%}

%% pre-works
a = kpl(1);
e = kpl(2);
i = kpl(3);
W = kpl(4);
w = kpl(5);
M = kpl(6);
%
mu = 3.986005e14; % gravitational constant of earth
Re = 6378.1363e3; % radius of earth
J2 = 1.0826e-3; % geopotential variable of earth
%
n = sqrt(mu / a ^ 3); % <--- mean motion

%% da
da = 0;

%% de
de = 0;

%% di
di = 0;

%% dW
num = 3 * n * J2 * cos(i);
den = 2 * (1 - e^2)^2;
dW = -num / den * (Re/a)^2;

%% dw
num = 3 * n * J2 * (1 - 5*cos(i)^2);
den = 4 * (1 - e^2)^2;
dw = -num / den * (Re/a)^2;

%% dM
num = 3 * n * J2 * (3 * cos(i)^2 - 1);
den = 4 * (1 - e^2)^1.5;
dM = n + num / den * (Re/a)^2;

%% merge the result
dkpl = [da, de, di, dW, dw, dM];

end