function kpl = rv2kpl(r, v)
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
N = cross([0; 0; 1], h);

if N(2) >= 0
    W = acos(N(1) / norm(N));
else
    W = 2 * pi - acos(N(1) / norm(N));
end

%% e
e = sqrt(1 - norm(h) ^ 2 / (mu * a));

%% psi
psi = atan2((a - R) / (a * e), dot(r, v) / (e * sqrt(mu * a)));

%% M
M = psi - e * sin(psi);

%% w
E = 1 / mu * ((V * V - mu / R)*r - R*(dot(r, v)/ R) * v);
if E(3) >= 0
    w = acos(dot(N, E) / (norm(N) * norm(E)));
else
    w = 2*pi - acos(dot(N, E) / (norm(N) * norm(E)));
end

kpl = [a, e, i, W, w, M];
end