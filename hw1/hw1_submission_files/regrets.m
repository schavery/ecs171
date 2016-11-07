function [weights, errterm] = regrets(X, n, Y)
	%REGRETS polynomial in n OLS calculator
	% just for the sake of seeing what we're doing
	% 1 * w_0 + x_i * w_1 + x_i^2 * w_2 + ... + x_i^n * w_n
	
	m = length(X);
	boldx = zeros(m,n);

	% need to form the vector of polynomial terms
	for term = 0:n
		boldx(:,term+1) = X.^term;
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