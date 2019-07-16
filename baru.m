function varargout = baru(varargin)
% BARU MATLAB code for baru.fig
%      BARU, by itself, creates a new BARU or raises the existing
%      singleton*.
%
%      H = BARU returns the handle to a new BARU or the handle to
%      the existing singleton*.
%
%      BARU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BARU.M with the given input arguments.
%
%      BARU('Property','Value',...) creates a new BARU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before baru_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to baru_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help baru

% Last Modified by GUIDE v2.5 20-Nov-2018 21:10:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @baru_OpeningFcn, ...
                   'gui_OutputFcn',  @baru_OutputFcn, ...
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


% --- Executes just before baru is made visible.
function baru_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to baru (see VARARGIN)

% Choose default command line output for baru
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes baru wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = baru_OutputFcn(hObject, eventdata, handles) 
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
[NamaFile,NamaPath] = uigetfile(...
    {'*.bmp; *.jpg', 'File citra (*.bmp, *jpg)';
    '*.bmp', 'File Bitmap(*.bmp)';...
    '*jpg', 'File Jpeg(*.jpg)';
    '*.*', 'Semua File (*.*)'},...
    'Buka Citra');

gambar = imread ([NamaPath, NamaFile]);
handles.gambar = gambar ; %menyimpan nilai variabel
guidata(hObject, handles); %intruksi simpan object
axes(handles.axes1); %memasukkan nilai variabel pada axes
imshow(gambar); %menampilkan image hasil
title ('Citra Asli');


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

I=handles.gambar;

Red= I(:,:,1);
Green= I(:,:,2);
Blue= I(:,:,3); %memisahkan setiap warna RGB

reds= adapthisteq(Red);
greens= adapthisteq(Green);
blues= adapthisteq(Blue); 
%mempertajam kontrasnya dengan Contrast Limited Adaptive Histogram
%Eualization (CLAHE) pada tiap layar warnanya

edgeSharp(:,:,1)= reds;
edgeSharp(:,:,2)= greens;
edgeSharp(:,:,3)= blues; %menggambungkan kembali ketiga warna

axes(handles.axes8)
imshow(edgeSharp)
title ('1. Contrast Strecthing (CLAHE)')

axes (handles.axes2);
Gray = rgb2gray(edgeSharp); %mengubah citra warna menjadi citra grayscale    
imshow(Gray);
title('2. Greyscale Image')

axes(handles.axes3);
bw = im2bw(Gray,165/255); %mengkonversikan citra gray menjadi citra biner dengan threshold
imshow(bw);
title('3. Citra Biner')

axes(handles.axes4);
bw = imcomplement(bw);
imshow(bw);
title('4. In Biner')

axes(handles.axes5);
bw = imfill(bw,'holes'); %perbaikan garis tepi citra
bw = bwareaopen(bw,100); %untuk menghilangkan object kecil pada matriks citra dengan menghilangkan 
                            %luasan yang kurang dari 100
str = strel('disk',5);
bw = imerode(bw,str);
imshow(bw);
title('5. Biner Halus')

axes(handles.axes7);
R = edgeSharp(:,:,1);
G = edgeSharp(:,:,2);
B = edgeSharp(:,:,3);

R(~bw) =0; %pembacaan nilai tepi RGB
G(~bw) =0;
B(~bw) =0;

RGB_stretch = cat(3,R,G,B);
imshow(RGB_stretch);
title('6. Citra Hasil');

Reds= RGB_stretch(:,:,1);
Greens= RGB_stretch(:,:,2);
Blues= RGB_stretch(:,:,3);

axes(handles.axes10);
imhist(Reds); 

axes(handles.axes11);
imhist(Greens);

axes(handles.axes12);
imhist(Blues);

sumI = sum(sum(RGB_stretch));
s = size(RGB_stretch);
rata_rataI = sumI./(s(1)*s(2));

rata_rataR = rata_rataI(1);
rata_rataG = rata_rataI(2);
rata_rataB = rata_rataI(3);

set(handles.edit1,'string',rata_rataR);
set(handles.edit2,'string',rata_rataG);
set(handles.edit3,'string',rata_rataB);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

I=handles.gambar;


Red= I(:,:,1);
Green= I(:,:,2);
Blue= I(:,:,3); %memisahkan setiap warna RGB

reds= adapthisteq(Red);
greens= adapthisteq(Green);
blues= adapthisteq(Blue); 
%mempertajam kontrasnya dengan Contrast Limited Adaptive Histogram
%Eualization (CLAHE) pada tiap layar warnanya

edgeSharp(:,:,1)= reds;
edgeSharp(:,:,2)= greens;
edgeSharp(:,:,3)= blues; %menggambungkan kembali ketiga warna

Gray = rgb2gray(edgeSharp); %mengubah citra warna menjadi citra grayscale    

bw = im2bw(Gray,165/255); %mengkonversikan citra gray menjadi citra biner dengan threshold

bw = imcomplement(bw);

bw = imfill(bw,'holes'); %perbaikan garis tepi citra
bw = bwareaopen(bw,100); %untuk menghilangkan object kecil pada matriks citra dengan menghilangkan 
                            %luasan yang kurang dari 100
str = strel('disk',5);
bw = imerode(bw,str);

R = edgeSharp(:,:,1);
G = edgeSharp(:,:,2);
B = edgeSharp(:,:,3);

R(~bw) =0; %pembacaan nilai tepi RGB
G(~bw) =0;
B(~bw) =0;
RGB_stretch = cat(3,R,G,B);

sumI = sum(sum(RGB_stretch));
s = size(RGB_stretch);
rata_rataI = sumI./(s(1)*s(2));

red = rata_rataI(1);
green = rata_rataI(2);
blue = rata_rataI(3);


b = [red;green;blue];

set(handles.uitable,'data',b)

save a.mat b

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitable.
function uitable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
