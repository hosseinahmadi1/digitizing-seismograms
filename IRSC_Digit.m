clc;
clear all;
close all;

%%%%%%%%%% Import
ext='*.png' ; 
folder='C:\Users\Hossein\Desktop\Sac';
%image=uigetfile([folder '\' ext]) ;
[filename, path] = uigetfile(fullfile(folder,ext)) ;
X=imread(fullfile(path, filename));


%%%%%%%%%% Import function

T=image2signal(X);

%%%%%%%%%% Read Sac function

d=readsac('aa.SAC');
d.trace=T;

%%%%%%%%%% GUIIIIIIIIIIII

varargout = GUII(varargin);
d=varargout;


%%%%%%%%%% Write Sac function

writesac(d,'output.sac');