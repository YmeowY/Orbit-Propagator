orbit = [-4659270.437, -5050283.291, 6002.823, -711.956648, 665.817228, 7557.620520];
r = orbit(1:3);
v = orbit(4:6);

%
h = 1;
last = 10000;
orb = [];
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

figure(1);
set(gcf,'Position',[100, 100, 800, 400]);
plot(orb(:, 1:3));
legend('rx', 'ry', 'rz');

figure(2);
set(gcf,'Position',[100, 100, 800, 400]);
plot(orb(:, 4:6));
legend('vx', 'vy', 'vz');

kpl = [];
for i = [1:last]
    tmp = vr2kpl(orb(i, :));
    kpl = [kpl; tmp];
end

figure(3);
set(gcf,'Position',[100, 100, 800, 400]);
plot(kpl(:, 1));


da = max(kpl(:,1)) - min(kpl(:,1))

