weights = ones(8,1);
alpha = 0.0001;

% we use gradient descent to feedback into the weights.
% first we need to normalize our data.
xtrain_norm = ones(300,8);

for i = 1:length(xtrain(1,:));
    r = range(xtrain(:,i));
    m = mean(xtrain(:,i));
    
    xtrain_norm(:,i+1) = (xtrain(:,i) - m) ./ r;
    endfigure
ytrain_norm = (ytrain - mean(ytrain)) ./ range(ytrain);

% 
% for iter = 1:2000
%     for sample = 1:length(xtrain_norm)
%         for wj = 1:length(weights)
%             tw = weights(wj,1);
%             weights(wj,1) = tw + alpha*(ytrain_norm(sample,1) - sigmoid(xtrain_norm(sample,:) * weights))*xtrain_norm(sample,wj);
%         end
%     end
% end

[out_theta, J_history] = GradientDescent(xtrain_norm, ytrain_norm, weights, alpha, 370);
