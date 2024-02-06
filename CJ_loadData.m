% Program Loads in data from excel spreadsheet
%
%
DataE = readtable('olympic_data.xlsx');
%
data = table2cell(DataE);
%
[row col] = size(data);

