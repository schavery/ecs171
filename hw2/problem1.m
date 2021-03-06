% we are going to use all features, since we only have 8

% this is non-sense. Should normalize the data and use 0
inputlevelthreshold = 0.5;

% this will change when we're testing
samplelen = length(yeast(:,1));

% now we need to create hidden layer nodes
hiddenlayerthreshold = 0;

% 9 inputs including bias
h1weights = zeros(9,1);
h2weights = zeros(9,1);
h3weights = zeros(9,1);

% output layer stuff. Four inputs from hidden layer including bias
outputlayerthreshold = 0;
o1weights = zeros(4,1);
o2weights = zeros(4,1);
o3weights = zeros(4,1);
o4weights = zeros(4,1);
o5weights = zeros(4,1);
o6weights = zeros(4,1);
o7weights = zeros(4,1);
o8weights = zeros(4,1);
o9weights = zeros(4,1);
o0weights = zeros(4,1);

for item = 0:samplelen

    i1 = perceptronNode(mcg(item), 1, inputlevelthreshold);
    i2 = perceptronNode(gvh(item), 1, inputlevelthreshold);

    i3 = perceptronNode(alm(item), 1, inputlevelthreshold);
    i4 = perceptronNode(mit(item), 1, inputlevelthreshold);

    i5 = perceptronNode(erl(item), 1, inputlevelthreshold);
    i6 = perceptronNode(pox(item), 1, inputlevelthreshold);

    i7 = perceptronNode(vac(item), 1, inputlevelthreshold);
    i8 = perceptronNode(nuc(item), 1, inputlevelthreshold);
    
    inputlayerresults = [1; i1; i2; i3; i4; i5; i6; i7; i8];
    
    h1 = perceptronNode(inputlayerresults, h1weights, hiddenlayerthreshold);
    h2 = perceptronNode(inputlayerresults, h2weights, hiddenlayerthreshold);
    h3 = perceptronNode(inputlayerresults, h3weights, hiddenlayerthreshold);
    
    hiddenlayerresults = [1; h1; h2; h3];
    
    CYT = perceptronNode(hiddenlayerresults, o1weights, outputlayerthreshold);
    NUC = perceptronNode(hiddenlayerresults, o2weights, outputlayerthreshold);
    
    MIT = perceptronNode(hiddenlayerresults, o3weights, outputlayerthreshold);
    ME3 = perceptronNode(hiddenlayerresults, o4weights, outputlayerthreshold);
    
    ME2 = perceptronNode(hiddenlayerresults, o5weights, outputlayerthreshold);
    ME1 = perceptronNode(hiddenlayerresults, o6weights, outputlayerthreshold);
    
    EXC = perceptronNode(hiddenlayerresults, o7weights, outputlayerthreshold);
    VAC = perceptronNode(hiddenlayerresults, o8weights, outputlayerthreshold);
    
    POX = perceptronNode(hiddenlayerresults, o9weights, outputlayerthreshold);
    ERL = perceptronNode(hiddenlayerresults, o0weights, outputlayerthreshold);
    
    % backpropagation
    % we'll need to find the proper classification.
    outputv = [CYT,NUC,MIT,ME3,ME2.ME1,EXC,VAC,POX,ERL];
    
    classvector = zeros(1,10);
    switch Class(item)
        case 'CYT'
            classvector(1) = 1;
        case 'NUC'
            classvector(2) = 1;
        case 'MIT'
            classvector(3) = 1;
        case 'ME3'
            classvector(4) = 1;
        case 'ME2'
            classvector(5) = 1;
        case 'ME1'
            classvector(6) = 1;
        case 'EXC'
            classvector(7) = 1;
        case 'VAC'
            classvector(8) = 1;
        case 'POX'
            classvector(9) = 1;
        case 'ERL'
            classvector(10) = 1;
    end
    
    % update weights between output layer and hidden layer
    
end


        






