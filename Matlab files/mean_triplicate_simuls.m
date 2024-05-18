clear all;
clc;
%d=dir('*.dat');
%x = natsortfiles(d); %natsortfiles({d.name});
%for i=1:numel(x)
 % vals{i} = importdata(x(i).name);
%end

run1 = dir(fullfile('Users', 'abhiramhegade', 'Desktop','trial','trial','TS','run_1', '*_solution.dat'));
run1_sort = natsortfiles(run1);
run2 = dir(fullfile('Users', 'abhiramhegade', 'Desktop','trial','trial','TS','run_2', '*_solution.dat'));
run2_sort = natsortfiles(run2);
run3 = dir(fullfile('Users', 'abhiramhegade', 'Desktop','trial','trial','TS','run_3', '*_solution.dat'));
run3_sort = natsortfiles(run3);

for i=1:numel(run1_sort) %loop runs upto the number of files in a folder
  simu1{i} = importdata(run1_sort(i).name); 
  simu2{i} = importdata(run2_sort(i).name);
  simu3{i} = importdata(run3_sort(i).name);
  xx = size(simu1{1});
  ncol = xx(2);
  simu_mean{i} = (simu1{i}(:, 4:ncol) + simu2{i}(:, 4:ncol) + simu3{i}(:, 4:ncol))./3;
  
  filename = run1_sort(i).name;
  fullfilename = strcat(filename(1:length(filename)-9),'.dat');  %deleting last 9 characters from the actual file name
  writematrix(simu_mean{i},fullfilename, 'Delimiter','tab');
  %dlmwrite(fullfilename, simu_mean{i}, 'delimiter', '\t')
    
end

%S = dir(fullfile('F:\', 'NPDF-SERB-DST', 'RACIPE-ANALYSIS','4 basic networks','GRHL','GRHL_solution_files','sim1', '*_run2.dat')); % Finds file with run_ and a digit in its name
%[~,X] = natsortfiles({S.name});
%S = S(X);