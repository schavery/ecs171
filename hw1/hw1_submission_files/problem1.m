% auto.dat was modified to remove the names of the vehicles
% as well as removing the 6 models where displacement was unknown.
auto = load('-ascii','auto.dat');

% the size in MPG of each bin
binsize = range(auto(:,1)) / 3;
% > 12.533

% the min and max of auto form the upper and lower boundaries
% of the bins
automin = min(auto(:,1));
automax = max(auto(:,1));

% now we can find the rows that are within the range of the lowest
% third of MPGs
low_index = (auto(:,1) < (automin + binsize));
low = auto(low_index,:);
max(low);
% > 21.5
% this is the threshold for low MPG
% there are 182 rows in the low category

high_index = (auto(:,1) > (automax - binsize));
high = auto(high_index,:);
min(high);
% > 34.1
% there are 42 rows in the high MPG category
% which leaves 392 - 182 - 42 = 168 in the medium category
