% step wise perceptron
function [y] = perceptronNode(X, W, threshold)
    if nargin < 3
        threshold = 0;
    end
    
    y = -1;
    level = W' * X;
    
    if(level > threshold)
        y = 1;
    end
end
