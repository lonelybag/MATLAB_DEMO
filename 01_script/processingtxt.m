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
s11 = s1{1,1};

str = s1{1,1};
expression = '\(\w*\)';
replace = '';

newStr = regexprep(str,expression,replace) ;
newStr(cellfun(@isempty,newStr))=[];
j = 1 ;
for i = 1 : 1 : length(newStr)
    xx = mod(i,2);
    if(xx == 1)
        newStr1{j,1} = newStr{i,1};
    else
        newStr1{j,2} = newStr{i,1};
        j = j + 1 ;
    end
end
newStr1

% xlswrite('??', newStr1{:}); % §Õ?excel???

% fid=fopen('col_1.txt','w');
% fprintf(fid,'%s \r',newStr1{:,1});
% fclose(fid);
% 
% fid=fopen('col_2.txt','w');
% fprintf(fid,'%s \r',newStr1{:,2});
% fclose(fid);

fid=fopen('sum.txt','w');
fprintf(fid,'%s %s \r',newStr{:});
fclose(fid);
%% ???????
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
