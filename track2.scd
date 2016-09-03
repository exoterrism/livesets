FreqScope.new
~elapsedtime.time;

1038/60;
//add bass
t = TempoClock.default;
t.tempo =60/60;

t.tempo =60/4/60;

s.meter;
//add melody
Pdef.clear;
Tdef(\track2).stop;
Ndef(\noise3).clear;
Ndef(\fx1).clear;

Pdef(\sample).quant =4;
Pdef(\t5).quant=4;
Pdef(\hat2).quant=4;
Pdef(\snare2).quant=4;
Pdef(\melo1).quant = 4;
Pdef(\sub).quant=4;

Tdef(\track2).stop;
(
Pdef(\t5).stop;
Pdef(\hat2).stop;
Pdef(\snare2).stop;
Pdef(\sample).stop;
~ecobuda = Buffer.read(s, "/home/xtr/Desktop/.footwork/soundfiles/ecobuda.wav");
Tdef(\track2,{
	~elapsedtime = BeatSched.new;

Pdef(\sample).play;
Pdef(\t5,Pbind(\instrument,\kick,
	\outBus,0,
	\dur,1/4,\amp,0.1,\frequ,Pseq([100,50,40,30],inf),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf),\isRest,Pseq([Pseq([1,0,1,0,0,0,0,0],1),Pseq([1,0,0,0,0,1,0,0],1)],inf).coin.not));
Pbindef(\t5,\dur,1/12,\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not);
	Pdef(\t5).play;
Pdef(\hat2,
	Ppar([
	Pbind(\instrument,\hat808,\out,2,
	\dur,1/6,
	\amp,0.05,
	\isRest,Pseq([
	Pseq([1,0,0,1,0,0,1,0],1),
	Pseq([1,0,0,1,0,0,1,0],1),
	Pseq([1,0,0,1,0,0,1,0],1),
	Pseq([1,0,0,1,0,0,1,0],1),
],inf).coin.not),
	Pbind(\instrument,\hat808,\out,2,
	\dur,1/2,
	\amp,0.1,
	\isRest,Pseq([0,
	Pseq([0,0,0,1,0,0,1,0],1),
	Pseq([1,0,0,1,1,1,1,0],1),
	Pseq([1,0,0,1,0,0,1,0],1),
	Pseq([1,0,0,1,1,1,1,1],1),
],inf).coin.not),
	])
).play;

Pdef(\snare2,Pbind(\instrument,\junglesnare,
	\out,1,
	\dur,1/3,
	\amp,0.1,
		\tu,Pseq([1,1,1.5,1,1,1,1.4,1,1,1,1.3,1,1,1,1.2,1],inf),
		\isRest,Pseq([0,0,1,0],inf).coin.not
)).play;

Pdef(\sub,Pbind(\instrument,\kick2,
\dur,1/3,
\out,3,
\amp,1,
\frequ,Pseq([50,50,40,30],inf),
\rel,2,
\tu,Pseq([Pseq([1],8),Pseq([1.1],4),Pseq([0.8],4)],inf),
\isRest,Pseq([
			Pseq([1,0,0,0,0,0,0,0],1),Pseq([1,0,0,0,0,1,0,0],1),
			Pseq([1,0,0,0,0,0,0,0],1),Pseq([1,0,0,1,0,1,0,0],1),
			Pseq([1,0,0,0,0,0,0,0],1),Pseq([1,0,0,0,0,1,0,0],1),
			Pseq([1,0,1,0,0,0,0,0],1),Pseq([1,0,1,0,1,1,0,0],1)
	],inf).coin.not)).play;

	Pdef(\sample,Pbind(\instrument,\playbuf,\out,[4,5],\pos,Pseq([26]*44100,inf),\level,2,\len,0.9,\speed,Pseq([0.98,1,0.98,0.95],inf),\pitch,Pseq([0.98,0.98,0.98,0.5],inf),\rel,0,\isRest,Pseq([1,1,1,1],inf),\dur,8/6)).play;

	"part1".postln;

	14.wait;


	Pdef(\sample,Pbind(\instrument,\playbuf,\out,[4,5],\pos,Pseq([26]*44100,inf),\level,2,\len,0.9,\speed,Pseq([0.98,1,0.98,0.95],inf),\pitch,Pseq([0.98,0.98,0.98,0.5],inf),\rel,0,\isRest,Pseq([1,1,1,1],inf),\dur,8/6)).play;

Pdef(\t5).stop;
Pdef(\hat2).stop;
Pdef(\snare2).stop;
"break1".postln;

2.wait;

	t.tempo =60/60;

	Pdef(\sample,Pbind(\instrument,\playbuf,\out,[4,5],\pos,Pseq([10.2]*44100,inf),\level,2,\len,1.55,\speed,Pseq([0.98,1,0.98,0.95],inf),\pitch,Pseq([0.98,0.98,0.98,0.5],inf),\rel,0,\isRest,Pseq([1,1,1,1],inf),\dur,8/6)).play;


Pdef(\melo1,
	Pbind(\instrument,\notes,
	\dur,1/12,
	\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not,
	\level,0.15,
	\freq,Pseq([
		Pseq([70],15),Pseq([40],1),
		Pseq([70],15),Pseq([30],1),
		Pseq([70],15),Pseq([20],1),
		Pseq([60],15),Pseq([10],1),
],inf))).play;

Ndef(\fx1,{arg	band1=1,band2=1,band3=0.1,band4=0.1,band5=0.1,band6=0.11,band7=0.1,band8=1,band9=1,band10=1,dynratio=1,wet=0.1,aux1=1,aux2=0,aux3=1,aux4=0,aux5=0,aux6=0 ,dis=3,masteraux1=1,level=0.01,dc =1,dist=0.8;
	var source =(InFeedback.ar(0,1)*aux1);
	source =  Mix.ar(RLPF.ar(
		source,[31.25, 62.5, 125,250,500,1000,2000,4000,8000,16000]*dynratio,    [band1,band2,band3,band4,band5,band6,band7,band8,band9,band10]
	));
	source = (source.abs < dist) *source;
	source = Limiter.ar(source,0.9,0.0001);
	//source = SelectX.ar(wet,[source.tanh + (source * 0.01) !2,InFeedback.ar(6,2)]);
	source = LeakDC.ar(source,dc,30);
	Out.ar(6,source!2*level);
});
Pdef(\t5).play;
Pdef(\hat2).play;
Pdef(\snare2).play;
"part2".postln;
28.wait;


Pdef(\t5).stop;
Pdef(\hat2).stop;
Pdef(\snare2).stop;
	Pdef(\melo1).stop;
"break2".postln;
	4.wait;

	Pdef(\melo1).play;
	Pdef(\snare2,Pbind(\instrument,\junglesnare,\out,1,\dur,1/3,\amp,0.1,\tu,1.1,\isRest,Pseq([Pseq([0,0,0,0,1,0,0,0],15),Pseq([0,0,0,0,1,0,0,0],1)],inf).coin.not)).play;
	Pdef(\snare,Pbind(\instrument,\snare,\out,1,\dur,1/6,\lag, 0,\isRest,Pseq([Pseq([0,0,0,0,1,0,0,0],15),Pseq([0,0,0,0,0,0,0,0],1)],inf).coin.not)).play;
	Pdef(\hat,Pbind(\instrument,\hat,\dur,1/3,\out,1,\lag, 0,\amp,Pseq([1,1],inf),\rel,0.05,\isRest,Pseq([Pseq([1,0,1,0,1,0,1,0],15),Pseq([1,0,0,0,1,0,1,0],1)],inf).coin.not)).play;
	Pdef(\hat3,Pbind(\instrument,\hat,\out,2,\dur,1/6,\lag, 0,\amp,Pseq([1,1],inf),\rel,0.05,\isRest,Pseq([Pseq([1,0,1,0,1,0,1,0],1),Pseq([1,0,1,1,1,0,1,0],1)],inf).coin.not)).play;
Pdef(\kick,Pbind(\instrument,\kick2,\dur,1/12,\amp,0.4,\rel,0.4,\atf,Pseq([80,90,120,110],inf),\frequ,Pseq([Pseq([30,50,30,30],3),Pseq([60,50,30,20],1)],inf).stutter(2),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf),\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not)).play;
Pdef(\t5).play;
"part3".postln;
28.wait;

	Pbindef(\melo1,\dur,1/6);

Pdef(\t5).stop;
Pdef(\sub).stop;
Pdef(\kick).stop;
Pdef(\hat3).stop;
Pdef(\snare2).stop;
Pdef(\sample).stop;
"break3".postln;
4.wait;


Ndef(\fx3,{arg freq =40;
	var source = InFeedback.ar(0,1)*CuspN.ar(SampleRate.ir/2, LFNoise2.kr([0.6,0.62],1.1,freq*2), LFNoise2.kr([1.8,1.9],10,freq)) ;
	source = (source.abs < 1) *source.tanh.distort;
	Out.ar(6,source);
});

	Pbindef(\melo1,\dur,1/12);
Pdef(\hat3).play;
Pdef(\snare2).play;
Pdef(\t5).play;
	Pdef(\sample,Pbind(\instrument,\playbuf,\out,[4,5],\pos,Pseq([11,12,13,14]*44100,inf),\len,6/3.6,\level,2,\speed,Pseq([0.98,1,0.98,1.2],inf),\pitch,Pseq([0.98,0.98,0.98,0.4],inf),\rel,0,\isRest,Pseq([1,1,1,1],inf),\dur,8/6)).play;
"part4".postln;
14.wait;

Pdef(\sample).stop;

2.wait;

Pdef(\sample,Pbind(\instrument,\playbuf,\out,[4,5],\pos,Pseq([11]*44100,inf),\len,6/3.6,\speed,Pseq([0.98,1,0.98,0.95],inf),\pitch,Pseq([0.98,0.98,0.98,0.5],inf),\rel,0,\isRest,Pseq([1,1,1,1],inf),\dur,8/6)).play;


15.wait;

Pdef(\t5).stop;
Pdef(\hat3).stop;
Pdef(\snare2).stop;
Pdef(\sample).stop;


1.wait;

	Pdef(\sample,Pbind(\instrument,\playbuf,\bufnum,~ecobuda,\out,[4,5],\pos,44100*515,\len,1,\rel,0.1,\pitch,Pseq([1.2,1.4,1.5,1.6],inf),\speed,0.8,\isRest,Pseq([1],inf),\dur,1)).play;
Pdef(\t5).play;
Pdef(\hat3).play;
Pdef(\snare2).play;
"part5".postln;
15.wait;

Pdef(\t5).stop;
Pdef(\hat3).stop;
Pdef(\snare2).stop;
Pdef(\sample).stop;
"break6".postln;
1.wait;


Pdef(\melo1,
	Pbind(\instrument,\notes,
	\dur,1/12,
	\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not,
	\level,0.15,
	\freq,Pseq([
		Pseq([70],15),Pseq([40],1),
		Pseq([70],15),Pseq([30],1),
		Pseq([70],15),Pseq([20],1),
		Pseq([60],15),Pseq([10],1),
],inf)+12)).play;


Pdef(\sample,Pbind(\instrument,\playbuf,\bufnum,~ecobuda,\out,[4,5],\pos,44100*210,\len,0.1,\rel,1,\speed,0.8,\pitch,Pseq([1.2,1.4,1.5,1.6,1.7,1.8,1.9,2.0],inf),\isRest,Pseq([1],inf),\dur,4/3)).play;

Pdef(\t5,
	Ppar([
		Pbind(\instrument,\kick,\dur,1/3,\amp,0.1,\frequ,Pseq([60,50,40,30],inf),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf),\isRest,Pseq([Pseq([0,1,0,0,0,0,0,0],3),Pseq([0,1,0,0,0,1,0,0],1),
	],inf).coin.not),
		Pbind(\instrument,\kick,\dur,1/6,\amp,0.1,\frequ,Pseq([60,50,40,30],inf),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf),\isRest,Pseq([
	Pseq([1,0,0,0,0,0,0,0],1),Pseq([1,0,0,0,0,1,0,0],1),
],inf).coin.not)
	])
).play;

