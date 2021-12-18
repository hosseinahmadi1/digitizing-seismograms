clc
 clear all



%% Initialize variables.
filename = 'G:\svg\';
delimiter = {'height="','width="','</svg>','d="','in"','/>','\t',',',' ','C','M'};
startRow = 5;

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%q%q%q%q%q%q%q%q%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow-1, 'WhiteSpace', '', 'ReturnOnError', false, 'EndOfLine', '\r\n');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4,5,6,7,8]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^[-/+]*\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
testpath1 = cell2mat(raw);
%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp R;%%extract data from path matrix
%% 

cpx1=testpath1(6:length(testpath1)-1,1);  %first control point x
cpy1=testpath1(6:length(testpath1)-1,2);  %first control point y
cpx2=testpath1(6:length(testpath1)-1,3);  %second control point x
cpy2=testpath1(6:length(testpath1)-1,4);  %second control point y
xf=testpath1(6:length(testpath1)-1,5);    %end point x
yf=testpath1(6:length(testpath1)-1,6);    %end point y
xb=zeros(size(xf));
xb(1,1)=testpath1(5,1);
yb=zeros(size(yf));
yb(1,1)=testpath1(5,2);
for i=2:length(xb)                      %begining point x
    if isnan (testpath1(i+4,7))
      xb(i,1)=xf(i-1,1);
    else
        xb(i,1)=testpath1((i+4),7); 
    end
end

 for i=2:length(xb)                     %begining point y
    if  isnan (testpath1(i+4,7))
        yb(i,1)=yf(i-1,1);
    else
        yb(i,1)=testpath1((i+4),8);
    end
 end
 %% extract coordinate from bezier curve equation

dt=0.02;    %sample rate
tf=testpath1(1,1)*25.4;  %total time 
t=0:dt:tf;
t=t';
dx=(max(xf)-xb(1,1))/(tf/dt);
xb1=(xb* 25.4*testpath1(1,1)/testpath1(2,3))/dt;
px=zeros(size(t));
py=zeros(size(t));

    

for i=1:length(xf)
   n=floor(((xf(i,1)-xb(1,1))/dx)-((xb(i,1)-xb(1,1))/dx));
   nt=1/n;
   k=floor((xb(i,1)-xb(1,1))/dx)+1;
    for j=0:nt:1 
             px(k,1)=(((1-j).^3)* xb(i,1))+(((1-j).^2)*3*j*cpx1(i,1))+((1-j)*(j.^2)*3*cpx2(i,1))+(j.^3)*xf(i,1);
             py(k,1)=((1-j).^3)* yb(i,1)+(((1-j).^2)*3*j*cpy1(i,1))+((1-j)*(j.^2)*3*cpy2(i,1))+(j.^3)*yf(i,1);
             k=k+1;

    end 
end

mxlon=nan;
py=-py.*(0.2803418);
figure (1)
plot(t,py);
