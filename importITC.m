[names,di] = uigetfile('./*.*','MultiSelect','on');
for jj = 1:length(names)
    name = names{jj};

ff = fileread(strcat(di,name));
ff = strsplit(ff);
data = [];
injections = {};
inj = 0;
currInd = 1;
for i = 1:length(ff)
    if length(ff{i}>1)
    if ff{i}(1) == '@'
        injData = [];
        inj = inj+1;
    end
    end
    currPoint = split(ff{i},',');
    
    if length(currPoint) >= 7
       currData = [];
       
       for j = 1:length(currPoint)
           currData = [currData,str2num(currPoint{j})];
       end
       injData = [injData;currInd];
       injections{inj} = injData;
       data = [data;currData];
       currInd = currInd+1;
    end


end
x = itc();
x.x = data(:,1);
x.y = data(:,2);
x.inj = injections;
x.name = name(1:length(name)-4);
x.loc = './Data/';
saveExperiment(x);

end