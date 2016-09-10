
(
"/home/xtr/exoterrism/drumlib/old/synth library.scd".loadPath;

Tdef(\track4,{

	t.tempo =60/60;

	Pdef(\kickx2).quant=0;
	Pdef(\kickx3).quant=0;
	Pdef(\oh).quant=0;
	Pdef(\hh).quant=0;
	Pdef(\clap2).quant=0;
	Pdef(\clap).quant=0;
	Pdef(\x).quant=0;
	Pdef(\amenhi).quant=0;
	Pdef(\snare).quant=0;
	Pdef(\snare2).quant=0;
	Pdef(\noise).quant=0;
	Pdefn(\seq1,Pseq([Pseq([
		1,0,
	],inf)],inf));


	Pdefn(\seq3,Pseq([Pseq([
		1,0,
	],inf)],inf));
	Pdefn(\seq4,Pseq([Pseq([
		1,
	],inf)],inf));
	Pdef(\kickx2,Pbind(
		\instrument,\kickbass,
		\out,3,
		\dur,1/4,
		\freq1,40,
		\freq2,30,
		\freq3,30,
		\atk, 0.01,
		\decay,0.1,
		\release,1,
		\famp1,1,
		\famp2,0.1,
		\famp3,0,
		\aamp1,0.5,
		\aamp2,0,
		\aamp3,1,
		\aamp4,0.5,
		\ochoose,0,
		\owhich2,0,
		\level,0.5,
		\isRest,Pdefn(\seq1).coin.not
	)).play;
	"intro".postln;
	16.wait;

	Pdef(\kickx3,Pbind(
		\instrument,\kickbass,
		\dur,1/8,
		\freq1,Pseq((120..80).mirror,inf),
		\freq2,23,
		\freq3,Pseq((3300..3300).mirror/100,inf),
		\atk,0.001,
		\decay,0.1,
		\release,Pseq([Pseq((65..100)/100,128)],inf),
		\famp1,Pseq([Pseq((36..100)/1000,64)],inf),
		\famp2,0.002,
		\famp3,0.1,
		\choose,0,
		\aamp1,1,
		\aamp2,0.1,
		\aamp3,0.3,
		\aamp4,0,
		\owhich2,0,
		\level,0.8,
		\isRest,Pdefn(\seq1).coin.not)
	).play;

	"part1".postln;
	32.wait;
	Pdef(\amenhi,Pbind(
		\instrument,\hat808,
		\out,2,
		\amp,4,
		\freq1,Pseq((1200..1000).mirror/10,inf),
		\freq2,27,
		\freq3,Prand((1190..1200).mirror/10,inf),
		\atk,0.000006,
		\decay,Pseq([0.04,0.08,0.1,0.05],inf),
		\release,0.1,
		\oamp,1,
		\aamp1,0.2,
		\aamp2,0.2,
		\aamp3,0.1,
		\aamp4,0,
		\famp1,0.00001,
		\famp2,0.0001,
		\famp3,0.001,
		\noise,0,
		\owhich2,0.5,
		\ochoose,3,
		\dc,1,
		\isRest,Pdefn(\seq3).coin.not,
		\level,2,
		\dur,1/8
	)).play;

	"part2".postln;

	16.wait;
	Pdef(\snare,Pbind(\instrument,\snaremed,\out,1,\freq1,120,\freq2,Pseq([110,70,60],inf),\freq3,60,\atk,0.001,\decay,0.02,\release,0.5,\oamp,0.1,\aamp1,1,\aamp2,0.01,\aamp3,0.01,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.001,\famp4,0,\noise,10,\fratio,1,\owhich2,1,\ochoose,2,\dc,1,\isRest,Pseq([0,0,0,0,1,0,0,0],inf).coin.not,\level,1,\dur,1)).play;

	"part3".postln;

	16.wait;
	Pdef(\kick3).stop;
	Pdef(\x,Pbind(\instrument,\kickbass,\out,0,\dur,1/8,\freq1,120,\freq2,38,\freq3,Pseq([32],inf),\atk,0.001,\decay,0.1,\release,0.6,\famp1,0.001,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf)/2,\isRest,Pdefn(\seq1).coin.not)).play;

	"part4".postln;

	16.wait;
	Pdef(\x).stop;
	Pdef(\kick3).play;


	Pdef(\noise,Pbind(\instrument,\noise2,
		\dur,Pseq([Pseq([1/16],28),Pseq([1/4],8)],inf),
		\out,4,
		\a,Pwhite(0.1,4,inf),
		\rel,Pseq([Pseq([1],28),Prand([0.01,0.01,0.001,1],1)],inf).coin.not,
		\isRest,Pseq([Pseq([1],28),1,0.1,0.5,1],inf).coin.not)).play;

	"part5".postln;

	16.wait;

	Pdef(\clap,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,Pseq([110,120,110],inf),\freq3,100,\atk,0.001,\decay,0.1,\release,0.01,\oamp,0.1,\aamp1,1,\aamp2,0.01,\aamp3,0.01,\aamp4,0.01,\famp1,0.001,\famp2,0.001,\famp3,0.001,\famp4,0,\noise,1,\fratio,1,\owhich2,1,\ochoose,2,\dc,0.5,\isRest,Pdefn(\seq4).coin.not,\level,1,\dur,1/4)).play;

	"part6".postln;

	16.wait;

	Pdef(\hh,Pbind(\instrument,\snaremed,\out,2,\freq1,40,\freq2,70,\freq3,110,\atk,0.05,\decay,0.04,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.0001,\famp2,0.001,\famp3,0.001,\noise,1,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\level,Pseq([Pseq([0.7],2),Pseq([0.3],2)],inf),\dur,1/8)).play;

	"part7".postln;

	16.wait;

	Pdef(\oh,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,110,\freq3,110,\atk,0.05,\decay,0.04,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.1,\famp3,0.1,\noise,0,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq5).coin.not,\level,0.5,\dur,1/8)).play;

	"part8".postln;

	16.wait;

	Pdef(\snare2,Pbind(\instrument,\snaremed,\out,1,\freq1,40,\freq2,70,\freq3,60,\atk,0.05,\decay,0,\release,0,\oamp,0,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.1,\noise,0.5,\fratio,1,\owhich2,3,\ochoose,1,\dc,0,\isRest,Pseq([0,1],inf).coin.not,\level,Pseq([Pseq([0],2),Pseq([0.8],2)],inf),\dur,1/4)).play;

	"part9".postln;

	16.wait;
	"part10".postln;
	Pdefn(\seq1,Pseq([Pseq([
		1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
		0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,
		1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
		0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,

	],inf)],inf));
	Pdefn(\seq3,Pseq([
		1,

	],inf));

	Pdefn(\seq4,Pseq([
		0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,

	],inf));

	Pdefn(\seq5,Pseq([
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
	],inf));
