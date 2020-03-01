function varargout = jqbxjc(varargin)
% JQBXJC MATLAB code for jqbxjc.fig
%      JQBXJC, by itself, creates a new JQBXJC or raises the existing
%      singleton*.
%
%      H = JQBXJC returns the handle to a new JQBXJC or the handle to
%      the existing singleton*.
%
%      JQBXJC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JQBXJC.M with the given input arguments.
%
%      JQBXJC('Property','Value',...) creates a new JQBXJC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before jqbxjc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to jqbxjc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help jqbxjc

% Last Modified by GUIDE v2.5 27-Nov-2016 14:22:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @jqbxjc_OpeningFcn, ...
                   'gui_OutputFcn',  @jqbxjc_OutputFcn, ...
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


% --- Executes just before jqbxjc is made visible.
function jqbxjc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to jqbxjc (see VARARGIN)

% Choose default command line output for jqbxjc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes jqbxjc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = jqbxjc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in getdata.
function getdata_Callback(hObject, eventdata, handles)
% hObject    handle to getdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.txt','data file(*.txt)'},'��������');
if(isempty(pathname))
    return;
end
 filepath=strcat(pathname,filename);
 gcz=dlmread(filepath);
 gclx=gcz(:,1);   %ȡ���۲�·��
 cd_count=size(gcz,1);  %�õ��������
 qdh=gcz(:,2);     %ȡ����ʼ���
 zdh=gcz(:,3);     %ȡ����ֹ���
 alldh=[qdh;zdh];   %�õ����е��
 wzd_count=max(alldh);  %�õ�δ֪������
 wzd=[1:wzd_count]';       %�õ�һά���
 hh(1:max(alldh),1)=nan;   %��������ʼ�߳�
 gc1=gcz(:,4);     %ȡ����һ�ڹ۲�ֵ
 gc2=gcz(:,5);     %ȡ���ڶ��ڹ۲�ֵ
 d=gcz(:,6);       %ȡ�������·�߳���
 pts1=strcat(num2str(qdh),'-',num2str(zdh),'~~',num2str(gc1));
 set(handles.listbox1,'string',pts1);  
 pts2=strcat(num2str(qdh),'-',num2str(zdh),'~~',num2str(gc2));
 set(handles.listbox2,'string',pts2);
 handles.gclx=gclx;
 handles.cd_count=cd_count;
 handles.qdh=qdh;
 handles.zdh=zdh;
 handles.alldh=alldh;
 handles.wzd_count=wzd_count;
 handles.wzd=wzd;
 handles.hh=hh;
 handles.gc1=gc1;
 handles.gc2=gc2;
 handles.d=d;
 guidata(hObject,handles);

% --- Executes on button press in zkzywpc.
function zkzywpc_Callback(hObject, eventdata, handles)
% hObject    handle to zkzywpc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��ͨ�ȿ�������ƽ��
cd_count=handles.cd_count;
wzd_count=handles.wzd_count;
wzd=handles.wzd;
hh=handles.hh;
qdh=handles.qdh;
zdh=handles.zdh;
gc1=handles.gc1;
gc2=handles.gc2;
d=handles.d;
[H1,B1,l1]=jingsiH(qdh,zdh,gc1,cd_count,hh);    %�����һ�ڵĽ��Ƹ߳�,ϵ����,L
[H2,B2,l2]=jingsiH(qdh,zdh,gc2,cd_count,hh);    %����ڶ��ڵĽ��Ƹ߳�,ϵ����,L
px=eye(wzd_count);                              %����Ȩ
r=cd_count-wzd_count(1:1)+1;
[x1,sigma1,qxx1,v1]=JQzkpc(l1,B1,d,px,r);        %�����һ�ڵĸ�����,�����,Э������
X1=H1+x1;                                    %����۲�ƽ��ֵ
dh1=gc1+v1/1000;                            %����߳�ƽ��ֵ
pcz1=strcat(num2str(wzd),'--',num2str(X1));   
set(handles.listbox3,'string',pcz1);
set(handles.edit1,'string',num2str(sigma1));  
[x2,sigma2,qxx2,v2]=JQzkpc(l2,B2,d,px,r);          %����ڶ��ڵĸ�����,�����,Э������
X2=H2+x2;                                     %����۲�ƽ��ֵ
dh2=gc2+v2/1000;                               %����߳�ƽ��ֵ
dx=(X2-X1)*1000;                               %����λ����
pcz2=strcat(num2str(wzd),'--',num2str(X2));
set(handles.listbox4,'string',pcz2);
set(handles.edit2,'string',num2str(sigma2));
handles.dx=dx;
handles.x11=x1;
handles.x12=x2;
handles.X11=X1;
handles.X12=X2;
handles.sigma11=sigma1;
handles.sigma12=sigma2;
handles.qxx11=qxx1;
handles.qxx12=qxx2;
handles.r=r;
handles.v1=v1;
handles.v2=v2;
handles.dh1=dh1;
handles.dh2=dh2;
subplot(handles.axes1);
plot(wzd,X1,'m+');
hold on;
plot(wzd,X2,'b+');                      
title('��ͨ�ȿ�������ƽ��');     
legend('X1','X2',2);
xlabel('���');
ylabel('�߳�ƽ��ֵ');

