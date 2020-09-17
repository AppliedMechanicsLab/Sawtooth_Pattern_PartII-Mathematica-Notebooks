clear all
close all
clc

inx=13;
pbool=1;

c=[.2,.4,.6];
    ec=min([c*0.4;[1,1,1]],[],1);
AR=[2,1,1];
    AR=AR/norm(AR);

%% Load data
FFDatafile='201708_BendTests_FF_processed_data';
FFdata=load(FFDatafile);

%% order data
Fx=FFdata.Fstar(FFdata.evbool);

%% Disp
    for i=1:length(Fx)
        ix=find(Fx(i)==FFdata.Fstar);
        if i == 1
        Len = length(FFdata.w0{ix});
        else
            Len = [Len ; length(FFdata.w0{ix})];
        end
    end
    
MLen  = max(Len);    
dflctn = zeros(MLen,length(Fx));
force = zeros(MLen,length(Fx));
    for i=1:length(Fx)
        ix=find(Fx(i)==FFdata.Fstar);
        dflctn(1:Len(i),i) = FFdata.w0{ix};
        force(1:Len(i),i) = FFdata.F{ix};
    end

w0star = FFdata.w0star(FFdata.evbool);