Pbindef(\snare2,\isRest,Pdefn(\seq4).coin.not,\dur,1/4);

	32.wait;
	"part11".postln;


	Pdefn(\seq1,Pseq([Pseq([
		1
	],inf)],inf));

	32.wait;

	"part12".postln;



	Pdefn(\seq1,Pseq([Pseq([
		1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
		0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,
		1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
		0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,

	],inf)],inf));

	// snare
	Pdefn(\seq4,Pseq([
		0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,

	],inf));

	// HH
	Pdefn(\seq3,Pseq([
		1,

	],inf));


	Pdefn(\seq5,Pseq([
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
	],inf));


	Pdef(\snare,Pbind(\instrument,\snaremed,\out,1,\freq1,120,\freq2,Pseq([110,70,120],inf),\freq3,Pseq([60,59,61],inf),\atk,0.001,\decay,0.2,\release,0.01,\oamp,1,\aamp1,0.1,\aamp2,0.1,\aamp3,0,\aamp4,0,\famp1,0.001,\famp2,0.01,\famp3,0.001,\famp4,0,\noise,0,\fratio,1,\owhich2,0,\ochoose,2,\dc,0.5,\isRest,Pdefn(\seq5).coin.not,\level,0.7,\dur,1/4)).play;


	Pdef(\x,Pbind(\instrument,\kickbass,\out,0,\dur,1/8,\freq1,50,\freq2,38,\freq3,32,\atk,0.001,\decay,0.1,\release,0.8,\famp1,0.05,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf),\isRest,Pdefn(\seq1).coin.not)).play;


	Pdef(\hh,Pbind(\instrument,\hat808,\out,3,\freq1,40,\freq2,70,\freq3,100,\atk,0.05,\decay,0.04,\release,0.1,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.1,\noise,3,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\amp,Pseq([Pseq([1],2),Pseq([1],2)],inf),\dur,Pseq([Pseq([1/2],30),Pseq([1/4],2),Pseq([1/8],4),Pseq([1/2],32)],inf))).play;

	32.wait;


	"part13".postln;
	Pdefn(\seq1,Pseq([Pseq([
		1,0,
	],inf)],inf));


	Pdefn(\seq3,Pseq([Pseq([
		1,0,
	],inf)],inf));
	Pdefn(\seq4,Pseq([Pseq([
		1,
	],inf)],inf));

	Pbindef(\x,\release,0.2);
	8.wait;

	Pdefn(\seq1,Pseq([Pseq([
		1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
		0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,
		1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,
		0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,

	],inf)],inf));
	// snare
	Pdefn(\seq4,Pseq([
		0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,

	],inf));
	// HH
	Pdefn(\seq3,Pseq([
		1,

	],inf));
	Pdefn(\seq5,Pseq([
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
	],inf));
	Pdef(\kickx3).stop;

	8.wait;
