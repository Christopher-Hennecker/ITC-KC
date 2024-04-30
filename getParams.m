function params = getParams(name,c1,c2,number)
x1 = autoloadExperiment(itc,['./Data/',name,'-',num2str(c1*1e6),'uM.mat']);
x2= autoloadExperiment(itc,['./Data/',name,'-',num2str(c2*1e6),'uM.mat']);

%y2 is used as a resampling index (used in error analysis)
x1.y2 = 1:length(x1.x);
x2.y2 = 1:length(x2.x);

%Making a helper with all the needed info
%The two experiments
helper{1} = x1;
helper{2} = x2;

%This is for if we want to plot (initally set to 0)
helper{3} = 0;

%the two concentrations of inhibitor used
helper{4} = c1;
helper{5} = c2;

%The parameters found from fitting the no-inhibitor controls
helper{6} = [2.4,270e-6,3.6];

%The figure number we will want to plot on
helper{7} = number;

%A scaling factor for concentration (used in error analysis)
helper{8} =  1;
helper{9} =  1;

params = fitExperiment(helper);

end