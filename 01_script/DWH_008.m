function DWH_008

for page = 1
    filename = strcat('1',num2str(page),'.jpg') ;
    img = imread(filename) ;
    img = im2bw(img , 220/255) ;
    imwrite(img , strcat('.\' , filename));
    disp(strcat('ȥˮӡ��ɣ���',num2str(page) , '��'));
end