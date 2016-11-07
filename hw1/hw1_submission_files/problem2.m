% Requires the PMTK3 toolbox for pscatter
% y was built by hand, using low_index and high_index from problem1.m
y = [1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;2;1;1;2;2;2;2;2;2;1;1;1;1;1;2;2;2;1;1;1;1;1;1;1;1;1;1;1;1;1;2;1;1;2;2;2;2;2;3;2;2;2;2;2;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;1;2;2;2;2;2;2;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;2;1;1;1;1;1;1;1;2;1;1;1;2;1;1;2;2;1;1;1;2;1;1;1;1;1;2;2;2;2;1;1;1;1;1;1;1;1;2;2;2;2;2;2;2;2;2;2;2;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;2;1;2;2;2;2;1;2;1;2;2;2;2;2;2;2;2;2;2;1;1;1;1;2;2;2;2;2;2;2;2;1;1;1;1;2;2;2;2;1;1;1;1;1;1;1;1;1;2;2;3;2;2;1;1;1;1;1;1;1;1;1;1;1;1;2;2;2;2;2;2;2;2;2;1;1;3;3;2;3;3;1;1;1;1;1;1;2;1;1;1;1;1;1;1;1;1;1;2;2;2;2;1;2;2;2;1;1;2;1;2;2;1;1;2;1;1;1;1;1;1;1;1;1;1;2;3;3;2;2;2;2;2;3;3;2;3;2;2;2;2;3;3;2;3;2;2;2;1;3;2;2;3;2;3;2;3;3;3;3;2;3;2;2;2;2;3;2;2;2;2;2;2;3;3;3;2;3;3;3;3;3;2;2;2;2;2;2;2;2;2;2;2;2;1;1;2;2;2;2;2;2;2;3;3;2;3;3;3;3;2;3;2;3;2;3;2;2;2;3;2;2;3;2;2;2];

% set up the names of each column
vnames = {'mpg','cylinders','displacement','horsepower','weight','acceleration','model year','origin'};

% set up the marks to use in the plot
% red = low, blue = medium, green = high
% not sure what the 'k+' is for, since we only have three classes
plotsymbol = {'r.','b.','g.','k+'};

% run the plot,
% y is the vector of classes
figure;
pscatter(auto, 'y', y, 'vnames', vnames, 'plotsymbol', plotsymbol);