"part14".postln;

	Pdef(\clap2,Pbind(\instrument,\clap,\outputChannels,1,\q,1,\fq,1,\rnd1,0,\rnd2,0,\rnd3,0,\amp,0.3,\isRest,Pdefn(\seq4).coin.not,\dur,1/4)).play;

	Pdef(\clap,Pbind(\instrument,\snaremed,\out,1,\freq1,120,\freq2,Pseq([110,100,110],inf),\freq3,65,\atk,0.05,\decay,0.01,\release,0.1,\oamp,0.1,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0,\famp1,0.001,\famp2,0.01,\famp3,0.01,\famp4,0,\noise,10,\fratio,2,\owhich2,1,\ochoose,2,\dc,1,\isRest,Pdefn(\seq4).coin.not,\level,1,\dur,1/4)).play;

	Pdef(\x,Pbind(\instrument,\kickbass,\out,0,\dur,1/8,\freq1,50,\freq2,38,\freq3,32,\atk,0.001,\decay,0.1,\release,0.8,\famp1,0.05,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf),\isRest,Pdefn(\seq1).coin.not)).play;


	Pdef(\hh,Pbind(\instrument,\snaremed,\out,2,\freq1,100,\freq2,100,\freq3,100,\atk,0.005,\decay,0.04,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.1,\noise,0,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,0,\level,Pseq([Pseq([0.5],8),Pseq([0],8),Pseq([0.5],8),Pseq([0.5,0],16),Pseq([0],8)],inf),\dur,Pseq([Pseq([1/4],4),Pseq([1/8],6),Pseq([1/2],2),Pseq([1/8],10)],inf))).play;
	1.wait;
		Pdef(\kickx3).play;

	31.wait;
"part15".postln;




Pdefn(\seq1,Pseq([Pseq([
	1,0,0,1,0,0,0,0,
	0,0,1,0,0,0,0,0,

	1,0,0,1,0,0,0,0,
	0,0,1,0,0,0,0,0,

	1,0,0,1,0,0,0,0,
	0,0,1,0,0,0,0,0,

	1,0,0,1,0,0,1,0,
	0,0,1,0,0,1,0,0],inf)],inf));

Pdefn(\seq4,Pseq([
	0,0,0,0,1,0,0,0,
],inf));

Pdefn(\seq3,Pseq([Pseq(~eu.(8,4,0).asInteger,3),Pseq(~eu.(8,6,0).asInteger,1)],inf));

