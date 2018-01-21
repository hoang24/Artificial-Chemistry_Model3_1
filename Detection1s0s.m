function [result] = Detection1s0s(array)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    %array = randi([0,1],[1,6]);
    totalNum = numel(array);
	num1s = sum(sum(array));
    num0s = totalNum - num1s;
    
    if num0s < num1s
        result = 1;
    elseif num0s > num1s
        result = 0;
    else 
        result = 'Equal number of 1s and 0s';
    end
end

