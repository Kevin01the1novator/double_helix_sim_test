% generateHelix.m
function [x1, y1, z, x2, y2] = generateHelix(numBases, helixRadius, helixPitch, turnLength)
    % Generates the coordinates for a DNA double helix with smoother strands
    % Outputs: coordinates for two strands (x1, y1, z) and (x2, y2, z)
    
    % Calculate theta to cover the number of turns required by numBases
    theta = linspace(0, 2 * pi * (numBases / turnLength), numBases);
    
    % Generate z to match the number of base pairs directly
    z = 1:numBases; % Integer Z values from 1 to numBases    
    
    % Coordinates for the first strand
    x1 = helixRadius * cos(theta);
    y1 = helixRadius * sin(theta);
    
    % Coordinates for the second strand, offset by pi (half turn)
    x2 = helixRadius * cos(theta + pi);
    y2 = helixRadius * sin(theta + pi);
    
    % Smooth the strands by interpolating with a spline
    % fineZ = linspace(0, numBases, numBases * 10);
    % x1 = interp1(z, x1, fineZ, 'spline');
    % y1 = interp1(z, y1, fineZ, 'spline');
    % x2 = interp1(z, x2, fineZ, 'spline');
    % y2 = interp1(z, y2, fineZ, 'spline');
    % z = fineZ; % Update z to the refined points
end
