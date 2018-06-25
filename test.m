load('kpl');
load('orb');
load('stk_kpl_2b');
load('stk_rv_2b');

%% dkpl
kpl_1min = [];
for i = 1:50000
    if rem(i, 60) == 0
        kpl_1min = [kpl_1min; kpl(i, :)];
    end
end

len = length(kpl_1min);
kpl_1min(:, 3:6) = kpl_1min(:, 3:6) * 180 / pi;

stk_kpl_2b_ = [stk_kpl_2b(2:(len+1), 1:5), stk_kpl_2b(2:(len+1), 6)];
dkpl = stk_kpl_2b_ - kpl_1min;

for i = 1:len
    if dkpl(i, 6) > 300
        dkpl(i, 6) = dkpl(i, 6) - 360;
    end
end

%% dr_v
rv_1min = [];
for i = 1:50000
    if rem(i, 60) == 0
        rv_1min = [rv_1min; orb(i, :)];
    end
end

len = length(rv_1min);
stk_rv_2b_ = stk_rv_2b(2:(len+1), :);
drv = stk_rv_2b_ - rv_1min;
