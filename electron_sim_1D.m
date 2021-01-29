set(0,'DefaultFigureWindowStyle','docked')

clc
clear
close all

% ELEC 4700 - Monte Carlo PA
% Brandon Schelhaas
% 101036851

% Constants
mass_elec = 1; % mass of electron (not accurate)

% Initialization
dt = 0.001; % time step
numSteps = 200; %number of time steps

% ----- Parts A-C -----
% Allocate arrays for time, position, velocity
t = zeros(1, numSteps);
x = zeros(1, numSteps);
v = zeros(1, numSteps);

% A) Initial conditions
x(1) = 0;
v(1) = 0;
t(1) = 0;

% Initialize a force
F = 1; % Could be lower

% Parts B) and C): Advance the electron and plot the position/velocity
figure(1)
electron_sim_PartC



% ----- Parts D, E -----
% Reset time, position, velocity arrays
t = zeros(1, numSteps);
x = zeros(1, numSteps);
v = zeros(1, numSteps);

% Initialize the drift velocity (average velocity)
v_drift = v(1); % Average of first meas. = first meas.

% D) Assign a probabilty of 5% chance of scattering
scattering_probability = 0.05;

% Plot the electron's position and velocity, and E) calculate drift current
figure(2)
electron_sim_PartE



% ----- Part F, G, H -----
% Set the number of electrons to model
numElectrons = 5;

% Reset time, position, velocity arrays
t = zeros(1, numSteps);
x = zeros(numElectrons, numSteps);
v = zeros(numElectrons, numSteps);

% Set the drift velocity equal to average velocity of initial conditions
v_drift = sum(v(:,1))/numElectrons;

% Play around with the scattering rules
reflect = -1; % electrons scatter with negative of initial velocity

% Calculate probability of scattering
tau = 0.0095;
P = 1 - exp(-dt/tau); % @tau = 0.0095 --> P = 0.1 = 10%

% Plot position and velocity with new scattering and numbers of electrons
figure(3)
electron_sim_PartH