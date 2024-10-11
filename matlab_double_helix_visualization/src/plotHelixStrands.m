% plotHelixStrands.m
function plotHelixStrands(x1, y1, z, x2, y2)
    % Plots the two helical strands of the DNA backbone with smooth interpolation
    % Inputs: coordinates for two strands

    % Generate finer Z points for smoothness
    zFine = linspace(min(z), max(z), numel(z) * 10);  % Interpolate over 10x points

    % Interpolate x and y for both strands
    x1Fine = interp1(z, x1, zFine, 'spline');
    y1Fine = interp1(z, y1, zFine, 'spline');
    x2Fine = interp1(z, x2, zFine, 'spline');
    y2Fine = interp1(z, y2, zFine, 'spline');
    
    % Plot the smooth strands using interpolated points
    plot3(x1Fine, y1Fine, zFine, 'k', 'LineWidth', 1.5); % First strand
    plot3(x2Fine, y2Fine, zFine, 'k', 'LineWidth', 1.5); % Second strand

    % Label the 3' and 5' ends
    text(x1(1), y1(1), z(1), '3''', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'black');
    text(x1(end), y1(end), z(end), '5''', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'black');
    text(x2(1), y2(1), z(1), '5''', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'black');
    text(x2(end), y2(end), z(end), '3''', 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'black');
end
