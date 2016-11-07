function J = GetCost(X, y, theta)
	%COMPUTECOST Calculate cost for linear regression
	%   J = GetCost(X, y, theta) calculates the cost of using theta as the
	%   parameter for linear regression to fit the data points in X and y

    % this would be a cost for OLS
	%J = sum((y - X*theta).^2);
    
    % the cost for log likelihood
    J = 0;
    m = length(y);
    for i = 1:m
        sv = sigmoid(X(i,:)*theta);
        J = J + (y(i) * log(sv)) + log(1 - y(i)) * log(1 - sv);
    end
    J = J * (-1);
end