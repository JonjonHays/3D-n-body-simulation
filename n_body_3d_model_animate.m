% This script file unpacks the binary file created with
% n_body_3d_model_simulate.m and then plots the position sequence of 
% the graviational bodies in a 3d scatter plot in order to create an 
% animation of the bodies' motion. 

clear;

load NUM_BODIES.mat  

% load .bin file containing position sequence created by
% n_body_3d_model_siumulate.m, and reshape the data into a matrix that has
% n-rows, and some number of columns.
position_in = fopen('pos_sequence.bin', 'r');
position = reshape(fread(position_in, 'double'), NUM_BODIES, []);


NUM_DATA = numel(position(1,:));
% The number of different positions in the sequence
NUM_SEQUENCE = NUM_DATA/3;


for i = 1:NUM_BODIES;
    x_array(i, 1:NUM_SEQUENCE) = position(i, 1:3:end);
    y_array(i, 1:NUM_SEQUENCE) = position(i, 2:3:end);
    z_array(i, 1:NUM_SEQUENCE) = position(i, 3:3:end);
end


%Plot initial positions
hndl = scatter3(x_array(:, 1), y_array(:, 1), z_array(:, 1));

% Set bounds with a bit of leeway from the max position in each direction 
% max function called twice to first find three max values from x, y, and z 
% position, and then to find max of those three values.
target_bounds = max(max(abs(position))); 
xlim([-1.1*target_bounds, 1.1*target_bounds]);
ylim([-1.1*target_bounds, 1.1*target_bounds]);
zlim([-1.1*target_bounds, 1.1*target_bounds]);

for i = 2:NUM_SEQUENCE;
    
    grid on
    
    x_pos = x_array(:, i);
    y_pos = y_array(:, i);
    z_pos = z_array(:, i);
    
    set(hndl, 'XData', x_pos);
    set(hndl, 'YData', y_pos);
    set(hndl, 'ZData', z_pos);

    drawnow;
    

    
end


