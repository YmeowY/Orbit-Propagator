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
W = atan2(h(1), -h(2));
if W <= 0
    W = W + 2 * pi
end
%% e
e = sqrt(1 - norm(h) ^ 2 / (mu * a));

%% psi
psi = atan2(dot(r, v) / (e * sqrt(mu * a)), (a - R) / (a * e));

%% M
M = psi - e * sin(psi);

%% w
X = r(1);
Y = r(2);
Z = r(3);
x = a * (cos(psi) - e);
y = a * sin(psi) * sqrt(1 - e ^ 2);

theta = atan2(y / R, x / R);
w_theta = atan2(Z / (R * sin(i)), (X * cos(W) + Y * sin(W)) / R);
w = w_theta - theta;
if w >= pi
    w = w - 2 * pi;
else if w <= -pi
    w = w + 2 * pi;
end

kpl = [a, e, i, W, w, M];
end