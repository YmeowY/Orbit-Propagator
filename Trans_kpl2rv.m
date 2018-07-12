function [r, v] = Trans_kpl2rv(kpl)
%{
function: calcalate [r, v] with [a, e, i, W, w, M]
> kpl = [a, e, i, W, w, M]
> a: semimajor axis
> e: eccentricity
> i: inclination
> W: right ascension of ascending node
> w: argument of perigee
> M: mean anomaly

% params: kpl
> kpl: Keplerian orbits

% return: [r, v]
> r: position
> v: velocity

% ref: <Spacecraft Dynamics and Control> P26
% ---> Examined, passed.
%}

%% pre-works
a = kpl(1);
e = kpl(2);
i = kpl(3);
W = kpl(4);
w = kpl(5);
M = kpl(6);
mu = 3.986005e14; % gravitational constant of earth

%% psi <--- eccentric anomaly
psi = M;
for j = 1:20
    psi = M + e * sin(psi);
end

%% n <--- mean motion
n = sqrt(mu / a^3);

%% transfer matrix of [R, V] to [r, v]
AzW = Euler2RotMatrix(3, W);
Axi = Euler2RotMatrix(1, i);
Azw = Euler2RotMatrix(3, w);
A = Azw * Axi * AzW;
A_1 = inv(A);

%% R
X = a * (cos(psi) - e);
Y = a * sin(psi) * sqrt(1 - e^2);
Z = 0;
R = [X; Y; Z];

%% V
temp = a^2 * n / norm(R);
Vx = -temp * sin(psi);
Vy = temp * sqrt(1 - e^2) * cos(psi);
Vz = 0;
V = [Vx; Vy; Vz];

%% [R, V] to [r, v]
r = A_1 * R;
v = A_1 * V;

r = r';
v = v';

end