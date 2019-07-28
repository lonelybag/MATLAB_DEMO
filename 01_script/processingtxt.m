function processingtxt
%%
% filename = '1.txt';
% delimiterIn = ' ';  %????????????
% headerlinesIn = 4;
% A = importdata(filename,delimiterIn,headerlinesIn);
%%
filename = '1.txt';
fileID = fopen(filename);
s1 = textscan(fileID, '%s' , 'Delimiter',{' ','\n'});
s11 = s1{1,1}

% xlswrite('??', s1{:}); % §Õ?excel???

fid=fopen('2.txt','w');
fprintf(fid,'%s\r',s11{:});
fclose(fid);
%%
% ffid = fopen('1.txt','r');
% tline = fgetl(ffid)
% i = 1;
% feof(ffid)
% 
% while feof(ffid) == 0
%     tline1{i,1} = fgetl(ffid);
%     i = i+1;
% end
% 
% fclose(ffid);
