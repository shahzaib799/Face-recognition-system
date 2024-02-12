

function varargout = create_db(varargin)
% CREATE_DB MATLAB code for create_db.fig
%      CREATE_DB, by itself, creates a new CREATE_DB or raises the existing
%      singleton*.
%
%      H = CREATE_DB returns the handle to a new CREATE_DB or the handle to
%      the existing singleton*.
%
%      CREATE_DB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CREATE_DB.M with the given input arguments.
%
%      CREATE_DB('Property','Value',...) creates a new CREATE_DB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before create_db_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to create_db_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help create_db

% Last Modified by GUIDE v2.5 16-Nov-2015 11:26:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;

gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @create_db_OpeningFcn, ...
                   'gui_OutputFcn',  @create_db_OutputFcn, ...
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


% --- Executes just before create_db is made visible.
function create_db_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to create_db (see VARARGIN)

% Choose default command line output for create_db
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.cam_control,'visible','off')


% UIWAIT makes create_db wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = create_db_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global capcha;
ChooseFile=imgetfile;
      capcha=imread(ChooseFile);
      % if image is not of the size of supported size then crop if not
      % otherwise
      [irow, icol] = size(capcha);
      if(irow ~= 281 && icol ~= 381)
        capcha=imcrop(capcha,[180,40,280,380]);   
      end
      imshow(capcha);
      handles.capcha = capcha;
      
% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cd TrainDatabase;
global vid;
vid=videoinput('winvideo',1,'YUY2_640x480');
set(handles.cam_control,'visible','on');
%capturenow;
%data = get(handles.pushbutton24, 'string');



% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dir = cd;   % accessing current directory

if(~(strncmp(dir, 'D:\Facerec', 15)))
    cd ..;
end 
close create_db;

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global capcha;
dir = cd;   % accessing current directory

if(~(strncmp(dir, 'D:\Facerec', 15)))
    cd ..;
end 
choice = questdlg('Would you like to save the Image?', ...
	'Save Image', ...
	'Yes','No', 'YES');
% Handle response
switch choice
    case 'Yes'
         cd D:\Facerec\TrainDatabase;
         saveimage(capcha);
    case 'No'
        msgbox([choice ' Image not saved'], 'Message', 'none');
        %close all;
%     otherwise
%         msgbox('Something Wrong!', 'Message', 'error');
end   
% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
hold off;
cla reset;
set(gca,'xtick',[],'ytick',[],'Xcolor','w','Ycolor','w')
% h=findobj(handles.axes1,'type','image'); 
% set(h,'visible','off');
% %delete(h);


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;
clear vid;
close figure 1;
set(handles.cam_control,'visible','off');
cd ..;
% --- Executes on button press in pushbutton29.

function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;
global cam;
global capcha;
if(cam)
    capcha = capture(vid);
else
    errordlg('Please On the Camera first to Continue', 'Camera Error');
end

% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;
global cam;
cam = inicamera(vid);


% --- Executes during object creation, after setting all properties.
function pushbutton26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
