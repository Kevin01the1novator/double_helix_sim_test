% plotBasePairs.m
function plotBasePairs(sequence, x1, y1, z, x2, y2, step)
    % Plots the base pairs connecting the two DNA strands with split colors
    % and adds labels for nitrogenous bases if numBases < 100
    % Inputs:
    %  - sequence: DNA sequence as a string
    %  - x1, y1, z: Coordinates of the first strand
    %  - x2, y2, z: Coordinates of the second strand
    %  - step: Interval for visualizing base pairs (e.g., every 1, 10, etc.)
    
    % Iterate through each base pair, plotting according to the step size
    for i = 1:step:length(sequence)
        % Get the current base and its complement
        base = sequence(i);
        compBase = complementBase(base);
        
        % Determine color for each side based on the base pair
        switch base
            case 'A', color1 = [1 0 0]; % Red for Adenine
            case 'T', color1 = [1 0.5 0]; % Orange for Thymine
            case 'C', color1 = [0 1 0]; % Green for Cytosine
            case 'G', color1 = [0 0 1]; % Blue for Guanine
            otherwise, color1 = [0 0 0]; % Black for unknown base
        end
        
        switch compBase
            case 'A', color2 = [1 0 0]; % Red for Adenine
            case 'T', color2 = [1 0.5 0]; % Orange for Thymine
            case 'C', color2 = [0 1 0]; % Green for Cytosine
            case 'G', color2 = [0 0 1]; % Blue for Guanine
            otherwise, color2 = [0 0 0]; % Black for unknown base
        end
        
        % Calculate midpoint between strands for split coloring
        midX = (x1(i) + x2(i)) / 2;
        midY = (y1(i) + y2(i)) / 2;
        midZ = z(i); % Use exact Z level
        
        % Plot the first half of the connection
        plot3([x1(i), midX], [y1(i), midY], [z(i), midZ], 'Color', color1, 'LineWidth', 1.5);
        % Plot the second half of the connection
        plot3([midX, x2(i)], [midY, y2(i)], [midZ, z(i)], 'Color', color2, 'LineWidth', 1.5);
        
        % Add labels for the nitrogenous bases if numBases < 100
        if length(sequence) < 100
            text(x1(i), y1(i), z(i), base, 'FontSize', 8, 'Color', color1, ...
                'HorizontalAlignment', 'right', 'VerticalAlignment', 'middle');
            text(x2(i), y2(i), z(i), compBase, 'FontSize', 8, 'Color', color2, ...
                'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
        end
    end
end
