(
/*
d = Buffer.read(s, "/home/xtr/Desktop/XTR_(8)/drums mitchell/60bpm1.1");
e = Buffer.read(s, "/home/xtr/Desktop/XTR_(8)/drums mitchell/60bpm1.2");
f = Buffer.read(s, "/home/xtr/Desktop/XTR_(8)/drums mitchell/60bpm1.3");
g = Buffer.read(s, "/home/xtr/Desktop/XTR_(8)/drums mitchell/snare1.1");
*/
//g = Buffer.read(s, "/home/xtr/mixing drums/export/unnamed1.wav");

SynthDef(\s1, {| out = 0, bufnum = 0,amp=1 ,pos=3,gate=1|
	var filter;
	var env = EnvGen.ar(Env.adsr(0.01,2,2,2),gate,doneAction:2);
	var sig =  PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum),startPos:pos)*amp;
	sig = Disintegrator.ar(sig,0.8,50).tanh/10;
	sig = BPF.ar(sig,17000,1,0.1)+sig+BPF.ar(sig,1000,0.8,0.3)+BPF.ar(sig,100,0.1);
		sig = CompanderD.ar(sig, 0.8,0.1,0.5,0.005,0.7,0.2);
	filter = {arg freq; BRF.ar(sig ,freq,0.5)};
	sig = filter.(2000) + filter.(500) + filter.(800);
	sig = HPF.ar(sig,100);

	Out.ar(2,sig*env/2);

	    Out.ar(14,sig*env);

//Out.ar(~bus,sig);
}).add;


SynthDef(\s2, {| out = 0, bufnum = 0,amp=1 ,pos=3,gate=1|
	var env = EnvGen.ar(Env.adsr(0.01,2,2,0),gate,doneAction:2);
	var sig =  PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum),startPos:pos)*amp;
	sig = CompanderD.ar(sig, 0.8,0.1,0.5,0.01,0.7,0.1);
		sig = Disintegrator.ar(sig,0.45,50).tanh/10;
	sig = BPF.ar(sig,2000,0.2)+sig+BPF.ar(sig,1500,0.5);
	sig = HPF.ar(sig,100);
	sig = Pan2.ar(sig,0);
	Out.ar(2,sig*env/2!2);

	    Out.ar(14,sig*env);

//Out.ar(~bus,sig);
}).add;


SynthDef(\snare, {| out = 0, bufnum = 0,amp=1 ,pos=3,gate=1|
	var env = EnvGen.ar(Env.adsr(0.01,0.8,0,0),gate,doneAction:2);
	var sig =  PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum),startPos:pos)*amp;
	sig = sig + BPF.ar(sig,1000,0.2);
	sig = BRF.ar(sig,500,2);
	sig = HPF.ar(sig,100);
	sig = CompanderD.ar(sig+ PitchShift.ar(sig,0.002,1.3,0,0.1), 0.4,0,0.5,0.0005,1,1);
	Out.ar([2,3],sig*env);
	Out.ar(14,sig*env*0.6);

//Out.ar(~bus,sig);
}).add;
SynthDef(\melody,{arg  gate  = 1, freq = 432;
	var env = EnvGen.ar(Env([1,1,1,1,0],[1,1,1,1,1.5,0.5],'linear'),gate,doneAction:2);
	var sig = SinOsc.ar([SinOsc.kr(20000,0,200,freq),SinOsc.kr(20000.5,0,200,freq+0.5)]);
	sig = LPF.ar(sig,SinOsc.kr(0.5,0,200,400)).tanh;
	sig = FreeVerb.ar(sig*env,1,0.5,0.3);
	sig = Pan2.ar(sig,0);
	Out.ar(4,sig*0.16);
}).add;
)



SynthDef(\s1, {| out = 0, bufnum = 0,amp=1 ,pos=3,gate=1|
	var filter;
	var env = EnvGen.ar(Env.adsr(0.01,2,2,1),gate,doneAction:2);
	var sig =  PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum),startPos:pos)*amp;
	sig = CompanderD.ar(sig, 0.8,0.1,0.5,0.005,0.7,0.1);
	sig = Disintegrator.ar(sig,0.5,50).tanh/10;
	sig = BPF.ar(sig,17000,1,0.7)+sig+BPF.ar(sig,1000,0.8,0.3)+BPF.ar(sig,100,1);
	filter = {arg freq; BRF.ar(sig ,freq,1)};
	sig = filter.(2000) + filter.(500) + filter.(800);
	sig = HPF.ar(sig,100);

	Out.ar(2,sig*env);

	    Out.ar(14,sig*env);

//Out.ar(~bus,sig);
}).add;




