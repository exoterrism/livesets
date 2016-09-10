
(
Pdef(\x).quant=0;
Pdef(\clap).quant=0;
Pdef(\hh).quant=0;
Pdef(\oh).quant=0;
Pdef(\y).quant=0;
Pdef(\t5).quant=0;
Pdef(\t1).quant= 0;
Pdef(\snare).quant= 0;
t = TempoClock.default;
t.tempo = 160/60;


Tdef(\track5,{
	Pdefn(\seq1,Pseq([Pseq([
		1,0,0,0
	],inf)],inf));

	SynthDef(\snare2,{arg gate = 1, amp=1, out=0;
		var env = EnvGen.ar(Env.perc(0.001,0.2),gate,doneAction:2);
		var freq = EnvGen.ar(Env([12000,100,12000],[0.01,0.01]));
		var sig = WhiteNoise.ar(env);
		sig = LPF.ar(sig,freq);
		sig = sig.tanh;
		Out.ar(out,sig*amp );
	}).add;
	SynthDef(\t1kick,{arg out = 0,rel = 0.6,pitch=0.1 ,fader =1 ,snd,mix=0.1,rev=0.1;
		var enva = EnvGen.ar(Env([1,1,0],[rel,0.2]),doneAction:2);
		var envf = EnvGen.ar(Env([20000,30,00,4],[0.02,0.1,1,1]));
		var sig = SinOsc.ar(envf+50*pitch,0,enva);
		//sig = PitchShift.ar(sig,0.001,pitch,0.1);
		sig = sig.distort;
		sig = HPF.ar(FreeVerb.ar(sig,mix,rev),1000)+sig;
		Out.ar(out,sig*fader*enva);
		//Out.ar(snd,sig);
	}).add;
	Pdef(\x,Pbind(\instrument,\kickbass,\dur,1,\out,3,\freq1,120,\freq2,38,\freq3,21,\atk,0.001,\decay,0.1,\release,1,\famp1,0.05,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf),\isRest,Pdefn(\seq1).coin.not)).play;

	Pdef(\clap,Pbind(\instrument,\snaremed,\freq1,20,\out,1,\freq2,Pseq([110,30,50],inf),\freq3,100,\atk,0.001,\decay,0.1,\release,0.01,\oamp,1,\aamp1,1,\aamp2,0.01,\aamp3,0.01,\aamp4,0.01,\famp1,0.001,\famp2,0.001,\famp3,0.001,\famp4,0,\noise,1,\fratio,1,\owhich2,1,\ochoose,2,\dc,0.5,\isRest,Pseq([0,1],inf).coin.not,\level,2,\dur,2)).play;

	Pdef(\hh,Pbind(\instrument,\snaremed,\out,2,\freq1,40,\freq2,70,\freq3,110,\atk,0.05,\decay,0.04,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.0001,\famp2,0.001,\famp3,0.001,\noise,1,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\level,Pseq([Pseq([0.3],2),Pseq([0.3],2)],inf)+0.2,\dur,1/2)).play;

	Pdef(\oh,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,110,\freq3,110,\atk,0.05,\decay,0.04,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.1,\famp3,0.1,\noise,0,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq5).coin.not,\level,0.7,\dur,1/4)).play;

	Pdef(\y,Pbind(\instrument,\kickbass,\dur,1/2,\freq1,83,\freq2,23,\freq3,30,\atk,0.001,\decay,0.001,\release,0.1,\famp1,0.001,\famp2,0.02,\famp3,0.01,\aamp1,1,\aamp2,1,\aamp4,1,\ochoose,0,\owhich2,3,\level,0.3,\isRest,Pseq([0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0],inf).coin.not)).play;
	60.wait;
	Pdef(\x).stop;
	Pdef(\clap).stop;
	Pdef(\y).stop;
	7.wait;

	Pdef(\hh).stop;
	Pdef(\oh).stop;
	1.wait;

	"intro".postln;
	Pbindef(\hh,\dur,1/3);
	Pbindef(\oh,\dur,1/3);
	Pbindef(\clap,\dur,1,\isRest,Pseq([0,0,0,1,0,0,0],inf).coin.not);
	Pdef(\clap).play;
	Pdef(\t5,Pbind(\instrument,\kick,\out,0,\dur,1/3,\amp,0.1,\frequ,Pseq([60,50,40,30],inf),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf),\isRest,Pseq([1,0,0,1,0,1,0,0],inf).coin.not)).play;

	32.wait;


	Pdef(\hh).play;
	Pdef(\oh).play;
	32.wait;

	Pbindef(\oh,\isRest,Pseq([1,0.5,0.1],inf).coin.not);
	32.wait;
	Pbindef(\hh,\isRest,Pseq([0.5,1,0.1],inf).coin.not);
	56.wait;
	Pbindef(\oh,\isRest,Pseq([1,1],inf).coin.not);
	4.wait;
	Pdef(\x).stop;
	Pdef(\clap).stop;
	4.wait;
	"intro2".postln;
	Pbindef(\x,\dur,1/3,\isRest,Pseq([1,0,0,0,0,0,0,0],inf).coin.not);
	Pdef(\x).play;
	Pbindef(\oh,\isRest,Pseq([1,0.5,0.1],inf).coin.not);
	56.wait;
	Pbindef(\hh,\isRest,Pseq([1],inf).coin.not);
	4.wait;
	Pdef(\x).stop;
	4.wait;
	Pdef(\x).play;
	Pbindef(\hh,\isRest,Pseq([1,0.5,0.1],inf).coin.not);
	28.wait;
	Pdef(\x).stop;
	Pdef(\oh).stop;
	Pdef(\t5).stop;
	4.wait;
	" partie 1".postln;
	Pdef(\hh).stop;
	Pdefn(\seqt1,Pseq([
		1,0,0,1,0,0,1,0
	],inf));
	Pdef(\clap).play;

	Pdef(\t1,Pbind(\instrument,\t1kick,\dur,1/3,
		\out,3,
		\rel,Pseq([Pseq([0.1,0.1,0.1,1,0.1,0.1,0.1,0.1],3),Pseq([0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1],1)]/4,inf),
		\isRest,Pdefn(\seqt1).coin.not,
		\fader,2,
		\mix,Pseq((1..8)/10,inf),
		\rev,Pseq((1..10)/10,inf),
		\pitch,1,
		\fader,1,
	)).play;
	32.wait;
	Pdef(\oh).stop;
	31.wait;
	Pdef(\t1).stop;
	Pdef(\t5).play;
	"break1".postln;

	1.wait;
	"partie2".postln;
	Pdef(\snare,Pbind(\instrument,\snare2,\out,1,\dur,1/3,\amp,1,\isRest,Pseq([Pseq([0,0,1,0],6),Pseq([0,0,0,0],2)],inf).coin.not)).play;
	Pdef(\t1).play;
	Pdef(\oh).stop;

	32.wait;
	Pdef(\hh).play;
	32.wait;
	Pdef(\oh).play;
	28.wait;
	Pdef(\t1).stop;
	4.wait;
	Pdef(\t1).play;
	28.wait;
	Pdef(\t1).stop;
	4.wait;
	Pdef(\t1).play;
	28.wait;
	Pdef(\t5).stop;
	4.wait;
	Pdef(\t5).play;
	32.wait;
	"break".postln;
	Pdef(\t5).stop;
	Pdef(\t1).stop;
	Pdef(\snare).stop;
	8.wait;
	"gruber".postln;
			Pdef(\hh).stop;
			Pdef(\oh).stop;
			Pdef(\t5).play;
			Pdef(\t1).play;
			Pdef(\clap).stop;
			Pdef(\snare,Pbind(\instrument,\snare2,\out,1,\dur,1/3,\amp,1,\isRest,Pseq([Pseq([0,0,0,0,1,0,0,0],3),Pseq([0,0,0,0],2)],inf).coin.not)).play;

			31.wait;
			Pdef(\t1).stop;Pdef(\snare).play;
			1.wait;
			"1".postln;
			Pbindef(\hh,\dur,1/3);
			Pdef(\hh).play;
			Pdef(\t1).play;
			32.wait;

			Pdef(\t1).stop;Pdef(\snare).stop;Pdef(\hh).stop;

			1.wait;
			Pdef(\t1).play;
			"2".postln;
			30.wait;
			Pdef(\t5).stop;Pdef(\snare).stop;Pdef(\t1).stop;
			2.wait;
			"3".postln;
			Pdef(\t5).play;Pdef(\snare).play;Pdef(\t1).play;
			32.wait;
			"4".postln;
			Pdef(\snare).stop;
			31.wait;
			Pdef(\snare).stop;Pdef(\t1).stop;
			1.wait;
			"5".postln;
			Pdef(\t5).play;Pdef(\snare).play;Pdef(\t1).play;
			28.wait;
			Pdef(\hh).play;
			Pdef(\t5).stop;Pdef(\snare).stop;Pdef(\t1).stop;
			"partie4".postln;
			Pbindef(\hh,\dur,1/3);
			Pbindef(\oh,\dur,1/3);
			Pdef(\hh).play;
			Pdef(\oh).play;
			Pdef(\x).play;
			Pbindef(\x,\dur,1);
			Pdef(\clap).play;
			Pdef(\y).play;
			4.wait;
			Pdef(\x).play;
			Pdef(\t5).play;Pdef(\snare).play;Pdef(\t1).play;
			31.wait;
			Pdef(\x).stop;
			Pdef(\hh).stop;
			Pdef(\t5).stop;Pdef(\snare).stop;Pdef(\t1).stop;
			2.wait;
			Pdef(\x).play;
			Pdef(\hh).play;
			Pdef(\t5).play;Pdef(\snare).play;Pdef(\t1).play;
			31.wait;
			Pdef(\x).stop;
			Pdef(\hh).stop;
			Pdef(\t5).stop;Pdef(\snare).stop;Pdef(\t1).stop;
			1.wait;
	        "end".postln;
			Pdef(\t5).play;Pdef(\snare).play;Pdef(\oh).stop;
			32.wait;
			Pdef(\snare).stop;
			32.wait;
			Pdef(\t5).stop;
			Pdef(\hh).stop;
			Pdef(\oh).stop;
			Pdef(\x).stop;
			Pdef(\t1).stop;
			Pdef(\snare).stop;
			Pdef(\clap).stop;
			Pdef(\y).stop;
			4.wait;
		}).play;
	)
	~elapsedtime.time


	343/60;

	Pdef(\t1).play;



	SynthDef(\dist,{arg amp =0.1,pitch=1;
		var freqs;
		var sig = CrossoverDistortion.ar( InFeedback.ar(0,1),1,1);
		sig = CombN.ar(sig,0.1,0.01,0.01)+sig;
		sig = CombN.ar(sig,0.1,0.04,0.01)+sig;
		sig = CombL.ar(sig,0.1,0.01,0.01)+sig;
		sig = CombL.ar(sig,0.1,0.05,0.01)+sig;
		sig = (sig*4).tanh;
		sig  = PitchShift.ar(sig,0.2,pitch);
		sig = Limiter.ar(sig,0.8);
		sig = CompanderD.ar(sig,0.5,1,0.5,mul:2);
		Out.ar(6,[sig,DelayL.ar(sig*(-1),0.1,SinOsc.kr(0.1,0,0.05,0.1))]*amp);
	}).add(s);
	~dist.free;
	~dist = Synth(\dist);
	Pdef(\snare).stop;


	/// partie 0

	Pdef(\snare).stop;




	SynthDef(\dist,{arg amp =0.1,pitch=1;
		var freqs;
		var sig = CrossoverDistortion.ar( InFeedback.ar(0,1),1,1);
		sig = CombN.ar(sig,0.1,0.01,0.01)+sig;
		sig = CombN.ar(sig,0.1,0.04,0.01)+sig;
		sig = CombL.ar(sig,0.1,0.01,0.01)+sig;
		sig = CombL.ar(sig,0.1,0.05,0.01)+sig;
		sig = (sig*4).tanh;
		sig  = PitchShift.ar(sig,0.2,pitch);
		sig = Limiter.ar(sig,0.8);
		sig = CompanderD.ar(sig,0.5,1,0.5,mul:2);
		Out.ar(6,[sig,DelayL.ar(sig*(-1),0.1,SinOsc.kr(0.1,0,0.05,0.1))]*amp);
	}).add(s);

	~dist.free;
	~dist = Synth(\dist);



	~ecobuda = Buffer.read(s, "/home/xtr/Desktop/.footwork/soundfiles/ecobuda.wav");

	Pdef(\sample,Pbind(\instrument,\playbuf,\bufnum,~ecobuda,\out,[4,5],\pos,Pseq([11]*44100,inf),\level,2,\len,1/3.6,\speed,Pseq([0.98,1,0.98,0.95],inf),\pitch,Pseq([0.98,0.98,0.98,0.5],inf),\rel,0,\isRest,Pseq([1,1,1,1],inf),\dur,1/3)).play;



	/*


	/*
	Pdef(\noise,Pbind(\instrument,\noise,
	\out,4,
	\dur,Pseq([Pseq([1/8],28),Pseq([1/2],8)],inf),
	\a,Pwhite(0.1,4,inf),
	\rel,Pseq([Pseq([2],28),Prand([0.01,0.01,0.001,1],1)],inf).coin.not,
	\isRest,Pseq([Pseq([1],28),1,0.1,0.5,1],inf).coin.not)).play;

	Pdef(\noise,Pbind(\instrument,\noise,
	\out,4,
	\dur,1/4,
	\a,Pwhite(0.1,4,inf),
	\rel,Pseq([Pseq([0.01],28),Prand([0.01,0.01,0.001,0.001],1)],inf).coin.not,
	\isRest,Pseq([Pseq([0,0,1],28),1,0.1,0.5,1],inf).coin.not)).play;




	Pdef(\sub1,Pbind(
	\instrument,\kickmed,
	\out,1,
	\dur,1,
	\freq1,30,
	\freq2,30,
	\freq3,33,
	\decay,1,
	\release,0.5,
	\famp1,0,
	\famp2,1,
	\famp3,1,
	\famp4,0,
	\aamp1,0.5,
	\aamp2,0.5,
	\aamp3,0.5,
	\aamp4,0,
	\ochoose,Pseq([0],inf),
	\owhich2,Pseq([0],inf),
	\level,0.7,
	\isRest,Pdefn(\seq1).coin.not
	)).play;




	Pdefn(\ymelody,Pseq([30,29],inf));



	//
	//Pdef(\snare).stop;
	//Pdef(\clap).stop;
	Pdef(\oh).stop;
	Pdef(\snare2).stop;
	Pdef(\x).stop;
	Pdef(\y).stop;
	Pdef(\hh).stop;

	s.scope;

	Pdef(\noise).stop;

	(

	)
	//Pdef(\snare).stop;
	//Pdef(\clap).stop;

	Pdef(\oh).stop;
	Pdef(\snare2).stop;
	Pdef(\x).stop;
	Pdef(\y).stop;
	Pdef(\hh).stop;

	(




	Pdef(\noise,Pbind(\instrument,\noise2,
	\dur,Pseq([Pseq([1/16],28),Pseq([1/4],8)],inf),
	\out,4,
	\a,Pwhite(0.1,4,inf),
	\rel,Pseq([Pseq([1],28),Prand([0.01,0.01,0.001,1],1)],inf).coin.not,
	\isRest,Pseq([Pseq([1],28),1,0.1,0.5,1],inf).coin.not)).play;



	///


	)


	Pdef(\clap).play;
	Pdef(\x).play;
	Pdef(\hh).play;

	(
	Pdef(\noise,Pbind(\instrument,\noise2,
	\out,4,
	\dur,Pseq([Pseq([1/8],28),Pseq([1/2],8)],inf),
	\a,Pwhite(0.1,4,inf),
	\rel,Pseq([Pseq([2],28),Prand([0.01,0.01,0.001,1],1)],inf).coin.not,
	\isRest,Pseq([Pseq([1],28),1,0.1,0.5,1],inf).coin.not)).play;


	Pdef(\melody).stop;
	Pdef(\t5).stop;
	Pdef(\kick).stop;

	Pdef(\hihats1).stop;
	Pdef(\hihats2).stop;
	Pdef(\z).stop;
	Pdef(\clap).stop;
	Pdef(\bass,Pbind(\instrument,\micro,\dur,4,\out,3,\amp,2,\atk,0.01,\rel,0.5,\ctranspose,Pseq([-23,-24],inf))).play;

	9.wait;
	Pdef(\melody).stop;
	Pdef(\hihats1).stop;
	Pdef(\hihats2).stop;
	Pdef(\z).stop;
	Pdef(\clap).stop;
	Pdef(\t5).play;
	Pbindef(\t5,\dur,1/8);


	6.wait;

	Pdef(\clap).play;
	Pbindef(\clap,\dur,1,\isRest,Pseq([0,0,0,1,0,0,0],inf).coin.not);
	Pdef(\t5,Pbind(\instrument,\kick,\out,0,\dur,1/3,\amp,0.1,\frequ,Pseq([60,50,40,30],inf),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf),\isRest,Pseq([1,0,1,0,0,1,0,0],inf).coin.not)).play;

	28.wait;
	Pdef(\bass).stop;
	Pdef(\t6,Pbind(\instrument,\kickmed,\dur,1/9,\freq1,120,\freq2,60,\freq3,33,\atk,0.01,\release,0.01,\famp1,0.1,\famp2,0.04,\ochoose,1,\owhich2,0,\level,0.4,\fratio,1,\aamp1,0.1,\aamp2,1,\noise,0.2)).play;
	4.wait;
	Pbindef(\t6,\dur,1/3,\famp1,0.01);

	15.wait;
	Pdef(\t6).stop;
	1.wait;
	Pdef(\bass,Pbind(\instrument,\micro,\dur,4,\out,3,\amp,2,\atk,0.01,\rel,0.5,\ctranspose,Pseq([-23,-25],inf))).play;
	Pdefn(\seq1,Pseq([Pseq(~eu.(8,4,0).asInteger,1),Pseq(~eu.(8,4,0).asInteger,1)],inf));

	Pdef(\t5).stop;

	16.wait;
	Pdef(\t5).play;

	Pdef(\bass,Pbind(\instrument,\micro,\dur,4,\out,3,\amp,2,\atk,0.01,\rel,0.5,\ctranspose,Pseq([-23,-27],inf))).play;

	16.wait;

	Pdef(\kick).stop;
	Pdef(\clap).stop;

	4.wait;
	Pdef(\clap).play;

	Pdef(\hihats1).play;
	Pdef(\hihats2).play;
	Pdef(\z).play;
	60.wait;
	Pdef(\bass,Pbind(\instrument,\micro,\dur,1/9,\out,3,\amp,2,\atk,0.01,\rel,0.01,\ctranspose,Pseq([Pseq([-20,-22,-23,-25],1),Pseq([-18,-22,-23,-25],1)],inf))).play;

	4.wait;

	Pdef(\kick).stop;
	Pdef(\clap).stop;
	Pdef(\hihats1).stop;
	Pdef(\hihats2).stop;
	Pdef(\z).stop;
	4.wait;
	Pdef(\bass).stop;
	4.wait;
	}).play;
	)



	Pdef(\t5).play;


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
	