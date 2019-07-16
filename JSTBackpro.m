function varargout = JSTBackpro(varargin)
% JSTBACKPRO MATLAB code for JSTBackpro.fig
%      JSTBACKPRO, by itself, creates a new JSTBACKPRO or raises the existing
%      singleton*.
%
%      H = JSTBACKPRO returns the handle to a new JSTBACKPRO or the handle to
%      the existing singleton*.
%
%      JSTBACKPRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JSTBACKPRO.M with the given input arguments.
%

%      JSTBACKPRO('Property','Value',...) creates a new JSTBACKPRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before JSTBackpro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to JSTBackpro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help JSTBackpro

% Last Modified by GUIDE v2.5 18-Feb-2019 00:49:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @JSTBackpro_OpeningFcn, ...
                   'gui_OutputFcn',  @JSTBackpro_OutputFcn, ...
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


% --- Executes just before JSTBackpro is made visible.
function JSTBackpro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to JSTBackpro (see VARARGIN)

% Choose default command line output for JSTBackpro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes JSTBackpro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = JSTBackpro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

proyek=guidata(gcbo);
a = load('inputdatalatih.mat'); %data training
t = load('output.mat'); %target

%membangun jaringan
net=newff(minmax(a.inputdatalatih),[40 15 5 3], {'logsig' 'logsig' 'logsig' 'logsig'},'trainrp', 'learngdm', 'mse') %neural dan layer

%melihat bobot awal
bobotawal_Input = net.IW{1,1} %bobot akan direndom oleh matlab

%penentuan parameter training
net.trainParam.epoch=1000; %jumlah iterasi
net.trainParam.goal=0.0001; %minimalnilai eror
net.trainParam.lr=0.01; %learning rate
net.trainParam.mc=0.9; %momentum

%melakukan training
net=train(net,a.inputdatalatih,t.output)

%melihat bobot akhir
bobotakhir = net.IW{1,1}
bias_akhir = net.b{1}
bobotunit_tersembunyi = net.LW{2,1}
biasunit_tersembunyi = net.b{2}
bobotunit_tersembunyi_ke_output = net.LW{3,2}
biasunit_tersembunyi_ke_output = net.b{3}

save net.mat net

hasil=sim(net,a.inputdatalatih)


f = msgbox('Training Completed','Success');


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

guidata(hObject,handles);
d = handles.rata_rataI(1);
e = handles.rata_rataI(2);
f = handles.rata_rataI(3);
c = [d;e;f];

load net.mat

bobot_akhir = net.IW{1,1}
bias_akhir = net.b{1}
bobotunit_tersembunyi = net.LW{2,1}
biasunit_tersembunyi = net.b{2}
bobotunit_tersembunyi_ke_output = net.LW{3,2}
biasunit_tersembunyi_ke_output = net.b{3}

%melakukan testing
hasil=sim(net,c)
hasil=round(hasil)
hasil=transpose(hasil)

if (hasil==[1 0 0])
    set(handles.text9,'string','Matang');
elseif (hasil==[0 1 0])
    set(handles.text9,'string','Mentah');
elseif (hasil==[0 0 1])
    set(handles.text9,'string','Terlalu Matang');
else
    set(handles.text9,'string','Tidak Diketahui');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hasil=[]
set(handles.text9,'string',hasil)

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

proyek=guidata(gcbo);
[namafile,direktori]=uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif'},'Buka Gambar');
if isequal(namafile,0);
return;
end
eval(['cd ''' direktori ''';']);
I=imread(namafile);
set(proyek.figure1,'CurrentAxes',proyek.axes1);
set(imshow(I));

set(proyek.figure1,'Userdata',I);
set(proyek.axes1,'Userdata',I);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
proyek=guidata (gcbo);
I=get(proyek.axes1,'Userdata');

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

set(proyek.figure1,'CurrentAxes',proyek.axes2);
set(imshow(edgeSharp));
set(proyek.figure1,'Userdata',edgeSharp);
set(proyek.axes2,'Userdata',edgeSharp);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

proyek=guidata (gcbo);
edgeSharp=get(proyek.axes2,'Userdata');
Igray=rgb2gray(edgeSharp);
set(proyek.figure1,'CurrentAxes',proyek.axes3);
set(imshow(Igray));
set(proyek.figure1,'Userdata',Igray);
set(proyek.axes3,'Userdata',Igray);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

proyek=guidata(gcbo);
Igray=get(proyek.axes3,'Userdata');
Ibw = im2bw(Igray,165/255); %mengkonversikan citra gray menjadi citra biner 
                            %dengan threshold
set(proyek.figure1,'CurrentAxes',proyek.axes4);
set(imshow(Ibw));
set(proyek.figure1,'Userdata',Ibw);
set(proyek.axes4,'Userdata',Ibw);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

proyek=guidata(gcbo);
Ibw=get(proyek.axes4,'Userdata');
Ibw = imcomplement(Ibw);
set(proyek.figure1,'CurrentAxes',proyek.axes5);
set(imshow(Ibw));
set(proyek.figure1,'Userdata',Ibw);
set(proyek.axes5,'Userdata',Ibw);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

proyek=guidata(gcbo);
Ibw=get(proyek.axes5,'Userdata');
Ibw = imfill(Ibw,'holes'); %perbaikan garis tepi citra
Ibw = bwareaopen(Ibw,100); %untuk menghilangkan object kecil pada matriks 
                    %citra dengan menghilangkan luasan yang kurang dari 100
str = strel('disk',5);
Ibw = imerode(Ibw,str);
set(proyek.figure1,'CurrentAxes',proyek.axes6);
set(imshow(Ibw));
set(proyek.figure1,'Userdata',Ibw);
set(proyek.axes6,'Userdata',Ibw);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

proyek=guidata(gcbo);
edgeSharp=get(proyek.axes2,'Userdata');
Ibw=get(proyek.axes6,'Userdata');

R = edgeSharp(:,:,1);
G = edgeSharp(:,:,2);
B = edgeSharp(:,:,3);

R(~Ibw) =0; %pembacaan nilai tepi RGB
G(~Ibw) =0;
B(~Ibw) =0;

RGB_stretch = cat(3,R,G,B);

set(proyek.figure1,'CurrentAxes',proyek.axes7);
set(imshow(RGB_stretch));
set(proyek.figure1,'Userdata',RGB_stretch);
set(proyek.axes7,'Userdata',RGB_stretch);

sumI = sum(sum(RGB_stretch)); %jumlah nilai RGB
s = nnz(RGB_stretch); %ffungsi nonzeros pada matriks
rata_rataI = sumI*3/s; %rumus menghitung jumlah piksel

rata_rataR = rata_rataI(1);
handles.rata_rataI(1)=rata_rataR;
rata_rataG = rata_rataI(2);
handles.rata_rataI(2)=rata_rataG;
rata_rataB = rata_rataI(3);
handles.rata_rataI(3)=rata_rataB;

guidata(hObject,handles);
set(handles.text3,'string',rata_rataR);
set(handles.text4,'string',rata_rataG);
set(handles.text5,'string',rata_rataB);
