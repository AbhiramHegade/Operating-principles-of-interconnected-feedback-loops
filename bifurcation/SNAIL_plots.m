clear all
[x,v,s,h,f] =SNAIL_bifur; 
a = x(4,:); %bifurcation parameter
b = x(2,:); 
c = a./1000; %bifurcation parameter normalized by 1000

%% Based on eigenvalues to judge stable vs. unstable states
ind = zeros(1,4);
snum = size(f);
num = snum(2);
j = 1;
n = 1;

for n = 1:1:(num-1)
    x11 = find(f(:,n) > 0);
    x12 = find(f(:,n+1) > 0);
    if isempty(x11) && ~isempty(x12)
        ind(j) = n + 1;
        j = j + 1;
    elseif ~isempty(x11) && isempty(x12)
        ind(j) = n + 1;
        j = j + 1;
    end
end

%%

amat=[c(ind(1)) c(ind(2)) c(ind(4)) c(ind(end))];
figure1 = figure('Color',[1 1 1],'units','normalized','outerposition',[0 0 1 1]);
plot(c(1:ind(1)),b(1:ind(1)),'b');
hold on
plot(c(ind(1)+1:ind(2)),b(ind(1)+1:ind(2)),'r');
plot(c(ind(2)+1:ind(3)),b(ind(2)+1:ind(3)),'b'); 
plot(c(ind(3)+1:ind(end)),b(ind(3)+1:ind(end)),'r');
plot(c(ind(end)+1:end),b(ind(end)+1:end),'b');
% 
% 
xlim([100 250]);  % [100 250] for snail
xlabel('SNAIL (10^3 molecules)');  %Lambda 3
ylabel('zeb mRNA'); %zeb mRNA
%fig = gcf;
%exportgraphics(fig,'bifurcation(2).png','Resolution',600)
% sound(sin(1:3000));


