function Mat = Euler2RotMatrix(axis, angle)
%{
% function: calculate Rotation matrix from Euler Angle

% params:
> axis: the specific axis
> angle: Euler angle

% return:
> Mat: rotation matrix
%}
% Since the function <eul2rotm> is down in R2017a.
% I have to write one by myself.
switch axis
    case 1
        Mat = [1, 0, 0;...
            0, cos(angle), sin(angle);...
            0, -sin(angle), cos(angle)];
    case 2
        Mat = [cos(angle), 0, -sin(angle);...
            0, 1, 0;...
            sin(angle), 0, cos(angle)];
    case 3
        Mat = [cos(angle), sin(angle), 0;...
            -sin(angle), cos(angle), 0;...
            0, 0, 1];
    otherwise
        Mat = 0;
        % generate error
end
end