Pdef(\snare2,Pbind(\instrument,\junglesnare,\out,1,\dur,1/6,\amp,0.1,\tu,1.1,\isRest,Pseq([Pseq([0,0,0,0,1,0,0,0],15),Pseq([0,0,0,0,0,0,0,0],1)],inf).coin.not)).play;
	Pdef(\snare,Pbind(\instrument,\snare,\out,1,\dur,1/6,\lag, 0,\isRest,Pseq([Pseq([0,0,0,0,1,0,0,0],15),Pseq([0,0,0,0,0,0,0,0],1)],inf).coin.not)).play;

"part7".postln;

	32.wait;

Pdef(\sample).stop;
Pdef(\sub,Pbind(\instrument,\kick2,\dur,1/3,\amp,0.4,\frequ,Pseq([60,50,40,30]-10,inf),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf),\isRest,Pseq([		Pseq([1,0,0,0,0,0,0,0],1),Pseq([1,0,0,0,0,1,0,0],1),Pseq([1,0,0,0,0,0,0,0],1),Pseq([1,0,0,1,0,1,0,0],1),
		Pseq([1,0,0,0,0,0,0,0],1),Pseq([1,0,0,0,0,1,0,0],1),
		Pseq([1,0,1,0,0,0,0,0],1),Pseq([1,0,1,0,1,1,0,0],1)
	],inf).coin.not)).play;
