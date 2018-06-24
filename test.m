close all;
clearvars;
orbit = [-4659270.437, -5050283.291, 6002.823, -711.956648, 665.817228, 7557.620520];
r = orbit(1:3); % position of the satellite
v = orbit(4:6); % velocity of the satellite
h = 1; % step period
last = 10000; % length of simulation
orb = []; % save data of orbits

%% 4th order Runge-Kutta
for i = [1:last]
    % k1
    ha = 0;
    r_v = [r, v];
    [dr, dv] = orbitProp_J2(r_v(1:3), r_v(4:6), ha);
    k1 = [dr, dv];
    
    % k2
    ha = 0.5 * h;
    r_v = [r, v] + k1 * ha;
    [dr, dv] = orbitProp_J2(r_v(1:3), r_v(4:6), ha);
    k2 = [dr, dv];
    
    % k3
    ha = 0.5 * h;
    r_v = [r, v] + k2 * ha;
    [dr, dv] = orbitProp_J2(r_v(1:3), r_v(4:6), ha);
    k3 = [dr, dv];
    
    % k4
    ha = h;
    r_v = [r, v] + k3 * ha;
    [dr, dv] = orbitProp_J2(r_v(1:3), r_v(4:6), ha);
    k4 = [dr, dv];
    
    % calculate r_v
    dr_v = (k1 + 2 * k2 + 2 * k3 + k4) / 6;
    r_v = [r, v] + dr_v * h;
    
    % save data
    orb = [orb; r_v];
    
    % refresh r_v
    r = r_v(1:3);
    v = r_v(4:6);
end

%% 1st order Runge-Kutta
% for i = [1:last]
%     r_v = [r, v];
%     [dr, dv] = orbitProp_J2(r_v(1:3), r_v(4:6), h);
%     k1 = [dr, dv];
%     
%     % calculate r_v
%     r_v = [r, v] + k1 * h;
%     
%     % save data
%     orb = [orb; r_v];
%     
%     % refresh r_v
%     r = r_v(1:3);
%     v = r_v(4:6);
% end

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
