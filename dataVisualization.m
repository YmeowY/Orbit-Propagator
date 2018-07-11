close all;
load('kpl');
load('rvas');
%
num = 1;

%% [r, v]
% figure(num);
% set(gcf,'Position',[100, 100, 800, 400]);
% plot(rvas(:, 1:3));
% legend('rx', 'ry', 'rz');
% 
% num = num + 1;
% figure(num);
% set(gcf,'Position',[100, 100, 800, 400]);
% plot(rvas(:, 4:6));
% legend('vx', 'vy', 'vz');

%% Keplerian orbits
kpl(:, 3:6) = kpl(:, 3:6) * 180 / pi;
for i = [1:6]
    num = num + 1;
    figure(num);
    set(gcf,'Position',[100, 100, 800, 400]);
    plot(kpl(:, i));
end
