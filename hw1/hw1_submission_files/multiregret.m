function [weights, errterm] = multiregret(X, n, Y)
	[m,features] = size(X);
	
	boldx = ones(m,1+n*features);

	% need to form the vector of polynomial terms
	% this is bit more complex since we have multiple features now
    
    if n >= 1
        for term = 1:n
            for jx = 1:features
                boldx(:,(term-1)*jx+jx+1) = X(:,jx).^term;
            end
        end
    end

	% now we can create a weight vector with some fancy matrix math
	xt = transpose(boldx);
	
    A = xt * boldx;
    if( rcond(A) < 1e-12 )
    % This matrix doesn't look good
        weights = (pinv(A) * (xt * Y));
    else
        weights = (A \ (xt * Y)); 
    end

	errterm = 0;
	% now we need to calculate the errors based on our weights.
	for i = 1:m
		errterm = errterm + (Y(i,1) - (boldx(i,:) * weights)) ^ 2;
	end

end