Pdef(\x,Pbind(\instrument,\kickbass,\out,0,\dur,1/2,\freq1,50,\freq2,38,\freq3,35,\atk,0.001,\decay,0.1,\release,0.4,\famp1,0.05,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,0.6,\isRest,Pdefn(\seq1).coin.not)).play;


Pdef(\clap,Pbind(\instrument,\snaremed,\out,1,\freq1,120,\freq2,100,\freq3,60,\atk,0.001,\decay,0.01,\release,0.1,\oamp,0.1,\aamp1,0.01,\aamp2,0.01,\aamp3,0.01,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.001,\famp4,0,\noise,30,\fratio,1,\lag,0.2,\owhich2,1,\ochoose,2,\dc,1,\isRest,Pdefn(\seq4).coin.not,\level,1,\dur,1/2)).play;

	32.wait;
	Pbindef(\kickx3,\level,0.6);

"part16".postln;
	Pdefn(\seq1,Pseq([Pseq([
		1,0,
	],inf)],inf));


	8.wait;

Pdefn(\seq1,
	Pseq([
		Pseq([
			Pseq(~eu.(8,3,0).asInteger,1),
			Pseq(~eu.(8,1,2).asInteger,1)],3),

		Pseq([
			Pseq(~eu.(8,3,0).asInteger,1),
			Pseq(~eu.(8,2,2).asInteger,1)],1)],inf));

"part17".postln;

Pdefn(\seq4,Pseq([
	0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,

],inf));

Pdefn(\seq3,Pseq([
	1,

],inf));


Pdefn(\seq5,Pseq([
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
],inf));



//
Pdef(\snare,Pbind(\instrument,\snaremed,\out,1,\freq1,120,\freq2,Pseq([110,70,60],inf),\freq3,60,\atk,0.001,\decay,0.2,\release,0.01,\oamp,1,\aamp1,0.1,\aamp2,1,\aamp3,1,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.001,\famp4,0,\noise,0,\fratio,1,\owhich2,0,\ochoose,2,\dc,1,\isRest,Pdefn(\seq5).coin.not,\level,0.5,\dur,1/4)).play;

Pdef(\x,Pbind(\instrument,\kickbass,\out,0,\dur,1/4,\freq1,100,\freq2,38,\freq3,32,\atk,0.001,\decay,0.1,\release,0.4,\famp1,0.05,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf),\isRest,Pdefn(\seq1).coin.not)).play;


Pdef(\hh,Pbind(\instrument,\snaremed,\out,2,\freq1,100,\freq2,70,\freq3,100,\atk,0.01,\decay,0.0004,\release,0.001,\oamp,0,\aamp1,1,\aamp2,0.01,\aamp3,0,\aamp4,0,\famp1,0.001,\famp2,0.001,\famp3,0,\noise,0,\fratio,0.01,\owhich2,0,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\level,Pseq([Pseq([1],1),Pseq([0.7],1)],inf),\dur,Pseq([Pseq([1/2],30),Pseq([1/8],2),Pseq([1/4],1),Pseq([1/8],4),Pseq([1/2],32)],inf))).play;
32.wait;
	"part18".postln;
Pdefn(\seq1,Pseq([Pseq([
	1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,

],inf)],inf));

// snare

	Pdef(\kickx3).stop;

Pdef(\clap).play;
Pdef(\x).play;


Pdefn(\seq4,Pseq([
	0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,

],inf));

Pdefn(\seq1,Pseq([Pseq([
	1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
	0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
	1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,

],inf)],inf));


///

Pdef(\hh,Pbind(\instrument,\snaremed,\out,3,\freq1,60,\freq2,80,\freq3,100,\atk,0.01,\decay,0.01,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.1,\noise,0,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\level,Pseq([Pseq([0.7],2),Pseq([0.5],2)],inf),\dur,1/8)).play;

	32.wait;

		"part19".postln;
Pdefn(\seq1,Pseq([Pseq([
	1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
	1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
],inf)],inf));
// snare
Pdefn(\seq4,Pseq([
	0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,

],inf));

