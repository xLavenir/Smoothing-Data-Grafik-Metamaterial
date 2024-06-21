% Script for making smooth data

clear
clc

% Collecting the data raw
matriksData = xlsread('test1.xlsx');

result=zeros(length(matriksData),7);
b=zeros(length(matriksData));

outputFile = 'oprekData_test.xlsx';
col_header={'Freq(Thz)','smooth moving','smooth lowess','smooth loess','smooth sgolay','smooth rlowess','smooth rloess'};

x=matriksData(:,1);
y=matriksData(:,2);

yy1 = smooth(x,y,0.1,'moving');
yy2 = smooth(x,y,0.1,'lowess');
yy3 = smooth(x,y,0.1,'lowess');
yy4 = smooth(x,y,0.1,'sgolay');
yy5 = smooth(x,y,0.1,'rlowess');
yy6 = smooth(x,y,0.1,'rloess');

for idx=1:1:length(matriksData)
    result(idx,1)=x(idx);
    result(idx,2)=yy1(idx);
    result(idx,3)=yy2(idx);
    result(idx,4)=yy3(idx);
    result(idx,5)=yy4(idx);
    result(idx,6)=yy5(idx);
    result(idx,7)=yy6(idx);
end

xlswrite(outputFile,result,'Sheet1','A2'); %Write data
xlswrite(outputFile,col_header,'Sheet1','A1'); %Write column header
