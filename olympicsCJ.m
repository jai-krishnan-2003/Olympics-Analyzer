function olympicsCJ(app)
%
% Load in the data into a table
DataE = readtable('olympic_data.xlsx');
% Turn the table into a cell array
data = table2cell(DataE);
%
%% Pie Chart
% Get input from the app
year_text = app.YearButtonGroup_7.SelectedObject.Text;
% Switch case to determine what value for year was selected
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
% Get the value for the country
country = app.CountryDropDown.Value;
% Set counts to 0
malecount = 0; 
femalecount = 0;
% Run through all the data sets and determine which ones
% Match the inputed year and country
% If the year and countries match then the counter of male or female
% Increases based on the data
for i = 1:936
    if data{i,9} == year && strcmp(country,data{i,6}) && strcmp('M',data{i,2})
        malecount = malecount + 1;
    elseif data{i,9} == year && strcmp(country,data{i,6}) && strcmp('F',data{i,2})
        femalecount = femalecount + 1;
    elseif year == 00 && strcmp(country,data{i,6}) && strcmp('F',data{i,2})
        femalecount = femalecount + 1;
    elseif year == 00 && strcmp(country,data{i,6}) && strcmp('M',data{i,2})
        malecount = malecount + 1;
    elseif year == 00 && strcmp('All',country) && strcmp('F',data{i,2})
        femalecount = femalecount + 1;
    elseif year == 00 && strcmp('All',country) && strcmp('M',data{i,2})
        malecount = malecount + 1;
    elseif data{i,9} == year && strcmp('All',country) && strcmp('F',data{i,2})
        femalecount = femalecount + 1;
    elseif data{i,9} == year && strcmp('All',country) && strcmp('M',data{i,2})
        malecount = malecount + 1;
    end
end
% 
% Determine pecrentages for the males and females and display them
total = malecount + femalecount;
app.Female.Value = femalecount;
app.Male.Value = malecount;
% Labels for the pie chart
% Graph the pie chart
labels = {sprintf('Male (%.02f%%)',(malecount/total)*100),sprintf('Female (%.02f%%)',(femalecount/total)*100)};
pie(app.PieChart, [malecount, femalecount],labels)
%
%
%% Medals Bar Graph
%
% Set medal counts to 0
bronze = 0;
silver = 0;
gold = 0;
% Run through the data to see how many medals were won for the selected
% Year and country
for i = 1:936
    if data{i,9} == year && strcmp(country,data{i,6}) && strcmp('Bronze',data{i,12})
        bronze = bronze + 1;
    elseif data{i,9} == year && strcmp(country,data{i,6}) && strcmp('Silver',data{i,12})
        silver = silver + 1;
    elseif data{i,9} == year && strcmp(country,data{i,6}) && strcmp('Gold',data{i,12})
        gold = gold + 1;
    elseif year == 00 && strcmp(country,data{i,6}) && strcmp('Silver',data{i,12})
        silver = silver +1;
    elseif year == 00 && strcmp(country,data{i,6}) && strcmp('Gold',data{i,12})
        gold = gold +1;
    elseif year == 00 && strcmp(country,data{i,6}) && strcmp('Bronze',data{i,12})
        bronze = bronze +1;
    elseif year == 00 && strcmp(country,'All') && strcmp('Silver',data{i,12})
        silver = silver +1;
    elseif year == 00 && strcmp(country,'All') && strcmp('Gold',data{i,12})
        gold = gold +1;
    elseif year == 00 && strcmp(country,'All') && strcmp('Bronze',data{i,12})
        bronze = bronze +1;
    elseif data{i,9} == year && strcmp(country,'All') && strcmp('Bronze',data{i,12})
        bronze = bronze + 1;
    elseif data{i,9} == year && strcmp(country,'All') && strcmp('Silver',data{i,12})
        silver = silver + 1;
    elseif data{i,9} == year && strcmp(country,'All') && strcmp('Gold',data{i,12})
        gold = gold + 1;
    end
end
% Plot the data on a bar chart
x = categorical({'Bronze','Silver','Gold'});
y = [bronze, silver, gold];
bar(app.MedalDist,x,y,"cyan")
%
%
%% Radio Group
% Get input from app
selectedButton = app.YearButtonGroup_7.SelectedObject.Text;
% This if statement determines which host city 
% the olympics was hosted for the selected year
if strcmp('1998',selectedButton)
    app.HostCity.Value = 'Nagano';
elseif strcmp('2002',selectedButton)
    app.HostCity.Value = 'Salt Lake City';
elseif strcmp('2006',selectedButton)
    app.HostCity.Value = 'Torino';
elseif strcmp('2010',selectedButton)
    app.HostCity.Value = 'Vancouver';
elseif strcmp('2014',selectedButton)
    app.HostCity.Value = 'Sochi';
else
    app.HostCity.Value = 'NA';
end
%
%% Histogram
%
% Set counters and height and weight vectors
counter_h = 1;
counter_w = 1;
height = zeros(1);
weight = zeros(1);
% Make a for loop to cycle through the data to collect height and weight
% Of the athletes that match the selected year and country
for i = 1:936
    if data{i,9} == year && strcmp(country,data{i,6})
        height(counter_h) = data{i,4};
        weight(counter_w) = data{i,5};
        counter_h = counter_h + 1;
        counter_w = counter_w + 1;
    elseif year == 00 && strcmp(country,data{i,6})
        height(counter_h) = data{i,4};
        weight(counter_w) = data{i,5};
        counter_h = counter_h + 1;
        counter_w = counter_w + 1;
    elseif year == 00 && strcmp(country,'All')
        height(counter_h) = data{i,4};
        weight(counter_w) = data{i,5};
        counter_h = counter_h + 1;
        counter_w = counter_w + 1;
    elseif data{i,9} == year && strcmp(country,'All')
        height(counter_h) = data{i,4};
        weight(counter_w) = data{i,5};
        counter_h = counter_h + 1;
        counter_w = counter_w + 1;
    end
end
% Determine whether the user wants wieght or height
choice = app.ButtonGroup.SelectedObject.Text;
% If statment to display either wieght or height
if choice == 'Height'
    histogram(app.Histogram,[height])
    xlabel(app.Histogram, 'Height (cm)')
elseif choice == 'Weight'
    histogram(app.Histogram,[weight])
    xlabel(app.Histogram, 'Weight (kg)')
end
%
%


