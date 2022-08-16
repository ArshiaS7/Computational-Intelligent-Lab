%% Computational Intelligent Lab - NNTOOL
% Instructor: Eng. M. Amini
% Author: Arshia Samoudi - 9723021
% AmirKabir University of Technology

%% Clearance
clc; clear; close all; nnet.guis.closeAllViews;

%% Ordering Inputes and Outputs

fs = 100;
Ts = inv(fs);
t = 0:inv(fs):20-Ts;
f1 = 10;

% inputs

inp1 = t;                                                   % Ramp
inp2 = sin(2*pi*f1*t);                                      % sineWave with f1 frequency
Noise_Power = 0.5; Noise = wgn(1,length(t),Noise_Power);    % White Guassian Noise With power 0.2
input = inp1 + inp2 + Noise;

% H(z) Numerator and Denuminator
TFN = [-4 2];
TFD = [1 -1.2 0.27];

% Filtered Output
output = filter(TFN,TFD,input);

% Delayed input and output as NN inputs
a1 = [0 ,input(1:end-1)]; 
a3 = [0 ,output(1:end-1)];
a4 = [0 ,0 ,output(1:end-2)];

x = [input; a1; a3; a4];

%% NN
close all;

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.

% Create a Fitting Network
% The Single Layer Network with 10 Neurons
hiddenLayerSize = [10];

net = fitnet(hiddenLayerSize,trainFcn);

% Setup Division of Data for Training, Validation, Testing
% For a list of all data division functions type: help nndivide
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 10/100;
net.divideParam.testRatio = 10/100;
%net.divideFcn = 'divideind';

% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net.performFcn = 'mse';  % Mean Squared Error

% Viewing Network
view(net)

% Train Network
[net,tr] = train(net,x,output);

% Testing Network
network_outputs = net(x);
network_error = gsubtract(output,network_outputs);
network_performance = perform(net,output,network_outputs);


% Plotting
figure(1)
subplot(3,1,1)
plot(t,output);
xlabel('Time(secons)'); ylabel('Amplitude'); title('Filtered Output');

subplot(3,1,2)
plot(t,network_outputs,'r-');
xlabel('Time(secons)'); ylabel('Amplitude'); title('Neural Network Output. Noise Power '+string(Noise_Power));

subplot(3,1,3)
plot(t,network_error,'k-');
xlabel('Time(secons)'); ylabel('Amplitude'); title('Error');




