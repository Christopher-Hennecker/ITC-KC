function params = getErrors(name,c1,c2,number)
x1 = autoloadExperiment(itc,['./Data/',name,'-',num2str(c1*1e6),'uM.mat']);
x2= autoloadExperiment(itc,['./Data/',name,'-',num2str(c2*1e6),'uM.mat']);

%The helper is the same as in the "getParams" function
helper{1} = x1;
helper{2} = x2;
helper{3} = 0;
helper{4} = c1;
helper{5} = c2;
helper{6} = [2.4,270e-6,3.6];
helper{7} = number;
helper{8} =  1;
helper{9} =  1;


params = [];
for i = 1:1000
    %Can't change the helper inside a parfor loop, so I make a new one
    helper2 = helper;
    
    %Here I get a random concentration of substrate
    helper2{8} = normrnd(3.6,0.2)/3.6;
    helper2{9} = normrnd(3.6,0.2)/3.6;

    
   %Here I resample the experimental data
    helper2{1}.y2 = sort(datasample(1:1:length(helper2{2}.x),length(helper2{2}.x)));
    helper2{2}.y2 = sort(datasample(1:1:length(helper2{2}.x),length(helper2{2}.x)));
   
    params1 = fitExperiment(helper2);
    params(i,:) = params1(:)';
end
end