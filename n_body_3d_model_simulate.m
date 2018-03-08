% The purpose of this program is to simulate the motion of n-gravitational bodies
% in space over an assigned time interval. The program is designed to
% accept an m x 7 matrix of ephemeris data. Each row of the ephemeris
% matrix corresponds to a different gravitational body; the columns of the
% matrix correspond to x-position, y-position, z-position, x-velocity,
% y-velocity, z-velocity, and mass respectively. The program calculates
% the position, velocity, net gravitational force, and acceleration of the 
% bodies in discrete time steps (determined by delta_t). The series of 
% positions is then saved to pos_sequence.bin. This binary
% file is then to be run by n_body_3d_model_animate.m. Running the
% simulation calculations and animation in one program limits the number of
% bodies that can be modelled and animated smoothly. Writing to a bin file
% and exporting only the position values allows simulations with large
% amounts of gravitational bodies with long durations.  



clear;
load my_ephemerides.mat solar_system_plus 
celestial_bodies = solar_system_plus;



% Gravitational constant
G = 6.674e-11; % N*(m/kg)^2

% Some common conversion factors:
AU_2_km = 149597870691; 
km_2_m = 1000;
days_2_s = 86400;

% Extract data from ephemerides into individual component arrays.
x_pos = celestial_bodies(:, 1);
y_pos = celestial_bodies(:, 2);
z_pos = celestial_bodies(:, 3);
x_vel = celestial_bodies(:, 4);
y_vel = celestial_bodies(:, 5);
z_vel = celestial_bodies(:, 6);

% reorganize individual component arrays into position, velocity, and mass matrices. 
mass = celestial_bodies(:, 7);
position = [x_pos, y_pos, z_pos]*km_2_m;
velocity = [x_vel, y_vel, z_vel]*km_2_m;

% days_simulated is the number of simulated days the program will run.
% delta_t is the resolution of the discrete step size between calculations,
% and res_adjust is how frequently this data is written to the binary file. Assign different
% integer values to res_adjust to change the animations overall resolution. 
% The higher the integer the less frequently the data will be written to the 
% .bin file, and the quicker the animation will run in real-time.
days_simulated = 365*100;
delta_t = 3600; % s
res_adjust = 60;
run_time = days_simulated * days_2_s / delta_t;
NUM_BODIES = size(celestial_bodies,1);
save NUM_BODIES.mat NUM_BODIES

% Create binary file in 'write' mode.
position_out = fopen('pos_sequence.bin', 'w');
% Add initial position values to .bin file
fwrite(position_out, [position;], 'double');


% The following block of nested loops runs through the assigned run time
% calculating position, velocity, net force, and acceleration of the bodies
% in discrete time steps determined by delta_t. 
for t = 1:run_time;
    
    for i = 1:NUM_BODIES
        position(i, :) = position(i, :) + delta_t * velocity(i, :);
        for j = 1:NUM_BODIES
            if (j ~= i)
                delta_position = position(j, :) - position(i, :);
                dist = sqrt(delta_position(1)^2 + delta_position(2)^2 + delta_position(3)^2);
                F = G*mass(i).*mass(j)./dist^2;
                F_x(j) = F*delta_position(1)/dist;
                F_y(j) = F*delta_position(2)/dist;
                F_z(j) = F*delta_position(3)/dist;
                
            else
                F_x(j) = 0;
                F_y(j) = 0;
                F_z(j) = 0;
                
            end
        end
        
        F_total = [sum(F_x), sum(F_y), sum(F_z)];     
        accel = F_total./mass(i);
           
        velocity(i, :) = velocity(i, :) + delta_t*accel;
         
    
    end
    
    % data is only written to .bin file on assigned res intervals
    if mod(t, res_adjust) == 0;
        fwrite(position_out, position, 'double');
    end
        
end

% Close .bin file
fclose(position_out);
    

