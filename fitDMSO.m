function params = fitDMSO(helper,plotI)

options = [];
params = [2,250e-6,3];
[params,~] = fminsearch(@meritDMSO,params,options,helper);

helper{3} = plotI;
meritDMSO(params,helper)

end