% visualizeDNAHelix.m
function visualizeDNAHelix_S(numBases)
    % Main function to visualize the DNA double helix
    % Input: numBases - Number of base pairs to generate (e.g., 20, 1000, etc.)
    
    % Define helix parameters
    helixRadius = 6;       % Increase radius to separate strands
    helixPitch = 5;        % Not used for Z spacing, purely for aesthetics in theta calculation
    turnLength = 10;       % Number of base pairs per turn

    % Generate a random DNA sequence of specified length
    sequence = generateRandomDNA(numBases);

    % Generate helix structure data with Z positions according to base pair levels
    [x1, y1, z, x2, y2] = generateHelix(numBases, helixRadius, helixPitch, turnLength);

    % Create figure and plot helix strands
    figure;
    hold on;
    plotHelixStrands(x1, y1, z, x2, y2);
    
    % Determine visualization mode based on the number of base pairs
    if numBases < 100
        % Plot all base pairs for smaller sequences
        plotBasePairs(sequence, x1, y1, z, x2, y2, 1); % plot every base pair
    else
        % Plot only every 10th base pair for larger sequences
        plotBasePairs(sequence, x1, y1, z, x2, y2, 10); % plot every 10th pair
    end

    % Set axis limits based on the DNA length and Z-axis limit according to numBases
    axis([-15 15 -15 15 0 numBases]); % Restrict Z-axis to [0, numBases]
    
    % Set camera view properties
    camva(8);   % Initial camera view angle for broader view
    camzoom(1); % Initial zoom level
    rotate3d on;
    grid on;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title(['3D DNA Double Helix Visualization with ', num2str(numBases), ' Base Pairs']);
    view(3); % Start with a 3D view
    hold off;
end

function sequence = generateRandomDNA(numBases)
    % Generates a random DNA sequence of given length
    bases = ['A', 'T', 'C', 'G'];
    sequence = bases(randi(4, 1, numBases));
end

% Define the number of base pairs for the DNA sequence
numBases = 40;

% Generate a random DNA sequence
sequence = generateRandomDNA(numBases);

% Define a name for this sequence
sequenceName = 'Random_DNA_Sequence';

% Visualize the DNA helix with the generated sequence
visualizeDNAHelix_S(numBases);

% Display detailed information about the generated DNA sequence
displaySequenceInfo(sequence, sequenceName);