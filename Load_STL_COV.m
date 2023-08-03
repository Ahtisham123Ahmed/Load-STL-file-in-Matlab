% Load the STL model
stl_read = stlread("car_stl - Part1-1.stl"); % inplace of car_stl - Part1-1 put yourfile name

% Extract vertices and faces
vertices = stl_read.Points;
faces = stl_read.ConnectivityList;

% Convert faces to double (if needed)
faces = double(faces);

% Calculate the volume of the solid object (cube)
length = max(vertices(:, 1)) - min(vertices(:, 1));
width = max(vertices(:, 2)) - min(vertices(:, 2));
height = max(vertices(:, 3)) - min(vertices(:, 3));
total_volume = length * width * height;

% Calculate the center of mass using the weighted average of vertices
x_avg = sum(vertices(:, 1)) / size(vertices, 1);
y_avg = sum(vertices(:, 2)) / size(vertices, 1);
z_avg = sum(vertices(:, 3)) / size(vertices, 1);

center_of_volume = [x_avg, y_avg, z_avg];
disp("Center of Volume:");
disp(center_of_volume);

% Find the origin (minimum X, Y, Z values)
origin = min(vertices);
disp("Origin Coordinates:");
disp(origin);

% Create a figure and plot the 3D model
figure;
trisurf(faces, vertices(:,1), vertices(:,2), vertices(:,3), 'FaceColor', 'red', 'EdgeColor', 'blue');
hold on;  % Enable hold to add additional plots to the same figure

% Plot the center of volume as a blue dot
scatter3(center_of_volume(1), center_of_volume(2), center_of_volume(3), 50, 'Marker', 'o', 'MarkerFaceColor', 'blue', 'MarkerEdgeColor', 'blue');

% Plot the origin as a green dot
scatter3(origin(1), origin(2), origin(3), 50, 'Marker', 'o', 'MarkerFaceColor', 'green', 'MarkerEdgeColor', 'green');

hold off; % Release the hold for future plots
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Imported 3D Model with Center of Volume and Origin');