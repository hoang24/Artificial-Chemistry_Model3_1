function [P,inputs,actualOut,desiredOut] = AC_model3_1(M,bit)
    % Explicit chemistry model: species are symbol A, B. A is 0, B is 1
    % Input:
        % M: initial size of the chemistry
    % Output:
        % P: set of population (molecules existing inside the chemistry
    
    % initializeChem    
    S = logical([0,1]); % Set S of species in the chemistry
    P = zeros(1,M);
    for i = 1:M
        P(i) = S(randi(length(S))); % Set P of population in the chemistry (species that are in the chemistry)
    end; 
    
    % runChem
    numReactions = 10000;
    for j = 1:numReactions
        draw1 = randi(M);
        draw2 = randi(M);
        while draw2 == draw1
            draw2 = randi(M);
        end

        s1 = P(draw1);
        s2 = P(draw2);
        product = ~(s1 & s2);
        P = [P,product];
    end
    
    % addInputs
    for i = 1:bit
        inputs(i) = S(randi(length(S)));
    end
    P = [P,inputs];
    
    % runChem
    numReactions = 10000;
    for j = 1:numReactions
        draw1 = randi(M);
        draw2 = randi(M);
        while draw2 == draw1
            draw2 = randi(M);
        end

        s1 = P(draw1);
        s2 = P(draw2);
        product = ~(s1 & s2);
        P = [P,product];
    end
    %inputsIndices = [(M+numReactions+1):(M+numReactions+bit)];
    [actualOut,desiredOut] = perceptron4AC3_1(inputs);
    
end