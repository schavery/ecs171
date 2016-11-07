testsample = [0.5;0.52;0.52;0.2;0.6;0;0.5;0.29];

yeast = [mcg,gvh,alm,mit,erl,pox,vac,nuc];

%normalize it
for i = 1:length(testsample)
    testsample(i) = testsample(i) - mean(yeast(i,:)) / range(yeast(i,:));
end


activations = zeros(size(weights));

% need to do the input layer on its own
for in = 1:length(testsample)
    activations(1,in) = perceptronNode(testsample(in), cell2mat(weights(1,in)));
end

% now we can feed forward through the network
for layer = 2:layercount
    for node = 1:nodecounts(layer)
        activations(layer,node) = perceptronNode([1;activations(layer-1,1:nodecounts(layer - 1))'],cell2mat(weights(layer,node)));
    end
end
    