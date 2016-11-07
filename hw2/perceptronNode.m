function [y] = perceptronNode(X,W)
    y = 0;
    level = W' * X;
    
    if(level > 0)
        y = 1;
    end
end
