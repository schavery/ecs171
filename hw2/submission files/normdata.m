% normalize the inputs.
alm_norm = (alm - mean(alm)) ./ range(alm);
erl_norm = (erl - mean(erl)) ./ range(erl);
gvh_norm = (gvh - mean(gvh)) ./ range(gvh);
mcg_norm = (mcg - mean(mcg)) ./ range(mcg);

mit_norm = (mit - mean(mit)) ./ range(mit);
nuc_norm = (nuc - mean(nuc)) ./ range(nuc);
pox_norm = (pox - mean(pox)) ./ range(pox);
vac_norm = (vac - mean(vac)) ./ range(vac);


normfeats = [mcg_norm,gvh_norm,alm_norm,mit_norm,erl_norm,pox_norm,vac_norm,nuc_norm];


% create a sample selection
samplelen = length(normfeats(:,1));
traininglen = .75 * samplelen;
testinglen = samplelen - traininglen;

v = [ones(traininglen,1);zeros(testinglen,1)];

rowperm = randperm(samplelen);
selectedrows = v(rowperm);

trainset = normfeats(selectedrows == 1,:);
testset = normfeats(selectedrows == 0,:);

trainlabel = classification(selectedrows == 1);
testlabel = classification(selectedrows == 0);

