function [theta, J_history] = GradientDescent(X, y, theta, alpha, n_iterations)
	%This Performs gradient descent to find theta
	%   theta = GradientDescent(X, y, theta, alpha, n_iterations) updates theta by 
	%   taking n_iterations gradient steps with learning rate alpha
    %   stochastic approach, ie we only do one sample at a time.

	% Initialize
	m = length(y); % number of training examples
	J_history = zeros(n_iterations, 1);

	for iter = 1:n_iterations
		% Save the cost J in every iteration    
		J_history(iter) = GetCost(X, y, theta);
        
% batch mode
% for wj = 1:length(theta)
%     samplesum = 0;
%     for item = 1:m
%        %expectdv = sigmoid(X(item,:)*theta);
%        expectdv = X(item,:)*theta;
%        errorv = (y(item,1) - expectdv) * X(item,wj + 1);
%        samplesum = samplesum + errorv;
%     end
%     theta(wj) = theta(wj) + alpha * samplesum;
% end

% stochastic mode
for item = 1:m
   for j = 1:length(theta)
      expectedv = sigmoid(X(item,:)*theta);
      errorv = alpha * (y(item) - expectedv) * X(item,j);
      theta(j) = theta(j) - errorv;
   end
end
        
	end

end