function varargout = Assignment24JuneQ2guide(varargin)
% ASSIGNMENT24JUNEQ2GUIDE MATLAB code for Assignment24JuneQ2guide.fig
%      ASSIGNMENT24JUNEQ2GUIDE, by itself, creates a new ASSIGNMENT24JUNEQ2GUIDE or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT24JUNEQ2GUIDE returns the handle to a new ASSIGNMENT24JUNEQ2GUIDE or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT24JUNEQ2GUIDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT24JUNEQ2GUIDE.M with the given input arguments.
%
%      ASSIGNMENT24JUNEQ2GUIDE('Property','Value',...) creates a new ASSIGNMENT24JUNEQ2GUIDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment24JuneQ2guide_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment24JuneQ2guide_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment24JuneQ2guide

% Last Modified by GUIDE v2.5 24-Jun-2021 17:03:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment24JuneQ2guide_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment24JuneQ2guide_OutputFcn, ...
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


% --- Executes just before Assignment24JuneQ2guide is made visible.
function Assignment24JuneQ2guide_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment24JuneQ2guide (see VARARGIN)

% Choose default command line output for Assignment24JuneQ2guide
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment24JuneQ2guide wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment24JuneQ2guide_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
edit1 = str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
edit2 = str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in add.
function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edit1, 'String'));
b = str2num(get(handles.edit2, 'String'));
c = num2str(a+b);
set(handles.text5, 'String', c);
set(handles.resultStatement, 'String', 'Operator Used: addition');

% --- Executes on button press in subtract.
function subtract_Callback(hObject, eventdata, handles)
% hObject    handle to subtract (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edit1, 'String'));
b = str2num(get(handles.edit2, 'String'));
c = num2str(a-b);
set(handles.text5, 'String', c);
set(handles.resultStatement, 'String', 'Operator Used: subtraction');

% --- Executes on button press in multiply.
function multiply_Callback(hObject, eventdata, handles)
% hObject    handle to multiply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edit1, 'String'));
b = str2num(get(handles.edit2, 'String'));
c = num2str(a*b);
set(handles.text5, 'String', c);
set(handles.resultStatement, 'String', 'Operator Used: multiplication');

% --- Executes on button press in divide.
function divide_Callback(hObject, eventdata, handles)
% hObject    handle to divide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edit1, 'String'));
b = str2num(get(handles.edit2, 'String'));
% no divide by 0 error, returns Inf
c = num2str(a/b);
set(handles.text5, 'String', c);
set(handles.resultStatement, 'String', 'Operator Used: division');

% --- Executes on button press in power.
function power_Callback(hObject, eventdata, handles)
% hObject    handle to power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edit1, 'String'));
b = str2num(get(handles.edit2, 'String'));
c = num2str(a^b);
set(handles.text5, 'String', c);
set(handles.resultStatement, 'String', 'Operator Used: power');

% --- Executes on button press in modulo.
function modulo_Callback(hObject, eventdata, handles)
% hObject    handle to modulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edit1, 'String'));
b = str2num(get(handles.edit2, 'String'));
op = mod(a,b);
c = num2str(op);
set(handles.text5, 'String', c);
set(handles.resultStatement, 'String', 'Operator Used: modulo');

% --- Executes on button press in nroot.
function nroot_Callback(hObject, eventdata, handles)
% hObject    handle to nroot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edit1, 'String'));
b = str2num(get(handles.edit2, 'String'));
b = 1/b;
c = num2str(a^b);
set(handles.text5, 'String', c);
set(handles.resultStatement, 'String', 'Operator Used: nth root');

% --- Executes on button press in logarithm.
function logarithm_Callback(hObject, eventdata, handles)
% hObject    handle to logarithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edit1, 'String'));
%b = str2num(get(handles.edit2, 'String'));
c = num2str(log(a));
set(handles.text5, 'String', c);
set(handles.resultStatement, 'String', 'Operator Used: log');

% --- Executes on button press in sine.
function sine_Callback(hObject, eventdata, handles)
% hObject    handle to sine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edit1, 'String'));
%b = str2num(get(handles.edit2, 'String'));
c = sin(a);
op = num2str(c);
set(handles.text5, 'String', op);
set(handles.resultStatement, 'String', 'Operator Used: sine');

% --- Executes on button press in tan.
function tan_Callback(hObject, eventdata, handles)
% hObject    handle to tan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edit1, 'String'));
c = tan(a);
op = num2str(c);
set(handles.text5, 'String', op);
set(handles.resultStatement, 'String', 'Operator Used: tangent');

% --- Executes on button press in cos.
function cos_Callback(hObject, eventdata, handles)
% hObject    handle to cos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edit1, 'String'));
c = cos(a);
op = num2str(c);
set(handles.text5, 'String', op);
set(handles.resultStatement, 'String', 'Operator Used: cosine');


% --- Executes on button press in reciprocal.
function reciprocal_Callback(hObject, eventdata, handles)
% hObject    handle to reciprocal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = str2num(get(handles.edit1, 'String'));
c = 1/a;
op = num2str(c);
set(handles.text5, 'String', op);
set(handles.resultStatement, 'String', 'Operator Used: reciprocal');
