t = TempoClock.default;
t.tempo = 160/60;


SynthDef(\t5snare, { arg out=0,tu=1, amp=0.3, gate=1, pan=0, freq=200,fader =1,snd;
	var sig;
	var env = EnvGen.ar(Env.perc(0.1,1));
	var enf = EnvGen.ar(Env([600,177,230],[0.01,0.1],-4));
	//sig = SinOsc.ar(tu*enf+1207,0,0.5)*env;
	sig = WhiteNoise.ar;
	sig = FreeVerb.ar(sig,0.3,0.1);
	sig = RHPF.ar(sig, \hpf.kr(170)*tu, \rq.kr(0.5));
	sig = sig + Mix.ar(BPF.ar(sig,[127,430],[0.5,0.5])*1);
	sig = RHPF.ar(sig, \lpf.kr(200)*tu, \rq.kr(0.5));
	sig = sig * EnvGen.ar(Env.perc(0,\rel.kr(0),-4),gate,doneAction:2);
//	sig = Pan2.ar(sig, pan, amp);
	sig = sig*amp;
	sig = CompanderD.ar(sig,1,1,0.1,0.01,0.4);
	sig = FreeVerb.ar(sig,1,1)+sig;
	Out.ar(2, sig*0.1*fader!2);
	//Out.ar(snd, sig);
}).add;

SynthDef(\kick, { | out=2, fader=1, pan=0, atk= 0.01,decay = 0.2,release=0.26,snd, fratio=1.5,noise=1,done=2,freq1= 120,freq2=30,freq3=30,freq4=0,dc=1,aamp1=1,aamp2=1,aamp3=1,aamp4=1,curve1= (-4),curve2=(-2),curve3=(-4),famp1,famp2,famp3,famp4,p1,oamp=0.1,owhich2=0,ochoose=0|
	var env0,env1,
	env1m, son, son2,son3,son4,p2;
	p2 = p1 * (-pi);
	env0 = Env([aamp1,aamp2,aamp3,aamp4,0],[atk,decay,release],[curve1, curve2, curve3]);
	env1 = Env([freq1,freq2,freq3,freq4],[famp1,famp2,famp3,famp4],[curve1, curve2, curve3]);
	env0 = EnvGen.ar(env0,SinOsc.kr(0.25) ,doneAction:done);
	env1 = EnvGen.ar(env1);
	env1m = env1.midicps;
son = LFSaw.ar(env1m,p1,oamp, 1,1.4);
	son2 = SinOsc.ar(env1m,p1, oamp, 1,1.4);
	son3 = LFPulse.ar(env1m,p1, oamp, 1,1.4);
	son4 = LFTri.ar(env1m,p1, oamp, 1,1.4);
	son = SelectX.ar(1,[son,son2,son3,son4]);
	son = LeakDC.ar(son,dc,30);
	son = LPF.ar(son+ WhiteNoise.ar(1*noise), env1m*fratio, env0);
	son = son + SelectX.ar(1,[ SinOsc.ar(env1m, p1, env0), LFSaw.ar(env1m, p1, env0);, LFPulse.ar(env1m, p1, env0), LFTri.ar(env1m, p1, env0)]);
	son = son * 0.4;
	son = son * fader.distort;
	OffsetOut.ar(out, son*fader).tanh;
	//OffsetOut.ar(snd, son*fader).tanh;
},

).add;


Ndef.clear;
Pdef(\t1).stop;
Pdef(\t1,Pbind(\instrument,\kick,
	\dur,1/8,
	\freq1,Pwhite(120,80,inf),
	\freq2,38,
	\freq3,32,
	\decay,0.1,
	\release,0.05,
	\famp1,0.01,
	\famp2,0.01,
	\famp3,1,
	\aamp1,0.01,
	\aamp2,0.1,
	\aamp4,0.01,
	\ochoose,0,
	\owhich2,0,
	\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not,
	\fader,0.4,
	\out,[0,1],
)).play;



Pdef(\t1).clear;
Pdef(\t1,Pbind(\instrument,\kick,
	\dur,1/8,
	\freq1,120,
	\freq2,38,
	\freq3,32,
	\decay,0.1,
	\release,0.02,
	\famp1,0.1,
	\famp2,1,
	\famp3,1,
	\aamp1,1,
	\aamp2,0.01,
	\aamp4,0.01,
	\ochoose,1,
	\owhich2,0,
	\isRest,0,
	\fader,0.4,
	\out,[0,1],
)).play;

Pdef.clear;

Pdef(\t2,Pbind(\instrument,\kick,
	\dur,1,
	\freq1,Pwhite(120,80,inf),
	\freq2,38,
	\freq3,32,
	\decay,1,
	\release,1,
	\famp1,0.1,
	\famp2,1,
	\famp3,1,
	\aamp1,1,
	\aamp2,0.01,
	\aamp4,0.01,
	\ochoose,1,
	\owhich2,0,
	\isRest,0,
	\fader,0.4,
	\out,[2,3],
)).play;

