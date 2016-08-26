t.tempo =1;

	~elapsedtime.time;

1285/60;
Pdef(\bass).quant=4;
Pdef(\t5).quant=4;
Pdef(\t6).quant=4;
Pdef(\hat).quant=4;
Pdef(\snare2).quant=4;
Pdef(\clap).quant=4;

(
Tdef(\track3,{
~buy = Buffer.read(s,"/home/xtr/Desktop/liveset April tour/granulate samples/buy.wav");

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


28.wait;
Pdef(\hat,Pbind(\instrument,\hat,\out,2,\dur,1/12,\lag, 0.1,\rel,0.05,\amp,Pseq([0,0.3,0.6],inf))).play;

8.wait;

Pdef(\hat).stop;
Pdef(\t6,Pbind(\instrument,\kickmed,\dur,2/3,\freq1,120,\freq2,33,\freq3,33,\atk,0.01,\release,0.1,\famp1,0.1,\famp2,0.4,\ochoose,1,\owhich2,0,\level,0.4,\fratio,1,\aamp1,0.1,\aamp2,1,\noise,0.2)).play;

128.wait;

Pdef(\t6).stop;
Pdef(\snare2).stop;
Pdef(\kick,Pbind(\instrument,\t1kick,\amp,0.1,\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not,\dur,1/16)).play;
Pdef(\hat,Pbind(\instrument,\hat,\out,2,\dur,1/12,\lag, 0.1,\rel,0.05,\amp,Pseq([0.3,0.6],inf))).play;

24.wait;

Pdef(\t5).stop;

4.wait;


Pdef(\melody).stop;
Ndef(\playbuf2).clear;

Pdef(\hat).stop;

Pdef(\kick).play;
Pbindef(\kick,\amp,0.6);

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
	18.wait;

Pbindef(\z,\dur,2);
Pdefn(\seq3,Pseq([Pseq(~eu.(8,3,0).asInteger,1),Pseq(~eu.(8,3,0).asInteger,1)],inf));
Pdef(\hihats1,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,120,\freq3,Pseq([121,120],inf),\atk,0.001,\decay,0.03,\release,Pseq([0.023,0.01],inf),\oamp,0.05,\aamp1,1,\aamp2,1,\aamp3,0.1,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.1,\noise,0,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\level,0.5,\dur,1/9)).play;

Pdef(\hihats2,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,120,\freq3,Pseq([121,120],inf),\atk,0.001,\decay,0.001,\release,Pseq([0.03,0.01],inf),\pan,Prand([-1,1],inf),\oamp,0.01,\aamp1,1,\aamp2,1,\aamp3,0.1,\aamp4,0.1,\famp1,0.0001,\famp2,0.0001,\famp3,0.1,\noise,1,\fratio,1,\owhich2,0,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\level,1,\dur,1/16)).play;

32.wait;
	Pdef(\melody).play;

32.wait;

Pdef(\melody,Pbind(\instrument,\saw,
	\out,3,
	\freq,Prand([1200,2000,2400,3000,3020]+3000,inf),
\dur,1/9,
	\amp,0.3,
)).play;

16.wait;

}).play;



Pdef(\melody).stop;
Pdef(\t5).stop;
Pdef(\kick).stop;

			Pdef(\hihats1).stop;
			Pdef(\hihats2).stop;
			Pdef(\z).stop;
			Pdef(\clap).stop;
Pdef(\bass,Pbind(\instrument,\micro,\dur,1/3,\out,3,\amp,2,\atk,0.01,\rel,0.01,\ctranspose,Pseq([-20,-22,-23,-25],inf))).play;

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
Pbindef(\clap,\dur,1/3,\isRest,Pseq([0,1,0,1,0,1,0,1],inf).coin.not);
Pdef(\t5,Pbind(\instrument,\kick,\out,0,\dur,1/3,\amp,0.1,\frequ,Pseq([60,50,40,30],inf),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf))).play;

28.wait;
Pdef(\bass).stop;
Pdef(\t6,Pbind(\instrument,\kickmed,\dur,1/9,\freq1,120,\freq2,60,\freq3,33,\atk,0.01,\release,0.01,\famp1,0.1,\famp2,0.04,\ochoose,1,\owhich2,0,\level,0.4,\fratio,1,\aamp1,0.1,\aamp2,1,\noise,0.2)).play;
4.wait;
Pbindef(\t6,\dur,1/3,\famp1,0.01);

15.wait;
	Pdef(\t6).stop;
1.wait;
Pdef(\bass,Pbind(\instrument,\micro,\dur,1/3,\out,3,\amp,2,\atk,0.01,\rel,0.01,\ctranspose,Pseq([-18,-22,-23,-25],inf))).play;
Pdefn(\seq1,Pseq([Pseq(~eu.(8,4,0).asInteger,1),Pseq(~eu.(8,4,0).asInteger,1)],inf));

Pdef(\t5).stop;

16.wait;
Pdef(\t5).play;

Pdef(\bass,Pbind(\instrument,\micro,\dur,1/6,\out,3,\amp,2,\atk,0.01,\rel,0.01,\ctranspose,Pseq([Pseq([-20,-22,-23,-25],1),Pseq([-18,-22,-23,-25],1)],inf))).play;

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
