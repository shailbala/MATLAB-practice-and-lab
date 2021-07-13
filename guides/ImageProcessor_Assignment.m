function varargout = ImageProcessor_Assignment(varargin)
% IMAGEPROCESSOR_ASSIGNMENT MATLAB code for ImageProcessor_Assignment.fig
%      IMAGEPROCESSOR_ASSIGNMENT, by itself, creates a new IMAGEPROCESSOR_ASSIGNMENT or raises the existing
%      singleton*.
%
%      H = IMAGEPROCESSOR_ASSIGNMENT returns the handle to a new IMAGEPROCESSOR_ASSIGNMENT or the handle to
%      the existing singleton*.
%
%      IMAGEPROCESSOR_ASSIGNMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEPROCESSOR_ASSIGNMENT.M with the given input arguments.
%
%      IMAGEPROCESSOR_ASSIGNMENT('Property','Value',...) creates a new IMAGEPROCESSOR_ASSIGNMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageProcessor_Assignment_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageProcessor_Assignment_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageProcessor_Assignment

% Last Modified by GUIDE v2.5 30-Jun-2021 17:21:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageProcessor_Assignment_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageProcessor_Assignment_OutputFcn, ...
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


% --- Executes just before ImageProcessor_Assignment is made visible.
function ImageProcessor_Assignment_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageProcessor_Assignment (see VARARGIN)

% Choose default command line output for ImageProcessor_Assignment
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageProcessor_Assignment wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ImageProcessor_Assignment_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function resizeButton_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function imageDim_Callback(hObject, eventdata, handles)
% hObject    handle to imageDim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

newDimPercentage = get(handles.imageDim, 'Value');
% get complete path to the image
p = get(handles.path, 'String');
% load image
img = imread(p);
% select axes
axes(handles.outputAxis);
% resize
img = imresize(img, newDimPercentage);
% show image
imshow(img);

% custom properties (size of image) to show image in original size
% taken from stackoverflow
[x y] = size(img);
set(handles.outputAxis, 'units', 'pixel');
pos = get(handles.outputAxis, 'position');
pos(3:4) = [y x];
set(handles.outputAxis, 'position', pos);

% display msg
str = strcat('Successfully resized image to ', num2str(newDimPercentage*100), '%');
set(handles.displayMsg, 'String', str);

% --- Executes during object creation, after setting all properties.
function imageDim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imageDim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function path_Callback(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path as text
%        str2double(get(hObject,'String')) returns contents of path as a double
p = get(handles.path,'String');

% --- Executes during object creation, after setting all properties.
function path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in loadImageButton.
function loadImageButton_Callback(hObject, eventdata, handles)
% hObject    handle to loadImageButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% get complete path to the image
p = get(handles.path,'String');
% load image
img = imread(p);
% select axes
axes(handles.inputAxis);
% show iimage
imshow(img);
% display msg
set(handles.displayMsg, 'String', 'Successfully loaded image!');


% --- Executes on button press in imageBWNegativeButton.
function imageBWNegativeButton_Callback(hObject, eventdata, handles)
% hObject    handle to imageBWNegativeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% get complete path to the image
p = get(handles.path,'String');
% load image
img = imread(p);
% gray
img = rgb2gray(img);
% image negative transform
% matrix r has values between 0 and 1
negative = 255 - img;
% get axes
axes(handles.outputAxis);
% display negative image
imshow(negative);
% display msg
set(handles.displayMsg, 'String', 'Black & White Negative Successfull!');


% --- Executes on button press in contrastButton.
function contrastButton_Callback(hObject, eventdata, handles)
% hObject    handle to contrastButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% get complete path to the image (from edit text)
p = get(handles.path,'String');
% load image
img = imread(p);
% histogram equalization
img = histeq(img);
% get axes
axes(handles.outputAxis);
% display negative image
imshow(img);
% display msg
set(handles.displayMsg, 'String', 'Contrast Enhancement Successfull!');

% --- Executes on slider movement.
function sliderBrightness_Callback(hObject, eventdata, handles)
% hObject    handle to sliderBrightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% min = 0, max = 1
%c = 1;
gamma = get(handles.sliderBrightness, 'Value');
% get complete path to the image (from edit text)
p = get(handles.path,'String');
% load image, and normalise (integers cannot be raised to double)
img = double(imread(p))/255;
% power law transform
s = img.^gamma;
% get axes
axes(handles.outputAxis);
% display negative image
imshow(s);
% display msg
str = strcat('Brightness: ', num2str(gamma*100), '%');
set(handles.displayMsg, 'String', str);

% --- Executes during object creation, after setting all properties.
function sliderBrightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderBrightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in colourNegButton.
function colourNegButton_Callback(hObject, eventdata, handles)
% hObject    handle to colourNegButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% get complete path to the image
p = get(handles.path,'String');
% load image
img = imread(p);
% image negative transform
% matrix r has values between 0 and 1
negative = 255 - img;
% get axes
axes(handles.outputAxis);
% display negative image
imshow(negative);
% display msg
set(handles.displayMsg, 'String', 'Colour Negative Successfull!');
