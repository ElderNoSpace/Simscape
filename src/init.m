clear all

%% Visual parameters
inertia_opacity = 0; % Determines how visible inertia indicators will be

%% Sample time
sample_time = 1/90;
g = 9.8107;

%% Define floor contact parameters
floor.length = 2;       % m (x)
floor.width = 2;        % m (y)
floor.depth = 0.01;     % m (z) 
floor.vel_gain = 0.01;  %
floor.contact_friction = 0.9;   % Friction coeff.
floor.contact_stiffness = 1e3;
floor.contact_damping = 1e5;
floor.kinetic_friction = 0.7;
floor.static_friction = 0.9;
floor.stud_radius = 0.005;

%% Torso parameters
torso.height = 0.45;

%% Step parameters
step.height = 0.1; % m (z)
step.length = 0.2; % m (forward)

%% Initialise kinematics parameters
model = NUgusKinematics;

%% Initialise servos
MX64_init;
MX106_init;

%% Initialise CM740
CM740_init;

