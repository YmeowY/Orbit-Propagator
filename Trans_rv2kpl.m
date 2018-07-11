function kpl = Trans_rv2kpl(r, v)
% calculate Keplerian with [r, v]. Spacecraft Dynamics and Control. P26
%{
a: semimajor axis
e: eccentricity
i: inclination
W: right ascension of ascending node
w: argument of perigee
M: mean anomaly
%}
%% pre-works
mu = 3.986005e14; % gravitational constant of earth
Re = 6378.1363e3; % radius of earth
R = norm(r);
V = norm(v);

%% a
a = 0.5 * mu / (mu / R - V ^ 2 / 2);

%% h & i
h = cross(r, v);
i = acos(h(3) / norm(h));

%% W
W = atan2(h(1), -h(2));
if W <= 0
    W = W + 2 * pi;
end
%% e
e = sqrt(1 - norm(h) ^ 2 / (mu * a));

%% psi
psi = atan2(dot(r, v) / (e * sqrt(mu * a)), (a - R) / (a * e));

%% M
M = psi - e * sin(psi);
if M <= 0
    M = M + 2 * pi;
elseif M >= 2 * pi
    M = M - 2 * pi;
end

%% w
w = atan2(sin(psi) * sqrt(1 - e * e), cos(psi) - e);

kpl = [a, e, i, W, w, M];
end