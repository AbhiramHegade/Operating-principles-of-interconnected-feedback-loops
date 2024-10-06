clc;
clear all;

filelist = dir(fullfile('/Users/abhiramhegade/Desktop/E', '**', '*run_1')); 
%MeanPercent=zeros(size(filelist,1),7)
for i = 1:numel(filelist)

    pth = filelist(i).folder;

% to the dir, natsorting, opening the three run files

    pth1 = strcat(pth,'/run_1/');
    liste1 = dir(strcat(pth1,'*.dat'));
    liste1_sort = natsortfiles(liste1);
    files1 = {liste1_sort.name};

    pth2 = strcat(pth,'/run_2/');
    liste2 = dir(strcat(pth2,'*.dat'));
    liste2_sort = natsortfiles(liste2);
    files2 = {liste2_sort.name};

    pth3 = strcat(pth,'/run_3/');
    liste3 = dir(strcat(pth3,'*.dat'));
    liste3_sort = natsortfiles(liste3);
    files3 = {liste3_sort.name};


% numel(files1) == numel(files2) && numel(files2) == numel(files3)
    Num=[numel(files1), numel(files2), numel(files3)];
    m=min(Num);
    n=m-1;
    size_mean=zeros(1,7);
    widthpercent=zeros(1,7);
       for k = 3:n
           file1{k} = strcat(pth1,files1{k});
           data1{k} = importdata(file1{k});
           size1{k} = size(data1{k});   %size refers to number of models reaching monostability

           file2{k} = strcat(pth2,files2{k});
           data2{k} = importdata(file2{k});
           size2{k} = size(data2{k});

           file3{k} = strcat(pth3,files3{k});
           data3{k} = importdata(file3{k});
           size3{k} = size(data3{k});
           
           z=[size1{k}(1,1), size2{k}(1,1), size3{k}(1,1)];
           widthpercent(k)=(max(z)-min(z))/100; %gives in 100%
           size_mean(k) = (size1{k}(1,1) + size2{k}(1,1) + size3{k}(1,1))./300; %gives in 100%
           %fprintf('Average number of parameter sets reaching %d order stability is %f\n', k-2, size_mean{k})

       end
    MeanPercent(i,:) =  size_mean;
    percenterror(i,:) = widthpercent;
end
MeanPercent(:,[1,2])=[];
percenterror(:,[1,2])=[];
%% obtain mean table which contains network file, percentage of models going to (column number -1)-1 order stability.
C={filelist.folder}';
C1=cell2table(C);
MeanPercent=array2table(MeanPercent);
meantable = [C1, MeanPercent];
meantable = renamevars(meantable,["C","MeanPercent1","MeanPercent2","MeanPercent3","MeanPercent4","MeanPercent5"],["networkfile","monostable","bistable","tristable","tetrastable","pentahigher"]);
meantable.networkfile=eraseBetween(meantable.networkfile,1,38);

percenterror=array2table(percenterror);
percenterrortable = [C1, percenterror];
percenterrortable = renamevars(percenterrortable,["C","percenterror1","percenterror2","percenterror3","percenterror4","percenterror5"],["networkfile","monostableerror","bistableerror","tristableerror","tetrastableerror","pentahighererror"]);
percenterrortable.networkfile=eraseBetween(percenterrortable.networkfile,1,38);

%% 
writetable(meantable,'simulationmeanfile3.txt','Delimiter','\t');
writetable(percenterrortable,'simulationerrorfile3.txt','Delimiter','\t');

%% 
