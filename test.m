close all;
clearvars;
orbit = [-4659270.437, -5050283.291, 6002.823, -711.956648, 665.817228, 7557.620520];
r = orbit(1:3); % position of the satellite
v = orbit(4:6); % velocity of the satellite
h = 1; % step period
last = 10000; % length of simulation
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

%% data visualization
figure(1);
set(gcf,'Position',[100, 100, 800, 400]);
plot(orb(:, 1:3));
legend('rx', 'ry', 'rz');

figure(2);
set(gcf,'Position',[100, 100, 800, 400]);
plot(orb(:, 4:6));
legend('vx', 'vy', 'vz');

figure(3);
set(gcf,'Position',[100, 100, 800, 400]);
plot(kpl(:, 6));

%% after works -- data examination
% changing of Keplerian orbits
for i = [1:6]
    dkpl(i) = max(kpl(:, i)) - min(kpl(:, i));
end
