clearvars;
%% example source
% awaiting for proofing
orbit = [-4659270.437, -5050283.291, 6002.823,...
    -711.956648, 665.817228, 7557.620520];

% example of Spacecraft Dynamics and Control. P38
orbit = [-10121e3, -308.219e3, 2281.8e3,...
    -1.929e3, -6.184e3, -1.727e3];

%% pre-works
r = orbit(1:3); % position of the satellite
v = orbit(4:6); % velocity of the satellite
h = 1; % <---------------------- step period -------------
last = 50000; % <--------------- length of simulation ----
orb = []; % save data of orbits

%% orbit propagate
for i = [1:last]
    [r, v] = orbitProp_J2(r, v, h);
    orb = [orb; r, v];
end

%% calculate Keplerian orbits from r_v
kpl = [];
for i = [1:last]
    tmp = vr2kpl(orb(i, :));
    kpl = [kpl; tmp];
end

%% after works -- data examination
% changing of Keplerian orbits
for i = [1:6]
    dkpl(i) = max(kpl(:, i)) - min(kpl(:, i));
end

save('orb', orb);
save('kpl', kpl);