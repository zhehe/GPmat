% DEMOIL3 Oil data with deterministic training conditional approximation.

% FGPLVM

% Fix seeds
randn('seed', 1e5);
rand('seed', 1e5);

dataSetName = 'oil';
experimentNo = 3;

% load data
[Y, lbls] = lvmLoadData(dataSetName);

% Set up model
numActive = 100;
latentDim = 2;

% use the fully independent training conditional.
model = fgplvmCreate(Y, latentDim, 'dtc', numActive, {'rbf', 'bias', ...
                    'white'}, 'gaussian');

% Optimise the model.
iters = 1000;
display = 1;

model = fgplvmOptimise(model, display, iters);

% Save the results.
capName = dataSetName;;
capName(1) = upper(capName(1));
save(['dem' capName num2str(experimentNo) '.mat'], 'model');



% Load the results and display dynamically.
fgplvmResultsDynamic(dataSetName, experimentNo, 'vector')

% compute the nearest neighbours errors in latent space.
errors = fgplvmNearestNeighbour(model, lbls);
