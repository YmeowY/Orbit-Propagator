function [ rout,vout ] = orbprop( rin,vin )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
global ha GM Re J2;
J2 = 1.0826e-3; % geopotential variable of earth
% J2 = 0; % set to 0 for 2 body mode
GM = 3.986005e14; % gravitational constant of earth
Re = 6378.1363e3; % radius of earth
%%
orbTmp(1)=rin(1);
orbTmp(2)=rin(2);
orbTmp(3)=rin(3);
orbTmp(4)=vin(1);
orbTmp(5)=vin(2);
orbTmp(6)=vin(3);
%%
%RK1
orbk(1,1:3)=orbTmp(4:6)*ha;
radius=sqrt(orbTmp(1)*orbTmp(1)+orbTmp(2)*orbTmp(2)+orbTmp(3)*orbTmp(3));
orbk(1,4)=-GM*orbTmp(1)*ha*(1+1.5*J2*(1-5*(orbTmp(3)/radius)^2)*(Re/radius)^2)/(radius*radius*radius);
orbk(1,5)=(-GM*orbTmp(1)*ha*(1+1.5*J2*(1-5*(orbTmp(3)/radius)^2)*(Re/radius)^2)/(radius*radius*radius))*(orbTmp(2)/orbTmp(1));%-GM*orbTmp(2)*ha/(radius*radius*radius);
orbk(1,6)=-GM*orbTmp(3)*ha*(1+1.5*J2*(3-5*(orbTmp(3)/radius)^2)*(Re/radius)^2)/(radius*radius*radius);
a=0.5;
orb=orbk(1,:)*a;
%%
%RK2
orbTmp(1)=rin(1)+orb(1);
orbTmp(2)=rin(2)+orb(2);
orbTmp(3)=rin(3)+orb(3);
orbTmp(4)=vin(1)+orb(4);
orbTmp(5)=vin(2)+orb(5);
orbTmp(6)=vin(3)+orb(6);
orbk(2,1:3)=orbTmp(4:6)*ha;
radius=sqrt(orbTmp(1)*orbTmp(1)+orbTmp(2)*orbTmp(2)+orbTmp(3)*orbTmp(3));
orbk(2,4)=-GM*orbTmp(1)*ha*(1+1.5*J2*(1-5*(orbTmp(3)/radius)^2)*(Re/radius)^2)/(radius*radius*radius);
orbk(2,5)=(-GM*orbTmp(1)*ha*(1+1.5*J2*(1-5*(orbTmp(3)/radius)^2)*(Re/radius)^2)/(radius*radius*radius))*(orbTmp(2)/orbTmp(1));%-GM*orbTmp(2)*ha/(radius*radius*radius);
orbk(2,6)=-GM*orbTmp(3)*ha*(1+1.5*J2*(3-5*(orbTmp(3)/radius)^2)*(Re/radius)^2)/(radius*radius*radius);
% orbk(2,4)=-GM*orbTmp(1)*ha/(radius*radius*radius);
% orbk(2,5)=-GM*orbTmp(2)*ha/(radius*radius*radius);
% orbk(2,6)=-GM*orbTmp(3)*ha/(radius*radius*radius);
orb=orbk(2,:)*a;
%%
%RK3
orbTmp(1)=rin(1)+orb(1);
orbTmp(2)=rin(2)+orb(2);
orbTmp(3)=rin(3)+orb(3);
orbTmp(4)=vin(1)+orb(4);
orbTmp(5)=vin(2)+orb(5);
orbTmp(6)=vin(3)+orb(6);
orbk(3,1:3)=orbTmp(4:6)*ha;
radius=sqrt(orbTmp(1)*orbTmp(1)+orbTmp(2)*orbTmp(2)+orbTmp(3)*orbTmp(3));
orbk(3,4)=-GM*orbTmp(1)*ha*(1+1.5*J2*(1-5*(orbTmp(3)/radius)^2)*(Re/radius)^2)/(radius*radius*radius);
orbk(3,5)=(-GM*orbTmp(1)*ha*(1+1.5*J2*(1-5*(orbTmp(3)/radius)^2)*(Re/radius)^2)/(radius*radius*radius))*(orbTmp(2)/orbTmp(1));%-GM*orbTmp(2)*ha/(radius*radius*radius);
orbk(3,6)=-GM*orbTmp(3)*ha*(1+1.5*J2*(3-5*(orbTmp(3)/radius)^2)*(Re/radius)^2)/(radius*radius*radius);
% orbk(3,4)=-GM*orbTmp(1)*ha/(radius*radius*radius);
% orbk(3,5)=-GM*orbTmp(2)*ha/(radius*radius*radius);
% orbk(3,6)=-GM*orbTmp(3)*ha/(radius*radius*radius);
%%
%RK4
orbTmp(1)=rin(1)+orbk(3,1);
orbTmp(2)=rin(2)+orbk(3,2);
orbTmp(3)=rin(3)+orbk(3,3);
orbTmp(4)=vin(1)+orbk(3,4);
orbTmp(5)=vin(2)+orbk(3,5);
orbTmp(6)=vin(3)+orbk(3,6);
orbk(4,1:3)=orbTmp(4:6)*ha;
radius=sqrt(orbTmp(1)*orbTmp(1)+orbTmp(2)*orbTmp(2)+orbTmp(3)*orbTmp(3));
orbk(4,4)=-GM*orbTmp(1)*ha*(1+1.5*J2*(1-5*(orbTmp(3)/radius)^2)*(Re/radius)^2)/(radius*radius*radius);
orbk(4,5)=(-GM*orbTmp(1)*ha*(1+1.5*J2*(1-5*(orbTmp(3)/radius)^2)*(Re/radius)^2)/(radius*radius*radius))*(orbTmp(2)/orbTmp(1));%-GM*orbTmp(2)*ha/(radius*radius*radius);
orbk(4,6)=-GM*orbTmp(3)*ha*(1+1.5*J2*(3-5*(orbTmp(3)/radius)^2)*(Re/radius)^2)/(radius*radius*radius);
% orbk(4,4)=-GM*orbTmp(1)*ha/(radius*radius*radius);
% orbk(4,5)=-GM*orbTmp(2)*ha/(radius*radius*radius);
% orbk(4,6)=-GM*orbTmp(3)*ha/(radius*radius*radius);
%%
orb=(orbk(1,:)+2*orbk(2,:)+2*orbk(3,:)+orbk(4,:))/6;
rout=rin+orb(1:3);
vout=vin+orb(4:6);
end

