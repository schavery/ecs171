train = auto(1:300,:);
test = auto(301:392,:);

ytrain = train(:,1);
xtrain = train(:,2:8);

ytest = test(:,1);
xtest = test(:,2:8);

testcount = length(ytest);

errors = zeros(1,6);

% generate the regressions for zeroth order
[w0,errors(1,1)]=multiregret(xtrain,0,ytrain);

% now we find the RSS on the test values
for n = 1:testcount
    ntherror = (ytest(n) - w0)^2;
    errors(1,2) = errors(1,2) + ntherror;
end

% first order
[w1,errors(1,3)]=multiregret(xtrain,1,ytrain);

% the feature vector is now necessary
for n = 1:testcount
    fv = [1,xtest(n,:)];
    
    ntherror = (ytest(n) - (fv * w1))^2;
    errors(1,4) = errors(1,4) + ntherror;
end

% second order
[w2,errors(1,5)]=multiregret(xtrain,2,ytrain);
fv = ones(1,2*length(xtest(1,:))+1);

for n = 1:testcount
    fv = [1,xtest(n,:),xtest(n,:).^2];
    ntherror = (ytest(n) - (fv * w2))^2;
    errors(1,6) = errors(1,6) + ntherror;
end