Pdef(\t4,Ppar([
	Pbind(\instrument,\t5snare,
	\amp,0.3,
	\rel,0.1,
	\dur,1/4,
	\tu,2,
	\isRest,	0,
	\freq,3200,\fader,Pseq([1,0,0,1,0,0,1,0,1,0,0,1,0.6,0.1,1,0],inf)
),
Pbind(\instrument,\t5snare,
	\amp,0.5,
	\rel,8,
	\isRest,0,
	\dur,8,
	\tu,1,
	\freq,Ptuple([
		Pseq([1500,1700,50,700,200,300],inf),
		100,200,500,700,200,30],inf),
	\fader,	0.5
)])).play;

s.meter;
Ndef.clear;
Ndef(\daverb).clear;
Ndef(\daverb,{
	var freqs;
	var sig = CrossoverDistortion.ar( In.ar(0,4),1,1);
	sig = FreeVerb.ar(sig,1,1);
	freqs = {exprand(1000, 20000)}.dup(100);
	sig   =Ringz.ar(sig , freqs).mean;
	sig = Limiter.ar(sig,0.4);
	sig =[sig,sig*(-1)];
}).playN(4,2);


Ndef(\sig3).free;

Ndef(\sig,{
	var freqs;
	var sig = CrossoverDistortion.ar( In.ar(0,6),1,1);
	sig = AllpassL.ar(sig)+sig;
	sig = AllpassL.ar(sig)+sig;
	sig = AllpassL.ar(sig)+sig;
	sig = (sig*4).tanh;
	sig = Limiter.ar(sig,0.8);
	sig =[sig,sig*(-1)];
}).playN(6,2);




Ndef(\sig,{
	var freqs;
	var sig = CrossoverDistortion.ar( In.ar(0,6),1,1);
	sig = CombL.ar(sig,0.1,0.1,0.5)+sig;
	sig = CombL.ar(sig,0.1,0.04,0.5)+sig;
	sig = CombL.ar(sig,0.1,0.1,0.5)+sig;
	sig = (sig*4).tanh;
	sig = Limiter.ar(sig,0.8);
	[DelayL.ar(sig*(-1),0.1,SinOsc.kr(0.1,0,0.05,0.1)),sig];
}).playN(6,2);


s.meter;

Pdefn(\seqt1,Pseq([
		Pseq([1,1,0,1,0,1,0,1,
		      1,0,0,1,0,1,0,1],7),
	],inf));

Ndef(\sig,{
	var freqs;
	var sig = CrossoverDistortion.ar( In.ar(0,6),1,1);
	sig = CombL.ar(sig,0.1,0.1,1)+sig;
	sig = CombL.ar(sig,0.1,0.04,1)+sig;
	sig = CombL.ar(sig,0.1,0.1,0.5)+sig;
	sig = CombL.ar(sig,0.1,0.1,0.5)+sig;
	sig = (sig*4).tanh;
	sig = Limiter.ar(sig,0.8);
	[sig,DelayL.ar(sig*(-1),0.1,SinOsc.kr(0.1,0,0.05,0.1))];
}).playN(6,2);

Ndef(\sig).clear;
Ndef.clear;

~stutterplay.();
~stutter2.(Pseq([0,2,2,4,5,6,7,8
],inf),
	       Prand([0,2,2,4,5,6,7,8,9,1,2,3,4,5,6,7,
		         30
                  ]+10,inf),1/4,1);

~stutter2.(Pseq([0,2,2,2,0,2,2,2,0,2,2,2,0,2,2,2],inf),    Prand([0,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,30]+20,inf),1/4,1);


~stutter2.(Pseq([0,2,4,5],inf),Pseq([0,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,30],inf),Pseq([1/4,1/8],inf),1);

~stutter2.(Prand([0,2,4,5],inf),Prand([0,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,30],inf),Prand([1/16,1/4,1/8],inf),1);


Ndef(\daverb,{
	var freqs;
	var sig = WhiteNoise.ar(1)*In.ar(0,2);
	freqs = {exprand(1000, 200)}.dup(10);
	sig   =Ringz.ar(sig , LFSaw.ar(0.01)*freqs).mean;
	0.5*sig !2;
}).playN(4,2);


//part 2
t.tempo =0.25;

//part3
t.tempo =0.5;

//part4
t.tempo =0.1;


Ndef.clear;
Pdef(\t1).stop;
Pdef(\t2).stop;
Pdef(\t4).stop;

Pdef(\sample,Pbind(\instrument,\playbuf,\bufnum,~hollow,\pos,0*44100,\out,[2,3],\level,2,\len,60,\speed,1,\pitch,0.88,\rel,0.1,\isRest,Pseq([1],1),\dur,60)).play;
