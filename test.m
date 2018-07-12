rv = [];
for i = 1:length(kpl)
    [r, v] = Trans_kpl2rv(kpl(i, :));
    rv = [rv; r, v];
end