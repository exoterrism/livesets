(
Pdef(\noise).quant=0;
Pdef(\kick).quant=0;
Pdef(\bass).quant=0;
Pdef(\t5).quant=0;
Pdef(\t6).quant=0;
Pdef(\hat).quant=0;
Pdef(\snare2).quant=0;
Pdef(\clap).quant=0;
Pdef(\bass).quant =0;
Tdef(\track3,{
	t.tempo =1;
~buy = Buffer.read(s,"/home/xtr/Desktop/liveset April tour/granulate samples/buy.wav");
	~elapsedtime = BeatSched.new;
SynthDef(\saw,{arg out =0, freq = 400,gate=1,amp=0.1;
	var env = EnvGen.ar(Env.perc(0.01,0.1),gate,doneAction:2);
	var sig = SinOsc.ar(freq)*env;
	Out.ar(out,sig*amp);
}).add;

Pdef(\melody,Pbind(\instrument,\saw,
	\out,3,
	\freq,Prand([1200,2000,2400,3000,3020]-10,inf),
\dur,1/9,
	\amp,0.3,
)).play;
	"intro".postln;
	8.wait;

Pdef(\t5,Pbind(\instrument,\kick,\out,0,\dur,1/9,\amp,0.1,\frequ,Pseq([60,50,40,30],inf),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf),
\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not)).play;

Pdef(\hat,Pbind(\instrument,\hat,\out,2,\dur,1/12,\lag, 0.1,\rel,0.05,\amp,Pseq([0.3,0.6],inf))).play;
Pdef(\snare2,Pbind(\instrument,\junglesnare,\out,1,\dur,Pseq([1/9],inf),\amp,0.1,\tu,1.1,\isRest,Pseq([Pseq([0,0,0,0,1,0,0,0],14),Pseq([0,1,0,1,0,0,0,0],1),Pseq([0,0,0,0,1,0,0,0],1)],inf).coin.not)).play;
Ndef(\playbuf2).clear;
Ndef(\playbuf2, {| out = 0, bufnum = 0 ,pos,speed=33|
    var rate;
    rate = FSinOsc.kr(XLine.kr(0.2, 8, 30), 0, 3, 0.6);
    rate = LFNoise2.kr(XLine.kr(1, 20, 60), 2);
    rate = SinOsc.kr(1/6, 0,1);
    Out.ar(out,
			CombC.ar(
 PlayBuf.ar(2, ~buy, BufRateScale.kr(~buy) * rate/1.5,1, pos, 1)).tanh
			*6);
}).play(4,2);

	"part1".postln;

28.wait;

		"break1".postln;

Pdef(\hat,Pbind(\instrument,\hat,\out,2,\dur,1/12,\lag, 0.1,\rel,0.05,\amp,Pseq([0,0.3,0.6],inf))).play;

8.wait;

Pdef(\hat).stop;
Pdef(\t6,Pbind(\instrument,\kickmed,\dur,2/3,\freq1,120,\freq2,33,\freq3,33,\atk,0.01,\release,0.1,\famp1,0.1,\famp2,0.4,\ochoose,1,\owhich2,0,\level,0.4,\fratio,1,\aamp1,0.1,\aamp2,1,\noise,0.2)).play;


			"part2".postln;

128.wait;

Pdef(\t6).stop;
Pdef(\snare2).stop;
Pdef(\hat,Pbind(\instrument,\hat,\out,2,\dur,1/12,\lag, 0.1,\rel,0.05,\amp,Pseq([0.3,0.6],inf))).play;
			"part3".postln;

24.wait;

Pdef(\t5).stop;
			"break3".postln;

4.wait;


Pdef(\melody).stop;
Ndef(\playbuf2).clear;

Pdef(\hat).stop;

Pdef(\kick,Pbind(\instrument,\t1kick,\amp,0.6,\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not,\dur,1/16)).play;
			"part4".postln;

16.wait;
Pdef(\clap,
	Pbind(
	\instrument,\clap,
	\out,1,
	\dur,1,
	\isRest,Pseq([0,1,0,1,0,1,0,0],inf).coin.not,
	\amp,1,
	\env2,[Env([0, 1, 0], [0.02, 0.06], [0, -4])],
	)).play;

Pdef(\z,Pbind(\instrument,\snaremed,
	\out,1,
	\freq1,30,
	\freq2,20,
	\freq3,122,
	\atk,0.1,\decay,0.1,
	\release,0.6,
	\oamp,0.04,
	\aamp1,1,
	\aamp2,0.01,
	\aamp3,0.01,
	\aamp4,0.01,
	\famp1,0.001,
	\famp2,0.00001,
	\famp3,0.001,
	\noise,1,
	\fratio,1,
	\owhich2,1,
	\ochoose,1,
	\dc,1,
	\lag,1,
	\isRest,Pseq([0,0,1,0],inf).coin.not,
	\level,0.7,
	\dur,1
)).play;

	"part5".postln;

	18.wait;

Pbindef(\z,\dur,2);
Pdefn(\seq3,Pseq([Pseq(~eu.(8,3,0).asInteger,1),Pseq(~eu.(8,3,0).asInteger,1)],inf));
Pdef(\hihats1,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,120,\freq3,Pseq([121,120],inf),\atk,0.001,\decay,0.03,\release,Pseq([0.023,0.01],inf),\oamp,0.05,\aamp1,1,\aamp2,1,\aamp3,0.1,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.1,\noise,0,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\level,0.5,\dur,1/9)).play;

Pdef(\hihats2,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,120,\freq3,Pseq([121,120],inf),\atk,0.001,\decay,0.001,\release,Pseq([0.03,0.01],inf),\pan,Prand([-1,1],inf),\oamp,0.01,\aamp1,1,\aamp2,1,\aamp3,0.1,\aamp4,0.1,\famp1,0.0001,\famp2,0.0001,\famp3,0.1,\noise,1,\fratio,1,\owhich2,0,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\level,1,\dur,1/16)).play;

	"part6".postln;

