function [kpl] = vr2kpl(vr)
% calculate Keplerian orbits
%% global variables
miu = 3.986005e14;

%% pre-works
r_vec = vr(1:3)';
v_vec = vr(4:6)';
% 
r = norm(r_vec);
v = norm(v_vec);
vr = r_vec'*v_vec/r;

%% angular momentum
h_vec = cross(r_vec, v_vec);
h = norm(h_vec);

%% inclination
i = acos(h_vec(3) / h);

%% right ascension of ascending node
N_vec = cross([0; 0; 1], h_vec);
N = norm(N_vec);

if N_vec(2) >= 0
    OMEGA = acos(N_vec(1) / N);
else
    OMEGA = 2 * pi - acos(N_vec(1) / N);
end

%% eccentricity
e_vec = 1/miu * ((v*v - miu/r)*r_vec - r*vr*v_vec);
e = norm(e_vec);

%% argument of perigee
if e_vec(3) >= 0
    omega = acos(N_vec'*e_vec / (N*e));
else
    omega = 2*pi - acos(N_vec'*e_vec / (N*e));
end

%% true anomaly
if vr >= 0
    theta = acos(e_vec'*r_vec / (e*r));
else
    theta = 2*pi - acos(e_vec'*r_vec / (e*r));
end

%% semimajor axis <--- a
rp = h*h/miu/(1+e);
ra = h*h/miu/(1-e);
a = 0.5*(ra + rp);

%% mean anomaly
psi = 2 * atan(sqrt((1 - e) / (1 + e)) * tan(0.5 * theta));
M = psi - e * sin(psi);

%% assembling Keplerian orbits
kpl = [a, e, i, OMEGA, omega, M];

end