
clc; clear; close all;

%[net] = newrb(P,T,goal,spread,MN,DF)
% P - input vectors; R-by-Q matrix of Q input vectors
% T - target class vectors.
% SPREAD - of radial basis functions, default = 1.0.
% GOAL-Mean squared error goal (default = 0.0)
% MN- Maximum number of neurons (default is Q)
% DF- Number of neurons to add between displays (default = 25)

[X1,Y1] = CreataCirculatData(150,[1,2],2);
[X2,Y2] = CreataCirculatData(150,[5,7],3);

plot(X1,Y1,'ok',X2,Y2,'ob')