32.wait;

	Pdef(\melody).play;

	"part7".postln;


32.wait;

Pdef(\melody,Pbind(\instrument,\saw,
	\out,3,
	\freq,Prand([1200,2000,2400,3000,3020]+3000,inf),
\dur,1/9,
	\amp,0.3,
)).play;

	            "part8".postln;

16.wait;

	Pdef(\clap).stop;
Pdef(\noise,Pbind(\instrument,\noise,
	\out,4,
	\dur,1/2,
	\a,Pwhite(0.1,4,inf),
	\rel,Pseq([Pseq([0.01],28),Prand([0.01,0.01,0.001,0.001],1)],inf).coin.not,
\isRest,Pseq([0,0,0,0,1],inf).coin.not)).play;

	           "part9".postln;


16.wait;

	Pdef(\clap).play;


	Pdef(\kick,Pbind(\instrument,\t1kick,\amp,0.6,\rel,Pseq([0.1,0.1,0.1,0.1,0.1,1],inf),\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not,\dur,1/16)).play;


	           "part10".postln;

16.wait;

	Pdef(\kick).stop;

	4.wait;

	Pdef(\t5,Pbind(\instrument,\kick,\out,0,\dur,1/9,\amp,0.1,\frequ,Pseq([60,50,40,30],inf),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf),
\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not)).play;

Pdef(\clap,
	Pbind(
	\instrument,\clap,
	\out,1,
	\dur,1,
	\isRest,Pseq([0,1,0,1,0,1,0,0],inf).coin.not,
	\amp,1,
	\env2,[Env([0, 1, 0], [0.02, 0.06], [0, -4])],
	)).play;

		        "part11".postln;

30.wait;
	Pdef(\t5).stop;
	Pdef(\t6,Pbind(\instrument,\kickmed,\dur,2/3,\freq1,120,\freq2,33,\freq3,33,\atk,0.01,\release,0.1,\famp1,0.1,\famp2,0.4,\ochoose,1,\owhich2,0,\level,0.4,\fratio,1,\aamp1,0.1,\aamp2,1,\noise,0.2)).play;

	2.wait;
	Pdef(\t5).play;

	32.wait;
	Pdef(\t6).stop;
	Pdef(\clap).stop;
	Pdef(\noise).stop;
	Pdef(\hihats2).stop;
	Pdef(\hihats1).stop;
	16.wait;
		Pdef(\t5).stop;
		"end".postln;
1.wait;

}).play;
)



SynthDef(\dist,{arg amp =0.1,pitch=1;
	var freqs;
	var sig = CrossoverDistortion.ar( InFeedback.ar(0,4),1,1);
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

~dist = Synth(\dist);
s.meter;

~dist.free;
