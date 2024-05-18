%%import the file and keep file names only (removing the path)
meanfile=readtable("simulationmeanfile.txt");
%meanfile.networkfile=eraseBetween(meanfile.networkfile,1,53);
errorfile=readtable("simulationerrorfile.txt");
%errorfile.networkfile=eraseBetween(errorfile.networkfile,1,53);

%% 
%bar(1:5,[meanfile{66,2:end}; meanfile{93,2:end}; meanfile{3,2:end}; meanfile{112,2:end}; meanfile{37,2:end}]);
%bar(1:5,[meanfile{66,2:end}; meanfile{93,2:end}; meanfile{3,2:end}; meanfile{37,2:end}]);
ylim([0 100]);                                                 % Set Y-Axis Limits 66,93,3,112,37
legend(meanfile{[72,99,3,43],"networkfile"})