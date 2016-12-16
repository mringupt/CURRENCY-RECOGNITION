function varargout = MY(varargin)
% MY MATLAB code for MY.fig
%      MY, by itself, creates a new MY or raises the existing
%      singleton*.
%
%      H = MY returns the handle to a new MY or the handle to
%      the existing singleton*.
%
%      MY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MY.M with the given input arguments.
%
%      MY('Property','Value',...) creates a new MY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MY_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MY_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MY

% Last Modified by GUIDE v2.5 26-Nov-2016 23:06:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MY_OpeningFcn, ...
                   'gui_OutputFcn',  @MY_OutputFcn, ...
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


% --- Executes just before MY is made visible.
function MY_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MY (see VARARGIN)

% Choose default command line output for MY
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MY wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MY_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in selectf.
function selectf_Callback(hObject, eventdata, handles)
% hObject    handle to selectf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[imname,impath]=uigetfile({'*.jpg;*.png'});
im=imread([impath,'/',imname]);
%preprocessing
%resize image
im=imresize(im,[128 128]);
%remove noise;
%seperate channels
 r_channel=im(:,:,1);
 b_channel=im(:,:,2);
 g_channel=im(:,:,3);
 %denoise each channel
 r_channel=medfilt2(r_channel);
 g_channel=medfilt2(g_channel);
 b_channel=medfilt2(b_channel);
 %restore channels
 rgbim(:,:,1)=r_channel;
 rgbim(:,:,2)=g_channel;
 rgbim(:,:,3)=b_channel;
 %featureextraction
fet=totalfeature(rgbim);
load projectdb;

k=length(my_database);
disp(k);
for j=1:k
    D(j)=dist(fet',my_database(1,j).feature);
  
end
[value,index]=min(D);
if value<2000
   currency_name=my_database(index).unnamed;
     currency_country=my_database(index).unnamed1;
   fprintf('recognized currency is : ');
   disp(currency_name);
    switch index
        case 1
            axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\australiandollar.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\australiaf.jpg');
            case 2
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\danish krone.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\Denmarkf.jpg');
            case 3
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\dollar.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\usaf.jpg');
            case 4
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\egyptian pound.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\egypt.jpg');
            case 5
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\france euro.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\francef.jpg');
            case 6
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\Iceland_Currency_krona.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\Icelandf.jpg');
            case 7
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\indianrupee.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\indiaf.jpg');
            case 8
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\indonesia.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\indonesiaf.jpg');
            case 9
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\iran.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\iranf.jpg');
            case 10
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\korea.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\koreaf.jpg');
            case 11
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\malaysia.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\malaysiaf.jpg');
            case 12
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\yen.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\chinaf.jpg');
            case 13
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\russia rouble.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\russiaf.jpg');
            case 14
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\saud-arabia1.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\saudif.jpg');
            case 15
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\soth africa.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\africaf.jpg');
            case 16
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\Switzerland 1000 Franken.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\sf.jpg');
            case 17
                axes(handles.axes1);
            imshow('C:\Users\Dell\Desktop\currenynotes\turkey.jpg');
            axes(handles.axes2);
            imshow('C:\Users\Dell\Desktop\currenyf\turkeyf.jpg');
    end
            
        
   
   
   
   
   
   
else
  currency_name='invalid currency';
  currency_country='x';
  axes(handles.axes1);
  imshow('C:\Users\Dell\Desktop\currenynotes\download.jpg');
  axes(handles.axes2);
   imshow('C:\Users\Dell\Desktop\currenynotes\download.jpg');
    disp('no matches found');
end

set(handles.text1,'String',currency_name);
set(handles.text2,'String',currency_country);
% --- Executes on button press in display.
function display_Callback(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
