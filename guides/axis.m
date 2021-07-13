function varargout = axis(varargin)
% AXIS MATLAB code for axis.fig
%      AXIS, by itself, creates a new AXIS or raises the existing
%      singleton*.
%
%      H = AXIS returns the handle to a new AXIS or the handle to
%      the existing singleton*.
%
%      AXIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AXIS.M with the given input arguments.
%
%      AXIS('Property','Value',...) creates a new AXIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before axis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to axis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help axis

% Last Modified by GUIDE v2.5 30-Jun-2021 14:27:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @axis_OpeningFcn, ...
                   'gui_OutputFcn',  @axis_OutputFcn, ...
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


% --- Executes just before axis is made visible.
function axis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to axis (see VARARGIN)

% Choose default command line output for axis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes axis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = axis_OutputFcn(hObject, eventdata, handles) 
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

% select axes
axes(handles.axes1);
x = 0:10;
y = 0:10;
plot(x,y);
title('Axis1');
xlabel('x data');
ylabel('y data');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% select axes
axes(handles.axes2);
x = 0:10;
y = x.^2;
plot(x,y);
title('Axis2');
xlabel('x data');
ylabel('y = x^2');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% clear
cla(handles.axes1, 'reset');
cla(handles.axes2, 'reset');