Pdef(\hat,Pbind(\instrument,\hat,\dur,1/9,\out,2,\lag, 0.1,\rel,0.05,\amp,Pseq([0.3,0.6],inf),\isRest,Pseq([Pseq([0,1,1,1,1,1,1,1],15),Pseq([1,0,0,0,1,1,1,1],1)],inf).coin.not)).play;

	"part8".postln;
28.wait;


	Pdef(\hat).stop;
	Pdef(\sub).stop;
	Pdef(\snare2).stop;
	Pdef(\t5).stop;
"break8".postln;
	4.wait;

	Pdef(\t5,Pbind(\instrument,\kick,
	\outBus,0,
	\dur,1/4,\amp,0.1,\frequ,Pseq([100,50,40,30],inf),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf),\isRest,Pseq([Pseq([1,0,1,0,0,0,0,0],1),Pseq([1,0,0,0,0,1,0,0],1)],inf).coin.not));
	Pbindef(\t5,\dur,1/12,\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not);
	Pdef(\t5).play;

Pdef(\hat3).play;
Pdef(\snare2).play;

Pdef(\sub,Pbind(\instrument,\kick2,
\dur,1/3,
\out,0,
\amp,0.5,
\frequ,Pseq([50,50,40,30],inf),
\rel,1,
\tu,Pseq([Pseq([1],8),Pseq([1.1],4),Pseq([0.8],4)],inf),
\isRest,Pseq([
			Pseq([1,0,0,0,0,0,0,0],1),Pseq([1,0,0,0,0,1,0,0],1),
			Pseq([1,0,0,0,0,0,0,0],1),Pseq([1,0,0,1,0,1,0,0],1),
			Pseq([1,0,0,0,0,0,0,0],1),Pseq([1,0,0,0,0,1,0,0],1),
			Pseq([1,0,1,0,0,0,0,0],1),Pseq([1,0,1,0,1,1,0,0],1)
	],inf).coin.not)).play;

Pdef(\sample,Pbind(\instrument,\playbuf,\out,[4,5],\pos,Pseq([26]*44100,inf),\len,0.9,\speed,Pseq([0.98,1,0.98,0.95],inf),\pitch,Pseq([0.98,0.98,0.98,0.5],inf),\rel,0,\isRest,Pseq([1,1,1,1],inf),\dur,8/6)).play;
"part9".postln;
	32.wait;

		Ndef(\fx1).clear;
	Ndef(\fx3).clear;

Pdef(\t5).stop;
Pdef(\hat2).stop;
	Pdef(\snare).stop;
Pdef(\snare2).stop;
Pdef(\sample).stop;
	Pdef(\hat).stop;
	Pdef(\hat3).stop;
	Pdef(\sub).stop;
	Pdef(\melo1).stop;
	4.wait;
"end".postln;
	4.wait;
}).play
)

~elapsedtime.time;