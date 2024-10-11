% complementBase.m
function compBase = complementBase(base)
    % Returns the complementary base for DNA
    switch base
        case 'A', compBase = 'T';
        case 'T', compBase = 'A';
        case 'C', compBase = 'G';
        case 'G', compBase = 'C';
        otherwise, compBase = '-'; % For unknown or non-standard bases
    end
end
