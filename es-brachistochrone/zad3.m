function varargout = zad3(varargin)
% ZAD3 M-file for zad3.fig
%      ZAD3, by itself, creates a new ZAD3 or raises the existing
%      singleton*.
%
%      H = ZAD3 returns the handle to a new ZAD3 or the handle to
%      the existing singleton*.
%
%      ZAD3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZAD3.M with the given input arguments.
%
%      ZAD3('Property','Value',...) creates a new ZAD3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zad3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zad3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zad3

% Last Modified by GUIDE v2.5 28-Nov-2007 19:35:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zad3_OpeningFcn, ...
                   'gui_OutputFcn',  @zad3_OutputFcn, ...
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


% --- Executes just before zad3 is made visible.
function zad3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zad3 (see VARARGIN)

% Choose default command line output for zad3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zad3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zad3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global cd ci k
cla;
hold on;
ax = str2double(get(handles.axEdit, 'String'));
ay = str2double(get(handles.ayEdit, 'String'));
bx = str2double(get(handles.bxEdit, 'String'));
by = str2double(get(handles.byEdit, 'String'));
cd = str2double(get(handles.cdEdit, 'String'));
ro = str2double(get(handles.roEdit, 'String'));


if get(handles.gaussRadiobutton, 'Value')
    mutation = 'gauss';
else
    mutation = 'random';
end

steps = str2num(get(handles.stepsEdit, 'String'));

points = [ax, ax + (bx - ax)/3, bx - (bx - ax)/3, bx;
          ay, ay - (ay - by)/3, by + (ay - by)/3 ,by];

xmin = min(points(1,:)) - 10;
xmax = max(points(1,:)) + 10;
ymin = min(points(2,:)) - 10;
ymax = max(points(2,:)) + 10;
axis([xmin xmax ymin ymax]);

evolutionaryStrategy(points,steps,mutation,ro,cd);
drawCykloid([ax;ay],[bx;by]);



% x = [0:0.1:5];
% y = [];
% for i =1:length(x)
% y = [y,calculateGauss(x(i),ro,mi)];
% end
% x
% y
% plot (x,y);

drawnow;
disp('koniec');


function axEdit_Callback(hObject, eventdata, handles)
% hObject    handle to axEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of axEdit as text
%        str2double(get(hObject,'String')) returns contents of axEdit as a double


% --- Executes during object creation, after setting all properties.
function axEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ayEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ayEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ayEdit as text
%        str2double(get(hObject,'String')) returns contents of ayEdit as a double


% --- Executes during object creation, after setting all properties.
function ayEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ayEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bxEdit_Callback(hObject, eventdata, handles)
% hObject    handle to bxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bxEdit as text
%        str2double(get(hObject,'String')) returns contents of bxEdit as a double


% --- Executes during object creation, after setting all properties.
function bxEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function byEdit_Callback(hObject, eventdata, handles)
% hObject    handle to byEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of byEdit as text
%        str2double(get(hObject,'String')) returns contents of byEdit as a double


% --- Executes during object creation, after setting all properties.
function byEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to byEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mutationRateEdit_Callback(hObject, eventdata, handles)
% hObject    handle to mutationRateEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mutationRateEdit as text
%        str2double(get(hObject,'String')) returns contents of mutationRateEdit as a double


% --- Executes during object creation, after setting all properties.
function mutationRateEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mutationRateEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function miEdit_Callback(hObject, eventdata, handles)
% hObject    handle to miEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of miEdit as text
%        str2double(get(hObject,'String')) returns contents of miEdit as a double


% --- Executes during object creation, after setting all properties.
function miEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to miEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function roEdit_Callback(hObject, eventdata, handles)
% hObject    handle to roEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of roEdit as text
%        str2double(get(hObject,'String')) returns contents of roEdit as a double


% --- Executes during object creation, after setting all properties.
function roEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to roEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cdEdit_Callback(hObject, eventdata, handles)
% hObject    handle to cdEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cdEdit as text
%        str2double(get(hObject,'String')) returns contents of cdEdit as a double


% --- Executes during object creation, after setting all properties.
function cdEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cdEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ciEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ciEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ciEdit as text
%        str2double(get(hObject,'String')) returns contents of ciEdit as a double


% --- Executes during object creation, after setting all properties.
function ciEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ciEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kEdit_Callback(hObject, eventdata, handles)
% hObject    handle to kEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kEdit as text
%        str2double(get(hObject,'String')) returns contents of kEdit as a double


% --- Executes during object creation, after setting all properties.
function kEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stepsEdit_Callback(hObject, eventdata, handles)
% hObject    handle to stepsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stepsEdit as text
%        str2double(get(hObject,'String')) returns contents of stepsEdit as a double


% --- Executes during object creation, after setting all properties.
function stepsEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stepsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


