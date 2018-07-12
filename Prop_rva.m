function [drva] = Prop_rva(t, rva)
%{
% fucntion: use [r, v, a] to perform orbit propagation

% params:
> RVA: [position, velocity, acceleration] in inertial frame.
> t: time

% return:
> dRVA: differentiate of [position, velocity, acceleration].
%}

%% extract [r, v, a]
r = rva(1:3);
v = rva(4:6);
a = rva(7:9);

%% cal Grav & J2
a_Grav = CalForce_Grav(r);
a_J2 = CalForce_J2(r);
%% differetiate relationship
dr = v;
dv = a + a_Grav + a_J2;
% dv = a + a_Grav;
da = [0, 0, 0];

drva = [dr, dv, da];

end