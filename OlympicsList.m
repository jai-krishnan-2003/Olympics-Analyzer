function OlympicsList(app)
%
% Load in data
DataE = readtable('olympic_data.xlsx');
%
data = table2cell(DataE);
%
% Get year value from user
year_text = app.YearButtonGroup_7.SelectedObject.Text;
% Swtich case to determine which year they selected
switch year_text
    case '1998'
        year = str2num(app.YearButtonGroup_7.SelectedObject.Text);
    case '2002'
        year = str2num(app.YearButtonGroup_7.SelectedObject.Text);
    case '2006'
        year = str2num(app.YearButtonGroup_7.SelectedObject.Text);
    case '2010'
        year = str2num(app.YearButtonGroup_7.SelectedObject.Text);
    case '2014'
        year = str2num(app.YearButtonGroup_7.SelectedObject.Text);
    case 'All'
        year = 00;
end
% Get country value from user
country = app.CountryDropDown.Value;
%% Table Data
%
% Set counters to zero and made four different arrays
counter_1 = 0;
counter_2 = 0;
counter_3 = 0;
counter_4 = 0;
a = [];
b = [];
c = [];
d = [];
% Make a table full of empty rows
% This is used to clear any previous data stored in the table
for ide = 1:936
    app.Table.Data{ide,1} = [' '];
    app.Table.Data{ide,2} = [' '];
    app.Table.Data{ide,3} = [' '];
    app.Table.Data{ide,4} = [' '];
end

% For loop used to cycle through data to see if
% The data matches the year or country
% If it does match, then the counter increases
% And the row of that data is stored into an array
for in = 1:936
    if data{in,9} == year && strcmp(country,data{in,6})
        counter_1 = counter_1 + 1;
        a(counter_1) = in;
    elseif year == 00 && strcmp(country,data{in,6})
        counter_2 = counter_1 + 1;
        b(counter_2) = in;
    elseif year == 00 && strcmp('All',country)
        counter_3 = counter_3 + 1;  
        c(counter_3) = in;
    elseif data{in,9} == year && strcmp('All',country)
        counter_4 = counter_4 + 1; 
        d(counter_4) = in;
    end
end
% Determine which counter to use for the table
if counter_1 > counter_2 && counter_1 > counter_3 && counter_1 > counter_4
    counter_select = 'counter_1';
elseif counter_2 > counter_1 && counter_2 > counter_3 && counter_2 > counter_4
    counter_select = 'counter_2';
elseif counter_3 > counter_1 && counter_3 > counter_2 && counter_3 > counter_4
    counter_select = 'counter_3';
elseif counter_4 > counter_1 && counter_4 > counter_3 && counter_4 > counter_2
    counter_select = 'counter_4';
else
    counter_select = 'none';
end
% Using which counter is selected, plot the data
% using the row indexes stored in the matching array
% In the table
switch counter_select
    case 'counter_1'
        for i = 1:counter_1
            ind = a(i);
            app.Table.Data{i,1} = data{ind,1};
            app.Table.Data{i,2} = data{ind,6};
            app.Table.Data{i,3} = data{ind,2};
            app.Table.Data{i,4} = data{ind,12};
        end
    case 'counter_2'
        for i = 1:counter_2
            ind = b(i);
            app.Table.Data{i,1} = data{ind,1};
            app.Table.Data{i,2} = data{ind,6};
            app.Table.Data{i,3} = data{ind,2};
            app.Table.Data{i,4} = data{ind,12};
        end
    case 'counter_3'
        for i = 1:counter_3
            ind = c(i);
            app.Table.Data{i,1} = data{ind,1};
            app.Table.Data{i,2} = data{ind,6};
            app.Table.Data{i,3} = data{ind,2};
            app.Table.Data{i,4} = data{ind,12};
        end
    case 'counter_4'
        for i = 1:counter_4
            ind = d(i);
            app.Table.Data{i,1} = data{ind,1};
            app.Table.Data{i,2} = data{ind,6};
            app.Table.Data{i,3} = data{ind,2};
            app.Table.Data{i,4} = data{ind,12};
        end
    case 'none'
            app.Table.Data{1,1} = [' '];
            app.Table.Data{1,2} = [' '];
            app.Table.Data{1,3} = [' '];
            app.Table.Data{1,4} = [' '];
end
%
%