Pdef(\samplesnare1,Pbind(\instrument,\s1,\bufnum,g,\isRest,Pdefn(\seq2).coin.not,\dur,1/16,\pos,Pseq([Pseries(0,1,32).stutter(1)],inf)*4410)).play;


Pdef(\samplesnare,Pbind(\instrument,\s2,\bufnum,f,\isRest,Pdefn(\seq2).coin.not,\dur,1/16,\pos,Pseq([Pseries(0,1,32).stutter(1)],inf)*4410)).play;




1/4*32
1/32 *256
1/64 *512
32/2
512/16

512
32/2
256/16


28/4

1/4*32

1/32 * 256 / 64
8/8
1/64 * 512
128/32
Pdef(\samplesnare1).stop;

~vare = 1;
Pdefn(\seq1,Pseq([Pseq(~eu.(8,2,0).asInteger,7),Pseq(~eu.(8,1,0).asInteger,1)],inf));

Tdef(\x,{ loop{
	Pdef(\x,Pbind(\instrument,\kickbass,\dur,1/4,\freq1,120,\freq2,38,\freq3,35,\atk,0.001,\decay,0.1,\release,0.1,\famp1,0.05,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,0.3,\isRest,Pdefn(\seq1))).play;
3.wait;
case{~vare==1}{
		Pbindef(\x,\dur,1/8);
		~vare =0;
	}
	{~vare ==0 }{
		Pbindef(\x,\dur,1/16,\isRest,0);
		~vare = 1
	};
	1.wait;
}
}).play;

Pdef(\y).play;


Ndef(\feedback).clear;
	Ndef(\feedback,{arg	band1=1,band2=1,band3=0.1,band4=0.1,band5=0.1,band6=0.11,band7=0.1,band8=1,band9=1,band10=1,dynratio=1,wet=0.1,aux1=0.1,aux2=0,aux3=0,aux4=0,aux5=0,aux6=0 ,dis=3,masteraux1=1,level=0.007,dc =1,dist=0.8;
	var source = (InFeedback.ar([0,2],2)*aux1);
		source =  Mix.ar(RLPF.ar(
			source,[31.25, 62.5, 125,250,500,1000,2000,4000,8000,16000]*dynratio,    [band1,band2,band3,band4,band5,band6,band7,band8,band9,band10]
	));
		//source = (source.abs < dist) *source;
		source = Limiter.ar(source,0.9,0.0001);
		source = RHPF.ar(FreeVerb.ar(source,0.3,0.4,1),30);
		//source = SelectX.ar(wet,[source.tanh + (source * 0.01) !2,InFeedback.ar(6,2)]);
		source = LeakDC.ar(source,dc,30);
		Out.ar(0,source!2*level);

	});

Ndef(\feedback).edit;
Pdef(\samplesnare1,Pbind(\instrument,\s1,\bufnum,d,\isRest,Pdefn(\seq2).coin.not,\dur,1/16,\pos,Prand([Pseries(0,1,32).stutter(1)],inf)*4410)).play;



Pdef(\y,Pbind(\instrument,\kickbass,\dur,1,\freq1,120,\freq2,38,\freq3,35,\atk,0.001,\decay,0.1,\release,0.1,\famp1,0.05,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,0.3,\isRest,Pdefn(\seq1).coin.not)).play;


	PdurStutter Pstutter
28+32
Pbindef(\x, \dur,4);
Pdef(\x).stop;Tdef(\x,).stop;


Place([Pseq([1/4],28),[Pseq([1/32],16),Pseq([1/64],32)]],inf).asStream.nextN(64);

Place([Pseq([1/16],58),Pseq([Pseq([1/32],6),Pseq([1/64],6)],inf)],inf).asStream.nextN(10);

Pdef(\x).stop;

Pdefn(\seq2,Pseq([1,0,0,1,0,1,0,0],inf))

~stutter2.(Pseq([0,2,0,0,0,2,0,1],inf),Pseq([1,3,3,-4],inf),1,1);

Ndef(\stutter2).clear;

Pdefn(\seq2,Pseq([1],inf))

s.meter;




Ndef(\feedback).clear;
Ndef(\feedback).set(\dynratio,1,\band1,0.1,\band4,0.1,\band5,1,\band6,1)
Ndef(\feedback).edit;


Pdef(\y).stop;
Pdef(\x).stop;
Pdef(\samplesnare).stop;

Pdefn(\seq1,Pseq([1,0,0,0,
	1,0,0,0,
	0,0,0,0,
	0,0,0,0
],inf));

Pdefn(\seq1,Pseq([Pseq(~eu.(8,2,0).asInteger,1),Pseq(~eu.(8,1,0).asInteger,1)],inf));



Pdef(\melo).play;



s.plotTree;
Ndef(\noise).free;



