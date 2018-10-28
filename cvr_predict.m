%% Read data and adjust inputs and targets
m = readtable('~/Downloads/KAG_conversion_data.csv');

% yield gender to array
m.gender = categorical(m.gender);
gender = dummyvar(m.gender);
gender_d = array2table(gender);
m = [m, gender_d];
m.gender = [];

% yield age to array
m.age = categorical(m.age);
age = dummyvar(m.age);
age_d = array2table(age);
m = [m, age_d];
m.age = [];

% define inputs and targets
target = m.Total_Conversion';
m.Total_Conversion = [];

target2 = m.Approved_Conversion';
m.Approved_Conversion = [];

inputs = table2array(m(:, (4:13)))';


%% Load and test bayesian regularization

% One of the selected target
testval = target(:, 1143);
fprintf('Real conversion value %i\n', testval);
fprintf('Forecasted value for future %i\n', bayesian_regularization(testval));

