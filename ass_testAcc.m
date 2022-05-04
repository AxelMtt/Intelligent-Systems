function [testAcc] = ass_testAcc(result,source)
%Compares the test dataset with result from the model
%   Detailed explanation goes here
    correct = 0;
    input = table2array(source(:,"HeartDisease"));
    for N = 1 : length(result)
        
        a = result(N);
        b = input(N);
        if (isequal(a,b))
            correct = correct + 1;
        end            
    end
testAcc = correct/length(result);
end

