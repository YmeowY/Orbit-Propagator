% load('kpl');
% load('orb');
% load('stk_kpl_2b');
% load('stk_rv_2b');
% 
% for i = 1:6
%     ddkpl(i) = max(kpl(:, i)) - min(kpl(:, i));
% end
% %% dkpl
% kpl_1min = [];
% for i = 1:50000
%     if rem(i, 60) == 0
%         kpl_1min = [kpl_1min; kpl(i, :)];
%     end
% end
% 
% len = length(kpl_1min);
% kpl_1min(:, 3:6) = kpl_1min(:, 3:6) * 180 / pi;
% 
% stk_kpl_2b_ = [stk_kpl_2b(2:(len+1), 1:5), stk_kpl_2b(2:(len+1), 6)];
% dkpl = stk_kpl_2b_ - kpl_1min;
% 
% for i = 1:len
%     if dkpl(i, 6) > 300
%         dkpl(i, 6) = dkpl(i, 6) - 360;
%     end
% end
% 
% %% dr_v
% rv_1min = [];
% for i = 1:50000
%     if rem(i, 60) == 0
%         rv_1min = [rv_1min; orb(i, :)];
%     end
% end
% 
% len = length(rv_1min);
% stk_rv_2b_ = stk_rv_2b(2:(len+1), :);
% drv = stk_rv_2b_ - rv_1min;
% 
% num = 1;
% 
% %% [r, v]
% figure(num);
% set(gcf,'Position',[100, 100, 800, 400]);
% plot(drv(:, 1:3));
% legend('drx', 'dry', 'drz');
% xlabel('t(min)');
% ylabel('m');
% 
% num = num + 1;
% figure(num);
% set(gcf,'Position',[100, 100, 800, 400]);
% plot(drv(:, 4:6));
% legend('dvx', 'dvy', 'dvz');
% xlabel('t(min)');
% ylabel('m/s');


% kplt = [6878137, 0.001, 97.4064 * pi /180, 227.481 * pi /180, 0, 0];
% kpls = [];
% orbit = [-4659270.437, -5050283.291, 6002.823,...
%     -711.956648, 665.817228, 7557.620520];
% orbits = [];
% h = 1;
% len = 10000;
% for t = 0:h:len
%     kpls = [kpls; kplt];
%     kplt = Prop_KplOrbits(t, kplt, h);
%     orbits = [orbits; orbit];
%     [orbit(1:3), orbit(4:6)] = kpl2rv(kplt);
% end
orbits = [];
for i = 1:10000
    [orbit(1:3), orbit(4:6)] = kpl2rv(kpl(i,:));
    orbits = [orbits; orbit];
end

