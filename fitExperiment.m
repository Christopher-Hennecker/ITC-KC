function params = fitExperiment(helper)
Ki = [1e-8,1e-7,1e-6,1e-5,1e-4,1e-3,1e-2];
kinact = [0,1e-4,1e-3,1e-2,1e-1,1];


%Here we make all the posible combinations of Ki and kinact
Ps = [];
for i = 1:length(Ki)
    for j = 1:length(kinact)
        Ps = [Ps;Ki(i),kinact(j)];
    end
end


%Here we check each set to see which is best
allParams = [];
allDiffs = [];
for i = 1:size(Ps,1)
    params = Ps(i,:);

    diff = meritITC(params,helper);
    allParams = [allParams;params];
    allDiffs = [allDiffs;diff];
end

%We take the best starting parameters and run it through the optimization
[~,ind] = min(allDiffs);
params = allParams(ind,:);
helper{3} = 0;
[params,~] = fminsearch(@meritITC,params,[],helper);


%We plot if desired
helper{3} = helper{7};
meritITC(params,helper)
params(1:2) = abs(params(1:2));
end