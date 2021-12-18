function []=writesac(C,file_name,typ)
% []=writesac(C,file_name,<typ>)
% Writing a SAC structure (C) onto the file  file_name
% typ : 'sun' or 'pc' (default)
% associated with the picked time of some phases: h1(11:20) and h3(49:128)

if nargin<3
	typ='pc';
end	

% enregistrement des parametres "annexes"

C.h1(1)=C.tau;
if isfield(C,'bt');C.h1(6)=C.bt;end
%if ~isfield(C,'et');C.et=C.bt+(C.npts-1)*C.tau;end
C.et=C.bt+(C.npts-1)*C.tau;
C.h1(7)=C.et;
C.h1(2)=C.pointe;
C.h1(8)=C.evt0;

C.h1(11)=C.t0;
C.h1(12)=C.t1;
C.h1(13)=C.t2;
C.h1(14)=C.t3;
C.h1(15)=C.t4;
C.h1(16)=C.t5;
C.h1(17)=C.t6;
C.h1(18)=C.t7;
C.h1(19)=C.t8;
C.h1(20)=C.t9;


C.h1(32)=C.slat;
C.h1(33)=C.slon;
C.h1(34)=C.salt;

C.h1(36)=C.elat;
C.h1(37)=C.elon;
C.h1(39)=C.edep;

C.h1(41)=C.par0;
C.h1(42)=C.par1;
C.h1(43)=C.par2;
C.h1(44)=C.par3;
C.h1(45)=C.par4;
C.h1(46)=C.par5;
C.h1(47)=C.par6;
C.h1(48)=C.par7;
C.h1(49)=C.par8;
C.h1(50)=C.par9;

C.h1(51)=C.distkm;
C.h1(52)=C.az;
C.h1(53)=C.baz;
C.h1(54)=C.dist;
C.h1(58)=C.cmpaz;
C.h1(59)=C.cmpinc;

% ---------

C.h2(1)=C.an;
C.h2(2)=C.jr;
C.h2(3)=C.hr;
C.h2(4)=C.mn;
C.h2(5)=floor(C.sec);
C.h2(6)=floor(C.msec);

C.h2(10)=C.npts;

C.h2(28)=C.us1;	
C.h2(29)=C.us2;	
C.h2(30)=C.us3;	
C.h2(31)=C.us4;	
C.h2(32)=C.us5;	
C.h2(33)=C.us6;	
C.h2(34)=C.us7;	
C.h2(35)=C.us8;	

C.h1(7) = (C.h2(10)-1) * C.h1(1) + C.h1(6);


% -------------



C.h3(1:8)=add_blanc(C.staname,8);

C.h3(9:24)=add_blanc(C.evname,16);

C.h3(49:56)=add_blanc(C.kt0,8);
C.h3(57:64)=add_blanc(C.kt1,8);
C.h3(65:72)=add_blanc(C.kt2,8);
C.h3(73:80)=add_blanc(C.kt3,8);
C.h3(81:88)=add_blanc(C.kt4,8);
C.h3(89:96)=add_blanc(C.kt5,8);
C.h3(97:104)=add_blanc(C.kt6,8);
C.h3(105:112)=add_blanc(C.kt7,8);
C.h3(113:120)=add_blanc(C.kt8,8);
C.h3(121:128)=add_blanc(C.kt9,8);

C.h3(137:144)=add_blanc(C.kus1,8);
C.h3(145:152)=add_blanc(C.kus2,8);
C.h3(153:160)=add_blanc(C.kus3,8);

C.h3(161:168)=add_blanc(C.kcomp,8);
C.h3(185:192)=add_blanc(C.kinst,8);

% ecriture

if strcmp(typ,'sun')
	fidev=fopen(file_name,'w','b');
end	
if strcmp(typ,'pc')
	fidev=fopen(file_name,'w','l');
end

fwrite(fidev,C.h1,'float');
fwrite(fidev,C.h2,'long');
fwrite(fidev,C.h3,'uchar');
fwrite(fidev,C.trace,'float');
fclose(fidev);


function ch1=add_blanc(ch,lch)

% Adds blancks to the end of the character string ch, if it is not with the
% same length as lch

if length(ch)<lch
	if size(ch,1)>1
		ch=ch';
	end
	dl=lch-length(ch);
	ch1=[ch char(zeros(1,dl)+32)];
else
    ch1=ch(1:lch);
end


