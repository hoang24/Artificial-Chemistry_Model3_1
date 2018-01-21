function [actualOut,desiredOut] = perceptron4AC3_1(inputs)
    iterations = 10000;
    desiredOut = Detection1s0s(inputs);
    coeff = 0.1;
    bias = 1;
    wIn = rand;
    wBias = rand;
    weights = [];
    
    for i = 1:iterations
        net = desiredOut*wIn + bias*wBias;
        actualOut(i) = 1./(1+exp(-net));

        error = desiredOut - actualOut(i);
        
        wIn = wIn + desiredOut*coeff*error;
        wBias = wBias + coeff*bias*error;
        weights = [weights; wIn wBias];    
    end
    actualOut = actualOut(end);
end