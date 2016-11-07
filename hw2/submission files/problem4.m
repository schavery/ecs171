% set up training and test sample
normdata;

% learning rate
alpha = 1;

% set up the network
layercount = 5;
nodecounts = [8;10;10;10;10];

numepochs = 10;


for layer = 1:layercount
    for node = 1:nodecounts(layer)
        if layer == 1
            % only one input, no bias on the input layer.
            weights(layer,node) = {1}; %#ok<SAGROW>
        else
            weights(layer,node) = {zeros(nodecounts(layer - 1) + 1,1)}; %#ok<SAGROW>
        end
    end
end

% set up train or test
samples = trainset;
labels = trainlabel;


for epoch = 1:numepochs
    % now we get the activations for each sample
    for item = 1:length(samples)

        activations = zeros(size(weights));

        % need to do the input layer on its own
        for in = 1:size(samples,2)
            activations(1,in) = perceptronNode(samples(item,in), cell2mat(weights(1,in)));
        end

        % now we can feed forward through the network
        for layer = 2:layercount
            for node = 1:nodecounts(layer)
                activations(layer,node) = perceptronNode([1;activations(layer-1,1:nodecounts(layer - 1))'],cell2mat(weights(layer,node)));
            end
        end

        % get the error level and backpropagate
        label = zeros(10,1) - ones(10,1);

        x = labels(item);
        switch x{1}
            case '''CYT'''
                label(1) = 1;
            case '''NUC'''
                label(2) = 1;
            case '''MIT'''
                label(3) = 1;
            case '''ME3'''
                label(4) = 1;
            case '''ME2'''
                label(5) = 1;
            case '''ME1'''
                label(6) = 1;
            case '''EXC'''
                label(7) = 1;
            case '''VAC'''
                label(8) = 1;
            case '''POX'''
                label(9) = 1;
            case '''ERL'''
                label(10) = 1;
        end

        % update weights between output layer and hidden layer
        % get the error of each output layer node.
        delta = zeros(size(weights));

        for deltal = size(delta,1):-1:2

            % we can calculate the error for the output in one step
            if deltal == size(delta,1)
                delta(deltal,1:size(label)) = label - activations(end,1:size(label))';
            else

                % hidden layer node error
                for node = 1:nodecounts(deltal)

                    % get the weights for the previous layer
                    for ithweight = 1:nodecounts(deltal+1)
                        ithv = cell2mat(weights(deltal+1,ithweight));
                        weightout(ithweight,1) = ithv(node);
                    end

                    errterm = (weightout' * delta(deltal+1,:)');
                    delta(deltal,node) = (errterm * activations(deltal,node)) * (1 - activations(deltal,node));
                end
            end
        end

        % update the weights
        for layer = size(weights,1):-1:2
            for node = 1:nodecounts(layer)
                wgt = cell2mat(weights(layer,node));
                for wj = 1:length(wgt)
                    if wj == 1
                        wgt(wj) = wgt(wj) + alpha * delta(layer,node);
                    else
                        wgt(wj) = wgt(wj) + alpha * (delta(layer,node) * activations(layer-1,wj-1));
                    end
                end
                weights(layer,node) = {wgt};
            end
        end

    end
    
    alpha = alpha / 10;
end

% now we have finished training, do a test run.
samples = testset;
labels = testlabel;

for epoch = 1:numepochs
    errorlist = zeros(size(samples,1),1);
    % now we get the activations for each sample
    for item = 1:length(samples)

        activations = zeros(size(weights));

        % need to do the input layer on its own
        for in = 1:size(samples,2)
            activations(1,in) = perceptronNode(samples(item,in), cell2mat(weights(1,in)));
        end

        % now we can feed forward through the network
        for layer = 2:layercount
            for node = 1:nodecounts(layer)
                activations(layer,node) = perceptronNode([1;activations(layer-1,1:nodecounts(layer - 1))'],cell2mat(weights(layer,node)));
            end
        end

        % get the error level and backpropagate
        label = zeros(10,1) - ones(10,1);

        x = labels(item);
        switch x{1}
            case '''CYT'''
                label(1) = 1;
            case '''NUC'''
                label(2) = 1;
            case '''MIT'''
                label(3) = 1;
            case '''ME3'''
                label(4) = 1;
            case '''ME2'''
                label(5) = 1;
            case '''ME1'''
                label(6) = 1;
            case '''EXC'''
                label(7) = 1;
            case '''VAC'''
                label(8) = 1;
            case '''POX'''
                label(9) = 1;
            case '''ERL'''
                label(10) = 1;
        end

        % update weights between output layer and hidden layer
        % get the error of each output layer node.
        delta = zeros(size(weights));

        for deltal = size(delta,1):-1:2

            % we can calculate the error for the output in one step
            if deltal == size(delta,1)
                delta(deltal,1:size(label)) = label - activations(end,1:size(label))';
            else

                % hidden layer node error
                for node = 1:nodecounts(deltal)

                    % get the weights for the previous layer
                    for ithweight = 1:nodecounts(deltal+1)
                        ithv = cell2mat(weights(deltal+1,ithweight));
                        weightout(ithweight,1) = ithv(node);
                    end

                    errterm = (weightout' * delta(deltal+1,:)');
                    delta(deltal,node) = (errterm * activations(deltal,node)) * (1 - activations(deltal,node));
                end
            end
        end

        % update the weights
        for layer = size(weights,1):-1:2
            for node = 1:nodecounts(layer)
                wgt = cell2mat(weights(layer,node));
                for wj = 1:length(wgt)
                    if wj == 1
                        wgt(wj) = wgt(wj) + alpha * delta(layer,node);
                    else
                        wgt(wj) = wgt(wj) + alpha * (delta(layer,node) * activations(layer-1,wj-1));
                    end
                end
                weights(layer,node) = {wgt};
            end
        end

        % get the error!
        if item > 1
            errorlist(item) = sqrt(sum(delta(end,:).^2)) + errorlist(item-1);
        else
            errorlist(item) = sqrt(sum(delta(end,:).^2));
        end

    end
    
end

disp( mean(errorlist));