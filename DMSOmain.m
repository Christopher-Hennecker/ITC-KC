


DMSO1 = autoloadExperiment(itc,'./Data/DMSO1.mat');
DMSO2 = autoloadExperiment(itc,'./Data/DMSO2.mat');
DMSO3 = autoloadExperiment(itc,'./Data/DMSO3.mat');

helper = {};
helper{1} = DMSO1;
helper{4} = 1;

p1 = fitDMSO(helper,1);
helper{1} = DMSO2;
p2 = fitDMSO(helper,2);
helper{1} = DMSO3;
p3 = fitDMSO(helper,3);

p = [p1;p2;p3];

