function varargout = GUII(varargin)
% GUII MATLAB code for GUII.fig
%      GUII, by itself, creates a new GUII or raises the existing
%      singleton*.
%
%      H = GUII returns the handle to a new GUII or the handle to
%      the existing singleton*.
%
%      GUII('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUII.M with the given input arguments.
%
%      GUII('Property','Value',...) creates a new GUII or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUII_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUII_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUII

% Last Modified by GUIDE v2.5 21-Oct-2015 02:59:30


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUII_OpeningFcn, ...
                   'gui_OutputFcn',  @GUII_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUII is made visible.
function GUII_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUII (see VARARGIN)

% Choose default command line output for GUII
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUII wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUII_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in image.
function image_Callback(hObject, eventdata, handles)
% hObject    handle to image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ext='*.png' ; 
folder='C:\Users\Hossein\Desktop\Sac';
[filename, path] = uigetfile(fullfile(folder,ext)) ;
X=imread(fullfile(path, filename));
X=rgb2gray(X);

[row,column]=find(X~=255);

D=cat(2,row,column);

for i=1:1:max(D(:,2)) 
   [rows]=find(D(:,2)==i);
   vecMean=mean(D(rows));
   Signal(i)=vecMean;
end

F=(1:max(D(:,2))).*(0.06737978);
Signal= Signal.*(0.2803418);

T=cat(1,F,Signal)';

d=readsac('aa.SAC');
d.trace=T;
dsac.slat=125;


end









function Lat_Callback(hObject, eventdata, handles)
% hObject    handle to Lat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lat as text
%        str2double(get(hObject,'String')) returns contents of Lat as a double


% --- Executes during object creation, after setting all properties.
function Lat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Lon_Callback(hObject, eventdata, handles)
% hObject    handle to Lon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Lon as text
%        str2double(get(hObject,'String')) returns contents of Lon as a double


% --- Executes during object creation, after setting all properties.
function Lon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Elv_Callback(hObject, eventdata, handles)
% hObject    handle to Elv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Elv as text
%        str2double(get(hObject,'String')) returns contents of Elv as a double


% --- Executes during object creation, after setting all properties.
function Elv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Elv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function StationName_Callback(hObject, eventdata, handles)
% hObject    handle to StationName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StationName as text
%        str2double(get(hObject,'String')) returns contents of StationName as a double


% --- Executes during object creation, after setting all properties.
function StationName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StationName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Comp.
function Comp_Callback(hObject, eventdata, handles)
% hObject    handle to Comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Comp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Comp


% --- Executes during object creation, after setting all properties.
function Comp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Year_Callback(hObject, eventdata, handles)
% hObject    handle to Year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Year as text
%        str2double(get(hObject,'String')) returns contents of Year as a double


% --- Executes during object creation, after setting all properties.
function Year_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Days_Callback(hObject, eventdata, handles)
% hObject    handle to Days (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Days as text
%        str2double(get(hObject,'String')) returns contents of Days as a double


% --- Executes during object creation, after setting all properties.
function Days_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Days (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Hours_Callback(hObject, eventdata, handles)
% hObject    handle to Hours (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Hours as text
%        str2double(get(hObject,'String')) returns contents of Hours as a double


% --- Executes during object creation, after setting all properties.
function Hours_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hours (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Min_Callback(hObject, eventdata, handles)
% hObject    handle to Min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Min as text
%        str2double(get(hObject,'String')) returns contents of Min as a double


% --- Executes during object creation, after setting all properties.
function Min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Sec_Callback(hObject, eventdata, handles)
% hObject    handle to Sec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sec as text
%        str2double(get(hObject,'String')) returns contents of Sec as a double


% --- Executes during object creation, after setting all properties.
function Sec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MiliSec_Callback(hObject, eventdata, handles)
% hObject    handle to MiliSec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MiliSec as text
%        str2double(get(hObject,'String')) returns contents of MiliSec as a double


% --- Executes during object creation, after setting all properties.
function MiliSec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MiliSec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Duration_Callback(hObject, eventdata, handles)
% hObject    handle to Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Duration as text
%        str2double(get(hObject,'String')) returns contents of Duration as a double


% --- Executes during object creation, after setting all properties.
function Duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TotalSamples_Callback(hObject, eventdata, handles)
% hObject    handle to TotalSamples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TotalSamples as text
%        str2double(get(hObject,'String')) returns contents of TotalSamples as a double


% --- Executes during object creation, after setting all properties.
function TotalSamples_CreateFcn(hObject, eventdata, handles)

% hObject    handle to TotalSamples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)

dsac.slat=str2double(get(handles.Lat, 'string'));
dsac.slon=str2double(get(handles.Lon, 'string'));
dsac.salt=str2double(get(handles.Elv, 'string'));
dsac.staname=get(handles.StationName, 'string');
dsac.an=str2double(get(handles.Year, 'string'));
dsac.jr=str2double(get(handles.Days, 'string'));
dsac.hr=str2double(get(handles.Hours, 'string'));
dsac.mn=str2double(get(handles.Min, 'string'));
dsac.sec=str2double(get(handles.Sec, 'string'));
dsac.msec=str2double(get(handles.MiliSec, 'string'));
dsac.et=str2double(get(handles.Duration, 'string'));
dsac.npts=str2double(get(handles.TotalSamples, 'string'));



% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)











