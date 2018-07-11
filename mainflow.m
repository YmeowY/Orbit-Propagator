% close all;
% clearvars;
%% example source
% awaiting for proofing
rva = [-4659270.437, -5050283.291, 6002.823,...
    -711.956648, 665.817228, 7557.620520,...
    0, 0, 0];

% example of Spacecraft Dynamics and Control. P38
% rva = [-10121e3, -308.219e3, 2281.8e3,...
%     -1.929e3, -6.184e3, -1.727e3,...
%     0, 0, 0];

%% pre-works
h = 1; % <---------------------- step period -------------
last = 10000; % <--------------- length of simulation ----
rvas = []; % save data of orbits
f = @Prop_rva;

%% orbit propagate
for i = 1:h:last
    rvas = [rvas; rva];
    rva = RK4(f, i, rva, h);
end

%% calculate Keplerian orbits from [r, v, a]
kpl = [];
last = length(rvas);
for i = 1:last
    r = rvas(i, 1:3);
    v = rvas(i, 4:6);
    tmp = Trans_rv2kpl(r, v);
    kpl = [kpl; tmp];
end
clearvars tmp;

%% save data to files
save('rvas', 'rvas');
save('kpl', 'kpl');