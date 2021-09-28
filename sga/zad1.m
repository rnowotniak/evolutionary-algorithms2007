function varargout = zad1(varargin)
% ZAD1 M-file for zad1.fig
%      ZAD1, by itself, creates a new ZAD1 or raises the existing
%      singleton*.
%
%      H = ZAD1 returns the handle to a new ZAD1 or the handle to
%      the existing singleton*.
%
%      ZAD1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZAD1.M with the given input arguments.
%
%      ZAD1('Property','Value',...) creates a new ZAD1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zad1_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zad1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help zad1

% Last Modified by GUIDE v2.5 05-Oct-2007 16:27:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zad1_OpeningFcn, ...
                   'gui_OutputFcn',  @zad1_OutputFcn, ...
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


% --- Executes just before zad1 is made visible.
function zad1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zad1 (see VARARGIN)

% Choose default command line output for zad1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zad1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zad1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in drawButton.
function drawButton_Callback(hObject, eventdata, handles)
% hObject    handle to drawButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fitness xmin xmax poplen precision Pc Pm iterations selection coding
fitness = get(handles.fitnessEdit, 'String');
xmin = str2double(get(handles.xminEdit, 'String'));
xmax = str2double(get(handles.xmaxEdit, 'String'));
poplen = str2double(get(handles.poplenEdit, 'String'));
precision = str2double(get(handles.precisionEdit, 'String'));
Pc = str2double(get(handles.pcEdit, 'String'));
Pm = str2double(get(handles.pmEdit, 'String'));
iterations = str2double(get(handles.iterationsEdit, 'String'));
if get(handles.tournamentRadioButton, 'Value')
    selection = 'tournament';
else
    selection = 'roulette';
end
if get(handles.binaryCoding, 'Value')
    coding = 'binary';
else
    coding = 'gray';
end
sga




function xminEdit_Callback(hObject, eventdata, handles)
% hObject    handle to xminEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xminEdit as text
%        str2double(get(hObject,'String')) returns contents of xminEdit as a double


% --- Executes during object creation, after setting all properties.
function xminEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xminEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function xmaxEdit_Callback(hObject, eventdata, handles)
% hObject    handle to xmaxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmaxEdit as text
%        str2double(get(hObject,'String')) returns contents of xmaxEdit as a double


% --- Executes during object creation, after setting all properties.
function xmaxEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmaxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function pcEdit_Callback(hObject, eventdata, handles)
% hObject    handle to pcEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pcEdit as text
%        str2double(get(hObject,'String')) returns contents of pcEdit as a double


% --- Executes during object creation, after setting all properties.
function pcEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pcEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function pmEdit_Callback(hObject, eventdata, handles)
% hObject    handle to pmEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pmEdit as text
%        str2double(get(hObject,'String')) returns contents of pmEdit as a double


% --- Executes during object creation, after setting all properties.
function pmEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pmEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function fitnessEdit_Callback(hObject, eventdata, handles)
% hObject    handle to fitnessEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fitnessEdit as text
%        str2double(get(hObject,'String')) returns contents of fitnessEdit as a double


% --- Executes during object creation, after setting all properties.
function fitnessEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fitnessEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function poplenEdit_Callback(hObject, eventdata, handles)
% hObject    handle to poplenEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of poplenEdit as text
%        str2double(get(hObject,'String')) returns contents of poplenEdit as a double


% --- Executes during object creation, after setting all properties.
function poplenEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to poplenEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function precisionEdit_Callback(hObject, eventdata, handles)
% hObject    handle to precisionEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of precisionEdit as text
%        str2double(get(hObject,'String')) returns contents of precisionEdit as a double


% --- Executes during object creation, after setting all properties.
function precisionEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to precisionEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function iterationsEdit_Callback(hObject, eventdata, handles)
% hObject    handle to iterationsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterationsEdit as text
%        str2double(get(hObject,'String')) returns contents of iterationsEdit as a double


% --- Executes during object creation, after setting all properties.
function iterationsEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterationsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in playButton.
function playButton_Callback(hObject, eventdata, handles)
% hObject    handle to playButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if exist('MOVIE')
    global MOVIE
    movie(MOVIE,5,8);
end


% --- Executes on selection change in functionsListBox.
function functionsListBox_Callback(hObject, eventdata, handles)
% hObject    handle to functionsListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

contents = get(hObject,'String');
s = contents{get(hObject,'Value')};
if strcmp(s, 'trig 1')
    set(handles.fitnessEdit, 'String', 'sin(x).*x.^3.*cos(x).^2./x');
    set(handles.xminEdit, 'String', '6');
    set(handles.xmaxEdit, 'String', '17');
    set(handles.poplenEdit, 'String', '30');
elseif strcmp(s, 'humps*sin')
    set(handles.fitnessEdit, 'String', 'humps(x).*sin(x)');
    set(handles.xminEdit, 'String', '-2');
    set(handles.xmaxEdit, 'String', '4');
    set(handles.poplenEdit, 'String', '50');
elseif strcmp(s, 'trig 2')
    set(handles.fitnessEdit, 'String', 'sin(x).*cos(x).*x');
    set(handles.xminEdit, 'String', '-3');
    set(handles.xmaxEdit, 'String', '5');
    set(handles.poplenEdit, 'String', '30');
elseif strcmp(s, 'heaviside')
    set(handles.fitnessEdit, 'String', 'heaviside(x)');
    set(handles.xminEdit, 'String', '-2');
    set(handles.xmaxEdit, 'String', '2');
    set(handles.poplenEdit, 'String', '30');
end


% --- Executes during object creation, after setting all properties.
function functionsListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to functionsListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


