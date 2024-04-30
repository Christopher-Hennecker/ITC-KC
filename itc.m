
classdef itc
    properties
        name
        inj
        x
        y
        y2
        baseline
        baselineRegion
        loc
    end
    methods
        function saveExperiment(temp)
            final = strcat(temp.loc,'/',temp.name);
            final = strcat(final,'.mat');
            save(final);
            return
        end %Saves an experiment by its Location\name.m
        function p = loadExperiment(~)
            [filename,path] = uigetfile('./Data');
            file = strcat(path, filename);
            t = load(file);
            p = t.temp;
        end %loads experiment\
         function p = autoloadExperiment(~,file)
           t = load(file);
           p = t.temp;
       end %loads experiment\
       function cellExperiments = loadExperiments(temp) %creates cell array of all 
           
           [names,di] = uigetfile('./Data/*.*','MultiSelect','on');
           if ~iscell(names)
               names = {names};
           end
           for jj = 1:length(names)
               namet = names{jj};
               location = strcat(di,namet);
               tempExperiment = load(location);
               tempExperiment = tempExperiment.temp;
               tempExperiment.loc = strcat(di,'/');
               cellExperiments{jj} = tempExperiment;

           end
       end

    end
end