subplot(handles.axes3);
plot(wzd,dx,'m+');
title('ƽ������λ����');
legend('�ȿ�������',3);
xlabel('���');
ylabel('�̵߳�λ����');
hold on;
guidata(hObject,handles);
% --- Executes on button press in wdjy.
function wdjy_Callback(hObject, eventdata, handles)
% hObject    handle to wdjy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
X1=handles.X11;
X2=handles.X12;
sigma1=handles.sigma11;
sigma2=handles.sigma12;
qxx1=handles.qxx11;
qxx2=handles.qxx12;
r=handles.r;
wzd_count=handles.wzd_count;
[wdd,bwdd]=wdjy(X1,X2,sigma1,sigma2,qxx1,qxx2,r,wzd_count);  %����ȶ���
set(handles.listbox5,'string',num2str(bwdd'));
set(handles.listbox6,'string',num2str(wdd'));
handles.wdd=wdd;
handles.bwdd=bwdd;
guidata(hObject,handles)

% --- Executes on button press in nwpc.
function nwpc_Callback(hObject, eventdata, handles)
% hObject    handle to nwpc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����ƽ��
wdd=handles.wdd;
bwdd=handles.bwdd;
cd_count=handles.cd_count;
wzd_count=handles.wzd_count;
wzd=handles.wzd;
hh=handles.hh;
qdh=handles.qdh;
zdh=handles.zdh;
gc1=handles.gc1;
gc2=handles.gc2;
d=handles.d;
r=handles.r
[H1,B1,l1]=jingsiH(qdh,zdh,gc1,cd_count,hh);    %�����һ�ڵĽ��Ƹ߳�,ϵ����,L
[H2,B2,l2]=jingsiH(qdh,zdh,gc2,cd_count,hh);    %����ڶ��ڵĽ��Ƹ߳�,ϵ����,L
[x11,x12,x1,sigma1,qxx1,v]=nwpc(l1,B1,d,r,bwdd,wdd,wzd_count);
X1=H1+x1;                                    %����۲�ƽ��ֵ
pcz1=strcat(num2str(wzd),'--',num2str(X1));   
set(handles.listbox7,'string',pcz1);
set(handles.edit12,'string',num2str(sigma1));  
[x21,x22,x2,sigma2,qxx2,v]=nwpc(l2,B2,d,r,bwdd,wdd,wzd_count);
X2=H2+x2;                                      %����۲�ƽ��ֵ
pcz2=strcat(num2str(wzd),'--',num2str(X2));
set(handles.listbox8,'string',pcz2);
set(handles.edit13,'string',num2str(sigma2));

dX=(X2-X1)*1000;            %����ƽ���̲߳�ֵ
dXbw=dX(bwdd);      %��ȡ���ȶ���λ����
dXw=dX(wdd);
pts1=strcat(num2str(wdd'),'--',num2str(dXw));
pts2=strcat(num2str(bwdd'),'--',num2str(dXbw));
set(handles.listbox11,'string',pts1);
set(handles.listbox10,'string',pts2);
subplot(handles.axes2);
plot(wzd,X1,'m+');
hold on;
plot(wzd,X2,'b+');
title('����ƽ��');
xlabel('���');
ylabel('�߳�ƽ��ֵ');
legend('X1','X2',2);
subplot(handles.axes3);
plot(wzd,dX,'bo');
legend('�ȿ�������','����ƽ��',3);
handles.x21=x1;
handles.x22=x2;
handles.X21=X1;
handles.X22=X2;
handles.sigma21=sigma1;
handles.sigma22=sigma2;
handles.qxx21=qxx1;
handles.qxx22=qxx2;
handles.dXbw=dXbw;
handles.dXw=dXw;
guidata(hObject,handles)
% --- Executes on selection change in listbox7.
function listbox7_Callback(hObject, eventdata, handles)
% hObject    handle to listbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox7


% --- Executes during object creation, after setting all properties.
function listbox7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox8.
function listbox8_Callback(hObject, eventdata, handles)
% hObject    handle to listbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox8


% --- Executes during object creation, after setting all properties.
function listbox8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox5.
function listbox5_Callback(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox5


% --- Executes during object creation, after setting all properties.
function listbox5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox6.
function listbox6_Callback(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox6


% --- Executes during object creation, after setting all properties.
function listbox6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox10.
function listbox10_Callback(hObject, eventdata, handles)
% hObject    handle to listbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox10


% --- Executes during object creation, after setting all properties.
function listbox10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save2excel.
function save2excel_Callback(hObject, eventdata, handles)
% hObject    handle to save2excel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x11=handles.x11.*1000;
x12=handles.x12.*1000;
X11=handles.X11;
X12=handles.X12;
sigma11=handles.sigma11;
sigma12=handles.sigma12;
qxx11=handles.qxx11;
qxx12=handles.qxx12;
dx=handles.dx;
dXbw=handles.dXbw;
dXw=handles.dXw;
wdd=handles.wdd;
bwdd=handles.bwdd;
v1=handles.v1;
v2=handles.v2;
dh1=handles.dh1;
dh2=handles.dh2;
d1=diag(qxx11);
d11=sigma11*sqrt(d1);
d12=sigma12*sqrt(d1);
y11=[x11';d11';x12';d12'];
dx1=[X11';X12';dx'];
h1=[v1';dh1'];
h2=[v2';dh2'];
 fid=fopen('�������.txt','wt');
fprintf( fid, '%s\n', '----��ͨ�ȿ�������ƽ��----');
shuchu(y11,'һ�����ڸ̸߳�����(mm)���������',fid);
shuchu(dx1,'һ�����ڸ߳�ƽ��ֵ/m��λ����/mm',fid);
shuchu(h1,'һ�ڸ߲������/mm,�߲�ƽ��ֵ/m',fid);
shuchu(sigma11,'һ�ڵ�λȨ�����/mm',fid);
shuchu(h2,'���ڸ߲������/mm,�߲�ƽ��ֵ/m',fid);
shuchu(sigma12,'���ڵ�λȨ�����mm',fid);

wdd=handles.wdd;
bwdd=handles.bwdd;
fprintf( fid, '\n%s\n', '--------�ȶ�����-------');
shuchu(bwdd,'���ȶ����',fid);
shuchu(wdd,'�ȶ����',fid);

x21=handles.x21.*1000;
x22=handles.x22.*1000;
X21=handles.X21;
X22=handles.X22;
sigma21=handles.sigma21;
sigma22=handles.sigma22;
qxx21=handles.qxx21;
qxx22=handles.qxx22;
d21=sigma21*sqrt(diag(qxx21));
d22=sigma22*sqrt(diag(qxx21));
y21=[x21';d21';x22';d22'];
dx1=[X21';X22'];

fprintf( fid, '\n%s\n', '--------����ƽ��--------');
shuchu(y21,'һ�����ڸ̸߳�����/mm���������',fid);
shuchu(dx1,'һ�����ڸ߳�ƽ��ֵ/m',fid);
shuchu(h1,'һ�ڸ߲������/mm,�߲�ƽ��ֵ/m',fid);
shuchu(sigma21,'һ�ڵ�λȨ�����/mm',fid);
shuchu(h2,'���ڸ߲������/mm,�߲�ƽ��ֵ/m',fid);
shuchu(sigma22,'���ڵ�λȨ�����/mm',fid);
ww=[wdd',dXw];
bww=[bwdd',dXbw];
shuchu(bww,'���ȶ���λ����/mm',fid);
shuchu(ww,'�ȶ���λ����/mm',fid);
fclose(fid);


% --- Executes on selection change in listbox11.
function listbox11_Callback(hObject, eventdata, handles)
% hObject    handle to listbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox11


% --- Executes during object creation, after setting all properties.
function listbox11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
