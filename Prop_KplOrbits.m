function kpl_new = Prop_KplOrbits(t, kpl, h)
%{
% function: propagator for Keplerian orbits
> kpl = [a, e, i, W, w, M]
> a: semimajor axis
> e: eccentricity
> i: inclination
> W: right ascension of ascending node
> w: argument of perigee
> M: mean anomaly

% params: kpl, h
> kpl: Keplerian orbits
> h: step

%return: kpl_new
> kpl_new: Keplerian orbits after h
%}
kplProp = @CAL_dkpl;% <--- function handle

kpl_new = RK4(kplProp, t, kpl, h);
for i = 3:6
    if kpl_new(i) >= 2 * pi
        kpl_new(i) = kpl_new(i) - 2 * pi;
    end
end

end