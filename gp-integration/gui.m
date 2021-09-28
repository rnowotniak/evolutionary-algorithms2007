function varargout = gui(varargin)
% GUI M-file for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 15-Jan-2008 21:33:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
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
cla;
hold on;
Pc = str2double(get(handles.pcEdit, 'String'));
Pm = str2double(get(handles.pmEdit, 'String'));
poplen = str2double(get(handles.poplenEdit, 'String'));
maxdepth = str2double(get(handles.maxdepthEdit, 'String'));
ITERATIONS = str2double(get(handles.iterationsEdit, 'String'));

xmin = str2double(get(handles.xminEdit, 'String'));
xmax = str2double(get(handles.xmaxEdit, 'String'));
discr = str2double(get(handles.discrEdit, 'String'));
delta = str2double(get(handles.deltaEdit, 'String'));

fun = get(handles.functionEdit, 'String');
if length(fun) == 0
    msgbox('Uzupelnij wszystkie pola lub kliknij ktoras funkcje testowa na liscie ''Examples''', 'Informacja', 'help');
    return
end
zad4

function functionEdit_Callback(hObject, eventdata, handles)
% hObject    handle to functionEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of functionEdit as text
%        str2double(get(hObject,'String')) returns contents of functionEdit as a double


% --- Executes during object creation, after setting all properties.
function functionEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to functionEdit (see GCBO)
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



function maxdepthEdit_Callback(hObject, eventdata, handles)
% hObject    handle to maxdepthEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxdepthEdit as text
%        str2double(get(hObject,'String')) returns contents of maxdepthEdit as a double


% --- Executes during object creation, after setting all properties.
function maxdepthEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxdepthEdit (see GCBO)
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



function discrEdit_Callback(hObject, eventdata, handles)
% hObject    handle to discrEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of discrEdit as text
%        str2double(get(hObject,'String')) returns contents of discrEdit as a double


% --- Executes during object creation, after setting all properties.
function discrEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to discrEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function deltaEdit_Callback(hObject, eventdata, handles)
% hObject    handle to deltaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of deltaEdit as text
%        str2double(get(hObject,'String')) returns contents of deltaEdit as a double


% --- Executes during object creation, after setting all properties.
function deltaEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to deltaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in examplesListbox.
function examplesListbox_Callback(hObject, eventdata, handles)
% hObject    handle to examplesListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = get(hObject,'String');
s = contents{get(hObject,'Value')};
if strcmp(s, 'sin(x) ./ (x+1).^2')
    set(handles.pcEdit, 'String', '0.75');
    set(handles.pmEdit, 'String', '0.10');
    set(handles.poplenEdit, 'String', '30');
    set(handles.maxdepthEdit, 'String', '5');
    set(handles.iterationsEdit, 'String', '400');
    set(handles.xminEdit, 'String', '0.01');
    set(handles.xmaxEdit, 'String', '5');
    set(handles.functionEdit, 'String', 'sin(x) ./ (x+1).^2');
    set(handles.discrEdit, 'String', '20');
    set(handles.deltaEdit, 'String', '0.001');
elseif strcmp(s, 'exp(-(x.^2))')
    set(handles.pcEdit, 'String', '0.60');
    set(handles.pmEdit, 'String', '0.3');
    set(handles.poplenEdit, 'String', '20');
    set(handles.maxdepthEdit, 'String', '4');
    set(handles.iterationsEdit, 'String', '400');
    set(handles.xminEdit, 'String', '-3');
    set(handles.xmaxEdit, 'String', '3');
    set(handles.functionEdit, 'String', 'exp(-(x.^2))');
    set(handles.discrEdit, 'String', '30');
    set(handles.deltaEdit, 'String', '0.001');
elseif strcmp(s, 'sin(sin(x) + x)')
    set(handles.pcEdit, 'String', '0.6');
    set(handles.pmEdit, 'String', '0.30');
    set(handles.poplenEdit, 'String', '30');
    set(handles.maxdepthEdit, 'String', '4');
    set(handles.iterationsEdit, 'String', '400');
    set(handles.xminEdit, 'String', '-5');
    set(handles.xmaxEdit, 'String', '5');
    set(handles.functionEdit, 'String', 'sin(sin(x) + x)');
    set(handles.discrEdit, 'String', '20');
    set(handles.deltaEdit, 'String', '0.001');
elseif strcmp(s, 'sin(x) ./ log(x)')
    set(handles.pcEdit, 'String', '0.60');
    set(handles.pmEdit, 'String', '0.30');
    set(handles.poplenEdit, 'String', '30');
    set(handles.maxdepthEdit, 'String', '5');
    set(handles.iterationsEdit, 'String', '400');
    set(handles.xminEdit, 'String', '1.5');
    set(handles.xmaxEdit, 'String', '8');
    set(handles.functionEdit, 'String', 'sin(x) ./ log(x)');
    set(handles.discrEdit, 'String', '20');
    set(handles.deltaEdit, 'String', '0.001');
elseif strcmp(s, 'x + sin(x)')
    set(handles.pcEdit, 'String', '0.75');
    set(handles.pmEdit, 'String', '0.1');
    set(handles.poplenEdit, 'String', '20');
    set(handles.maxdepthEdit, 'String', '4');
    set(handles.iterationsEdit, 'String', '200');
    set(handles.xminEdit, 'String', '-3');
    set(handles.xmaxEdit, 'String', '3');
    set(handles.functionEdit, 'String', 'x+sin(x)');
    set(handles.discrEdit, 'String', '20');
    set(handles.deltaEdit, 'String', '0.001');
elseif strcmp(s, 'x .* sin(x)')
    set(handles.pcEdit, 'String', '0.60');
    set(handles.pmEdit, 'String', '0.3');
    set(handles.poplenEdit, 'String', '30');
    set(handles.maxdepthEdit, 'String', '4');
    set(handles.iterationsEdit, 'String', '400');
    set(handles.xminEdit, 'String', '0.01');
    set(handles.xmaxEdit, 'String', '6');
    set(handles.functionEdit, 'String', 'x.*sin(x)');
    set(handles.discrEdit, 'String', '20');
    set(handles.deltaEdit, 'String', '0.001');
else
    disp('BLAD!!');
end







% --- Executes during object creation, after setting all properties.
function examplesListbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to examplesListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


