
% 9 inputs including bias
h1weights = zeros(9,1);
h2weights = zeros(9,1);
h3weights = zeros(9,1);

% output layer stuff. Four inputs from hidden layer including bias
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

for item = 1:samplelen

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
    outputv = [
        CYT;
        NUC;
        MIT;
        ME3;
        ME2;
        ME1;
        EXC;
        VAC;
        POX;
        ERL];
    
    classvector = zeros(10,1);
    x = classification(item);
    switch x{1}
        case '''CYT'''
            classvector(1) = 1;
        case '''NUC'''
            classvector(2) = 1;
        case '''MIT'''
            classvector(3) = 1;
        case '''ME3'''
            classvector(4) = 1;
        case '''ME2'''
            classvector(5) = 1;
        case '''ME1'''
            classvector(6) = 1;
        case '''EXC'''
            classvector(7) = 1;
        case '''VAC'''
            classvector(8) = 1;
        case '''POX'''
            classvector(9) = 1;
        case '''ERL'''
            classvector(10) = 1;
    end
    
    % update weights between output layer and hidden layer
    % get the error of each output layer node.
    errorsignal = classvector - outputv;
    
    % hidden layer errors - need 'outgoing' weights
    h1outgoingweights = [
        o1weights(1);
        o2weights(1);
        o3weights(1);
        o4weights(1);
        o5weights(1);
        o6weights(1);
        o7weights(1);
        o8weights(1);
        o9weights(1);
        o0weights(1)];
    
    h2outgoingweights = [
        o1weights(2);
        o2weights(2);
        o3weights(2);
        o4weights(2);
        o5weights(2);
        o6weights(2);
        o7weights(2);
        o8weights(2);
        o9weights(2);
        o0weights(2)];
    
    h3outgoingweights = [
        o1weights(3);
        o2weights(3);
        o3weights(3);
        o4weights(3);
        o5weights(3);
        o6weights(3);
        o7weights(3);
        o8weights(3);
        o9weights(3);
        o0weights(3)];
    
    hiddenlayererror = [
        (((h1outgoingweights' * errorsignal) * h1) * (1 - h1));
        (((h2outgoingweights' * errorsignal) * h2) * (1 - h2));
        (((h3outgoingweights' * errorsignal) * h3) * (1 - h3))
    ];

    % there's no delta on bias term
    % don't have to calculate any more delta, update weights.
    % egregiously verbose :c
    o1weights(1) = o1weights(1) - alpha * (h1 * errorsignal(1));
    o1weights(2) = o1weights(2) - alpha * (h2 * errorsignal(1));
    o1weights(3) = o1weights(3) - alpha * (h3 * errorsignal(1));
    o1weights(4) = o1weights(4) - alpha * errorsignal(1);

    o2weights(1) = o2weights(1) - alpha * (h1 * errorsignal(2));
    o2weights(2) = o2weights(2) - alpha * (h2 * errorsignal(2));
    o2weights(3) = o2weights(3) - alpha * (h3 * errorsignal(2));
    o2weights(4) = o2weights(4) - alpha * errorsignal(2);

    o3weights(1) = o3weights(1) - alpha * (h1 * errorsignal(3));
    o3weights(2) = o3weights(2) - alpha * (h2 * errorsignal(3));
    o3weights(3) = o3weights(3) - alpha * (h3 * errorsignal(3));
    o3weights(4) = o3weights(4) - alpha * errorsignal(3);

    o4weights(1) = o4weights(1) - alpha * (h1 * errorsignal(4));
    o4weights(2) = o4weights(2) - alpha * (h2 * errorsignal(4));
    o4weights(3) = o4weights(3) - alpha * (h3 * errorsignal(4));
    o4weights(4) = o4weights(4) - alpha * errorsignal(4);

    o5weights(1) = o5weights(1) - alpha * (h1 * errorsignal(5));
    o5weights(2) = o5weights(2) - alpha * (h2 * errorsignal(5));
    o5weights(3) = o5weights(3) - alpha * (h3 * errorsignal(5));
    o5weights(4) = o5weights(4) - alpha * errorsignal(5);

    o6weights(1) = o6weights(1) - alpha * (h1 * errorsignal(6));
    o6weights(2) = o6weights(2) - alpha * (h2 * errorsignal(6));
    o6weights(3) = o6weights(3) - alpha * (h3 * errorsignal(6));
    o6weights(4) = o6weights(4) - alpha * errorsignal(6);

    o7weights(1) = o7weights(1) - alpha * (h1 * errorsignal(7));
    o7weights(2) = o7weights(2) - alpha * (h2 * errorsignal(7));
    o7weights(3) = o7weights(3) - alpha * (h3 * errorsignal(7));
    o7weights(4) = o7weights(4) - alpha * errorsignal(7);

    o8weights(1) = o8weights(1) - alpha * (h1 * errorsignal(8));
    o8weights(2) = o8weights(2) - alpha * (h2 * errorsignal(8));
    o8weights(3) = o8weights(3) - alpha * (h3 * errorsignal(8));
    o8weights(4) = o8weights(4) - alpha * errorsignal(8);

    o9weights(1) = o9weights(1) - alpha * (h1 * errorsignal(9));
    o9weights(2) = o9weights(2) - alpha * (h2 * errorsignal(9));
    o9weights(3) = o9weights(3) - alpha * (h3 * errorsignal(9));
    o9weights(4) = o9weights(4) - alpha * errorsignal(9);

    o0weights(1) = o0weights(1) - alpha * (h1 * errorsignal(10));
    o0weights(2) = o0weights(2) - alpha * (h2 * errorsignal(10));
    o0weights(3) = o0weights(3) - alpha * (h3 * errorsignal(10));
    o0weights(4) = o0weights(4) - alpha * errorsignal(10);

    % hidden layer input weight updates.

    h1weights(1) = h1weights(1) - alpha * (i1 * hiddenlayererror(1));
    h1weights(2) = h1weights(2) - alpha * (i2 * hiddenlayererror(1));
    h1weights(3) = h1weights(3) - alpha * (i3 * hiddenlayererror(1));
    h1weights(4) = h1weights(4) - alpha * (i4 * hiddenlayererror(1));
    h1weights(5) = h1weights(5) - alpha * (i5 * hiddenlayererror(1));
    h1weights(6) = h1weights(6) - alpha * (i6 * hiddenlayererror(1));
    h1weights(7) = h1weights(7) - alpha * (i7 * hiddenlayererror(1));
    h1weights(8) = h1weights(8) - alpha * (i8 * hiddenlayererror(1));
    h1weights(9) = h1weights(9) - alpha * hiddenlayererror(1);

    h2weights(1) = h2weights(1) - alpha * (i1 * hiddenlayererror(2));
    h2weights(2) = h2weights(2) - alpha * (i2 * hiddenlayererror(2));
    h2weights(3) = h2weights(3) - alpha * (i3 * hiddenlayererror(2));
    h2weights(4) = h2weights(4) - alpha * (i4 * hiddenlayererror(2));
    h2weights(5) = h2weights(5) - alpha * (i5 * hiddenlayererror(2));
    h2weights(6) = h2weights(6) - alpha * (i6 * hiddenlayererror(2));
    h2weights(7) = h2weights(7) - alpha * (i7 * hiddenlayererror(2));
    h2weights(8) = h2weights(8) - alpha * (i8 * hiddenlayererror(2));
    h2weights(9) = h2weights(9) - alpha * hiddenlayererror(2);

    h3weights(1) = h3weights(1) - alpha * (i1 * hiddenlayererror(3));
    h3weights(2) = h3weights(2) - alpha * (i2 * hiddenlayererror(3));
    h3weights(3) = h3weights(3) - alpha * (i3 * hiddenlayererror(3));
    h3weights(4) = h3weights(4) - alpha * (i4 * hiddenlayererror(3));
    h3weights(5) = h3weights(5) - alpha * (i5 * hiddenlayererror(3));
    h3weights(6) = h3weights(6) - alpha * (i6 * hiddenlayererror(3));
    h3weights(7) = h3weights(7) - alpha * (i7 * hiddenlayererror(3));
    h3weights(8) = h3weights(8) - alpha * (i8 * hiddenlayererror(3));
    h3weights(9) = h3weights(9) - alpha * hiddenlayererror(3);
    
    % get total error
    % some total sum of squares... 
    
end


        






