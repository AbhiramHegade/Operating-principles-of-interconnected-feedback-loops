clc;
clear all;
% to the dir, natsorting, opening the three run files
pth1 = '/Users/abhiramhegade/Desktop/trial/trial/TS/run_1/';
liste1 = dir(strcat(pth1,'*.dat'));
liste1_sort = natsortfiles(liste1);
files1 = {liste1_sort.name};

pth2 = '/Users/abhiramhegade/Desktop/trial/trial/TS/run_2/';
liste2 = dir(strcat(pth2,'*.dat'));
liste2_sort = natsortfiles(liste2);
files2 = {liste2_sort.name};

pth3 = '/Users/abhiramhegade/Desktop/trial/trial/TS/run_3/';
liste3 = dir(strcat(pth3,'*.dat'));
liste3_sort = natsortfiles(liste3);
files3 = {liste3_sort.name};

%% 

for k = 1:numel(files1)
  file1{k} = strcat(pth1,files1{k});
  data1{k} = importdata(file1{k});
  file2{k} = strcat(pth2,files2{k});
  data2{k} = importdata(file2{k});
  file3{k} = strcat(pth3,files3{k});
  data3{k} = importdata(file3{k});

  xx = size(data1{k});
  ncol = xx(2);
  simu_mean{k} = (data1{k}(:, 2:ncol) + data2{k}(:, 2:ncol) + data3{k}(:, 2:ncol))./3;
  
  filename = files1{k};
  fullfilename = strcat(filename(1:length(filename)-4),'_mean.dat');  %deleting last 4 characters from the actual file name
  writematrix(simu_mean{k},fullfilename, 'Delimiter','tab');
end