// HH

Pdefn(\seq3,Pseq([
	1

],inf));

// OH

Pdefn(\seq5,Pseq([
	0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,
],inf));
	Pdef(\clap,Pbind(\instrument,\snaremed,\out,1,\freq1,120,\freq2,Pseq([110,100,110],inf),\freq3,60,\atk,0.001,\decay,0.02,\release,0.1,\oamp,0.1,\aamp1,1,\aamp2,0.01,\aamp3,0.01,\aamp4,0.01,\famp1,0.001,\famp2,0.1,\famp3,0.1,\famp4,0,\noise,0.1,\fratio,1,\owhich2,1,\ochoose,2,\dc,1,\isRest,Pdefn(\seq4).coin.not,\level,1,\dur,1/4)).play;

Pdef(\clap2).play;
Pdef(\x,Pbind(\instrument,\kickbass,\out,0,\dur,1/4,\freq1,115,\freq2,38,\freq3,31,\atk,0.001,\decay,0.1,\release,2,\famp1,0.0005,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf),\isRest,Pdefn(\seq1).coin.not)).play;
Pdefn(\seq1,Pseq([1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,		0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0],inf));

Pdef(\hh,Pbind(\instrument,\snaremed,\out,2,\freq1,40,\freq2,70,\freq3,100,\atk,0.02,\decay,0,\release,0.1,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0,\famp1,0.0001,\famp2,0.001,\famp3,0.00001,\noise,1,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,0,\level,Pseq([Pseq([0.5],8),Pseq([0],8),Pseq([0.5],8),Pseq([0.5,0],16),Pseq([0],8)],inf)+0.3,\dur,Pseq([Pseq([1/4],4),Pseq([1/8],6),Pseq([1/2],2),Pseq([1/8],10)],inf))).play;


Pdef(\oh,Pbind(\instrument,\snaremed,\out,1,\freq1,120,\freq2,110,\freq3,110,\atk,0.05,\decay,0.04,\release,0.5,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.1,\famp3,0.1,\noise,3,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pseq([1,0,0,0],inf).coin.not,\level,1,\dur,4)).play;
	28.wait;

			"part20".postln;
	Pdef(\x).stop;
	Pdef(\hh).stop;
	Pdef(\snare).stop;
4.wait;

	Pdef(\kickx3).play;
Pdefn(\seq1,Pseq([Pseq([
	1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
	1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
],inf)],inf));
// snare
Pdefn(\seq4,Pseq([
	0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,

],inf));
// OH

Pdefn(\seq5,Pseq([
	0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,
],inf));


Pdef(\x,Pbind(\instrument,\kickbass,\dur,1/2,\freq1,120,\freq2,38,\freq3,Pseq([23,23,23,24],inf),\atk,0.001,\decay,0.1,\release,1,\famp1,0.05,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf),\isRest,Pdefn(\seq1).coin.not)).play;


Pdef(\hh,Pbind(\instrument,\snaremed,\out,2,\freq1,40,\freq2,70,\freq3,100,\atk,0.05,\decay,0.04,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.0001,\famp2,0.001,\famp3,0.001,\noise,0,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\lag,0,\isRest,Pdefn(\seq5).coin.not,\level,Pseq([Pseq([0.2],2),Pseq([0.3],2)],inf),\dur,Pseq([Pseq([1/2],8),Pseq([1/4],4)],inf))).play;


Pdef(\snare,Pbind(\instrument,\snaremed,\out,1,\freq1,120,\freq2,Pseq([110,70,60],inf),\freq3,60,\atk,0.001,\decay,0.02,\release,0.05,\oamp,1,\aamp1,1,\aamp2,0.01,\aamp3,0.01,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.001,\famp4,0,\noise,10,\fratio,1,\owhich2,1,\ochoose,2,\dc,1,\isRest,Pdefn(\seq5).coin.not,\level,1,\dur,1/8)).play;

	32.wait;
	"end".postln;

	Pdef.clear;

	1.wait;
}).play;

)


