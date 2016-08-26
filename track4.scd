
~elapsedtime.time;
170/60;
"/home/xtr/exoterrism/drumlib/old/synth library.scd".loadPath;


Ndef(\noise).clear;

Pdef(\snare2).stop;
Pdef(\t5).stop;

Pdef(\clap2).stop;

Pdef(\snare).stop;
Pdef(\clap).stop;
Pdef(\oh).stop;
Pdef(\snare2).stop;
Pdef(\x).stop;
Pdef(\y).stop;
Pdef(\hh).stop;

t.tempo =90/60;

Pdef(\snare).play;
Pdef(\clap).play;
Pdef(\oh).play;
Pdef(\snare2).play;
Pdef(\x).play;
Pdef(\y).play;
Pdef(\hh).play;
Pdef(\t5).stop;
(
t.tempo =60/60;

Pdef(\snare,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,Pseq([110,70,60],inf),\freq3,60,\atk,0.001,\decay,0.02,\release,0.5,\oamp,0.1,\aamp1,1,\aamp2,0.01,\aamp3,0.01,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.001,\famp4,0,\noise,10,\fratio,1,\owhich2,1,\ochoose,2,\dc,1,\isRest,Pseq([0,0,0,0,1,0,0,0],inf).coin.not,\level,1,\dur,2)).play;

Pdef(\x,Pbind(\instrument,\kickbass,\out,0,\dur,1/8,\freq1,120,\freq2,38,\freq3,Pseq([32],inf),\atk,0.001,\decay,0.1,\release,0.6,\famp1,0.001,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf)/2,\isRest,Pdefn(\seq1).coin.not)).play;

Pdef(\clap,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,Pseq([110,120,110],inf),\freq3,100,\atk,0.001,\decay,0.1,\release,0.01,\oamp,0.1,\aamp1,1,\aamp2,0.01,\aamp3,0.01,\aamp4,0.01,\famp1,0.001,\famp2,0.001,\famp3,0.001,\famp4,0,\noise,1,\fratio,1,\owhich2,1,\ochoose,2,\dc,0.5,\isRest,Pdefn(\seq4).coin.not,\level,2,\dur,1/4)).play;

Pdef(\hh,Pbind(\instrument,\snaremed,\out,4,\freq1,40,\freq2,70,\freq3,110,\atk,0.05,\decay,0.04,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.0001,\famp2,0.001,\famp3,0.001,\noise,1,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\level,Pseq([Pseq([0.3],2),Pseq([0.3],2)],inf),\dur,1/8)).play;

Pdef(\oh,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,110,\freq3,110,\atk,0.05,\decay,0.04,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.1,\famp3,0.1,\noise,0,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq5).coin.not,\level,0.5,\dur,1/8)).play;

Pdefn(\ymelody,Pseq([30,29],inf));

Pdef(\y,Pbind(\instrument,\kickbass,\out,6,\dur,16,\freq1,30,\freq2,30,\freq3,Pdefn(\ymelody),\decay,2,\release,2,\famp1,0.1,\famp2,0.2,\famp3,0.01,\aamp1,1,\aamp2,1,\aamp4,0,\ochoose,0,\owhich2,0,\level,0.5,\isRest,1)).play;

Pdef(\snare2,Pbind(\instrument,\snaremed,\out,2,\freq1,40,\freq2,70,\freq3,60,\atk,0.05,\decay,0,\release,0,\oamp,0,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.1,\noise,0.5,\fratio,1,\owhich2,3,\ochoose,1,\dc,0,\isRest,Pseq([0,1],inf).coin.not,\level,Pseq([Pseq([0],2),Pseq([0.8],2)],inf),\dur,1)).play;
)


Pdef(\noise,Pbind(\instrument,\noise,
	\dur,Pseq([Pseq([1/16],28),Pseq([1/4],8)],inf),
    \out,4,
	\a,Pwhite(0.1,4,inf),
	\rel,Pseq([Pseq([1],28),Prand([0.01,0.01,0.001,1],1)],inf).coin.not,
	\isRest,Pseq([Pseq([1],28),1,0.1,0.5,1],inf).coin.not)).play;


//
//Pdef(\snare).stop;
//Pdef(\clap).stop;
Pdef(\oh).stop;
Pdef(\snare2).stop;
Pdef(\x).stop;
Pdef(\y).stop;
Pdef(\hh).stop;

s.scope;


(
Pdef(\snare,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,Pseq([110,70,120],inf),\freq3,Pseq([60,59,61],inf),\atk,0.001,\decay,0.2,\release,0.01,\oamp,1,\aamp1,0.1,\aamp2,0.1,\aamp3,0,\aamp4,0,\famp1,0.001,\famp2,0.01,\famp3,0.001,\famp4,0,\noise,0,\fratio,1,\owhich2,0,\ochoose,2,\dc,0.5,\isRest,Pdefn(\seq5).coin.not,\level,0.7,\dur,1/4)).play;


Pdef(\x,Pbind(\instrument,\kickbass,\out,0,\dur,1/8,\freq1,50,\freq2,38,\freq3,32,\atk,0.001,\decay,0.1,\release,0.8,\famp1,0.05,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf)/2,\isRest,Pdefn(\seq1).coin.not)).play;


Pdef(\hh,Pbind(\instrument,\hat808,\out,4,\freq1,40,\freq2,70,\freq3,100,\atk,0.05,\decay,0.04,\release,0.1,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.1,\noise,3,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\amp,Pseq([Pseq([1],2),Pseq([1],2)],inf),\dur,Pseq([Pseq([1/2],30),Pseq([1/4],2),Pseq([1/8],4),Pseq([1/2],32)],inf))).play;

Pdef(\noise,Pbind(\instrument,\noise,
	\out,4,
	\dur,Pseq([Pseq([1/8],28),Pseq([1/2],8)],inf),
	\a,Pwhite(0.1,4,inf),
	\rel,Pseq([Pseq([2],28),Prand([0.01,0.01,0.001,1],1)],inf).coin.not,
\isRest,Pseq([Pseq([1],28),1,0.1,0.5,1],inf).coin.not)).play;

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

Pdef(\noise,Pbind(\instrument,\noise,
	\out,4,
	\dur,1/4,
	\a,Pwhite(0.1,4,inf),
	\rel,Pseq([Pseq([0.01],28),Prand([0.01,0.01,0.001,0.001],1)],inf).coin.not,
\isRest,Pseq([Pseq([0,0,1],28),1,0.1,0.5,1],inf).coin.not)).play;
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

Pdef(\clap2,Pbind(\instrument,\clap,\outputChannels,2,\q,1,\fq,1,\rnd1,0,\rnd2,0,\rnd3,0,\amp,0.5,\isRest,Pdefn(\seq4).coin.not,\dur,1/4)).play;

Pdef(\clap,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,Pseq([110,100,110],inf),\freq3,65,\atk,0.05,\decay,0.01,\release,0.1,\oamp,0.1,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0,\famp1,0.001,\famp2,0.01,\famp3,0.01,\famp4,0,\noise,10,\fratio,2,\owhich2,1,\ochoose,2,\dc,1,\isRest,Pdefn(\seq4).coin.not,\level,1,\dur,1/4)).play;

Pdef(\x,Pbind(\instrument,\kickbass,\dur,1/8,\out,0,\freq1,60,\freq2,38,\freq3,35,\atk,0.001,\decay,0.1,\release,1,\famp1,0.01,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf),\isRest,Pdefn(\seq1).coin.not)).play;


Pdef(\hh,Pbind(\instrument,\snaremed,\out,2,\freq1,100,\freq2,100,\freq3,100,\atk,0.005,\decay,0.04,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.1,\noise,0,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,0,\level,Pseq([Pseq([0.5],8),Pseq([0],8),Pseq([0.5],8),Pseq([0.5,0],16),Pseq([0],8)],inf),\dur,Pseq([Pseq([1/4],4),Pseq([1/8],6),Pseq([1/2],2),Pseq([1/8],10)],inf))).play;
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



Pdefn(\seq1,Pseq([Pseq([
1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,

],inf)],inf));

// snare


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

Pdef(\hh,Pbind(\instrument,\snaremed,\out,4,\freq1,60,\freq2,80,\freq3,100,\atk,0.01,\decay,0.01,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.1,\noise,0,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\level,Pseq([Pseq([0.5],2),Pseq([0.5],2)],inf),\dur,1/8)).play;
)


(


Pdefn(\seq1,

	Pseq([
	Pseq([
	Pseq(~eu.(8,3,0).asInteger,1),
	Pseq(~eu.(8,1,2).asInteger,1)],3),

	Pseq([
	Pseq(~eu.(8,3,0).asInteger,1),
	Pseq(~eu.(8,2,2).asInteger,1)],1)],inf));


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


Pdef(\clap,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,100,\freq3,60,\atk,0.001,\decay,0.01,\release,0.1,\oamp,0.1,\aamp1,0.01,\aamp2,0.01,\aamp3,0.01,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.001,\famp4,0,\noise,30,\fratio,1,\lag,0.2,\owhich2,1,\ochoose,2,\dc,1,\isRest,Pdefn(\seq4).coin.not,\level,1,\dur,1/2)).play;
);


(
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

// VARIATION 1




// kick
Pdefn(\seq1,Pseq([Pseq([
1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,

],inf)],inf));


	//
Pdef(\snare,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,Pseq([110,70,60],inf),\freq3,60,\atk,0.001,\decay,0.2,\release,0.01,\oamp,1,\aamp1,0.1,\aamp2,1,\aamp3,1,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.001,\famp4,0,\noise,0,\fratio,1,\owhich2,0,\ochoose,2,\dc,1,\isRest,Pdefn(\seq5).coin.not,\level,0,\dur,1/4)).play;

Pdef(\x,Pbind(\instrument,\kickbass,\out,0,\dur,1/4,\freq1,80,\freq2,38,\freq3,35,\atk,0.001,\decay,0.1,\release,0.4,\famp1,0.005,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf),\isRest,Pdefn(\seq1).coin.not)).play;


Pdef(\hh,Pbind(\instrument,\snaremed,\out,2,\freq1,100,\freq2,70,\freq3,100,\atk,0.01,\decay,0.0004,\release,0.001,\oamp,0,\aamp1,1,\aamp2,0.01,\aamp3,0,\aamp4,0,\famp1,0.001,\famp2,0.001,\famp3,0,\noise,0,\fratio,0.01,\owhich2,0,\ochoose,1,\dc,1, \level,0.1,\isRest,Pdefn(\seq3).coin.not,\level,Pseq([Pseq([0.5],2),Pseq([0.5],2)],inf),\dur,Pseq([Pseq([1/2],30),Pseq([1/8],2),Pseq([1/4],1),Pseq([1/8],4),Pseq([1/2],32)],inf))).play;

)

Pdef(\y).stop;
(

Ndef(\noise).set(\freq,1);
Ndef(\lato).set(\freq,1);
Pdef(\clap,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,Pseq([110,100,110],inf),\freq3,60,\atk,0.001,\decay,0.02,\release,0.1,\oamp,0.1,\aamp1,1,\aamp2,0.01,\aamp3,0.01,\aamp4,0.01,\famp1,0.001,\famp2,0.1,\famp3,0.1,\famp4,0,\noise,0.1,\fratio,1,\owhich2,1,\ochoose,2,\dc,1,\isRest,Pdefn(\seq4).coin.not,\level,1,\dur,1/4)).play;

	Pdef(\clap2).play;
Pdef(\x,Pbind(\instrument,\kickbass,\out,0,\dur,1/4,\freq1,115,\freq2,38,\freq3,31,\atk,0.001,\decay,0.1,\release,2,\famp1,0.0005,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf),\isRest,Pdefn(\seq1).coin.not)).play;
	Pdefn(\seq1,Pseq([1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,		0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0],inf));

Pdef(\hh,Pbind(\instrument,\snaremed,\out,4,\freq1,40,\freq2,70,\freq3,100,\atk,0.02,\decay,0,\release,0.1,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0,\famp1,0.0001,\famp2,0.001,\famp3,0.00001,\noise,1,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,0,\level,Pseq([Pseq([0.5],8),Pseq([0],8),Pseq([0.5],8),Pseq([0.5,0],16),Pseq([0],8)],inf),\dur,Pseq([Pseq([1/4],4),Pseq([1/8],6),Pseq([1/2],2),Pseq([1/8],10)],inf))).play;


	Pdef(\oh,Pbind(\instrument,\snaremed,\out,4,\freq1,120,\freq2,110,\freq3,110,\atk,0.05,\decay,0.04,\release,0.5,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.1,\famp3,0.1,\noise,3,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pseq([1,0,0,0],inf).coin.not,\level,1,\dur,4)).play;
)

///
Pdef(\y,Pbind(\instrument,\kickbass,\dur,1/3,\freq1,83,\freq2,120,\freq3,30,\atk,0.001,\decay,0.001,\release,0.1,\famp1,0.001,\famp2,0.02,\famp3,0.01,\aamp1,1,\aamp2,1,\aamp4,1,\ochoose,0,\owhich2,3,\level,0.3,\isRest,Pseq([0,1,0],inf).coin.not)).play;


(

Pdef(\x,Pbind(\instrument,\kickbass,\dur,1,\freq1,120,\freq2,38,\freq3,Pseq([23,23,23,24],inf),\atk,0.001,\decay,0.1,\release,1,\famp1,0.05,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf),\isRest,Pdefn(\seq1).coin.not)).play;



Pdef(\y,Pbind(\instrument,\kickbass,\dur,1/9,\freq1,120,\freq2,112,\freq3,30,\atk,0.001,\decay,0.001,\release,0.01,\famp1,0.001,\famp2,0.02,\famp3,0.01,\aamp1,1,\aamp2,1,\aamp4,1,\ochoose,0,\owhich2,3,\level,0.3,\isRest,Pseq([0,1,0,0.4,0,0.5,0,1],inf).coin.not)).play;

	Pdef(\hh,Pbind(\instrument,\snaremed,\out,2,\freq1,40,\freq2,70,\freq3,100,\atk,0.05,\decay,0.04,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.0001,\famp2,0.001,\famp3,0.001,\noise,0,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\lag,0,\isRest,Pdefn(\seq5).coin.not,\level,Pseq([Pseq([0.2],2),Pseq([0.3],2)],inf),\dur,Pseq([Pseq([1/2],8),Pseq([1/4],4)],inf))).play;


Pdef(\snare,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,Pseq([110,70,60],inf),\freq3,60,\atk,0.001,\decay,0.02,\release,0.05,\oamp,1,\aamp1,1,\aamp2,0.01,\aamp3,0.01,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.001,\famp4,0,\noise,10,\fratio,1,\owhich2,1,\ochoose,2,\dc,1,\isRest,Pdefn(\seq5).coin.not,\level,1,\dur,1/2)).play;
)
////

(
Pdef(\x,Pbind(\instrument,\kickbass,\dur,1,\freq1,120,\freq2,38,\freq3,21,\atk,0.001,\decay,0.1,\release,1,\famp1,0.05,\famp2,0.02,\famp3,0.01,\famp4,0.001,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\ochoose,1,\owhich2,0,\level,Pseq([Pseq([0.6],29),0.6,0.3,0.6,Pseq([0.6],29),0.6,0.3,0.6],inf),\isRest,Pdefn(\seq1).coin.not)).play;

Pdef(\clap,Pbind(\instrument,\snaremed,\freq1,120,\freq2,Pseq([110,100,110],inf),\freq3,60,\atk,0.001,\decay,0.1,\release,0.01,\oamp,1,\aamp1,1,\aamp2,0.01,\aamp3,0.01,\aamp4,0.01,\famp1,0.001,\famp2,0.001,\famp3,0.001,\famp4,0,\noise,1,\fratio,1,\owhich2,1,\ochoose,2,\dc,0.5,\isRest,Pdefn(\seq4).coin.not,\level,2,\dur,1/2)).play;

Pdef(\hh,Pbind(\instrument,\snaremed,\out,2,\freq1,40,\freq2,70,\freq3,110,\atk,0.05,\decay,0.04,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.0001,\famp2,0.001,\famp3,0.001,\noise,1,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq3).coin.not,\level,Pseq([Pseq([0.3],2),Pseq([0.3],2)],inf),\dur,1/2)).play;
Pdef(\oh,Pbind(\instrument,\snaremed,\out,2,\freq1,120,\freq2,110,\freq3,110,\atk,0.05,\decay,0.04,\release,0.01,\oamp,0.05,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.1,\famp3,0.1,\noise,0,\fratio,1,\owhich2,1,\ochoose,1,\dc,1,\isRest,Pdefn(\seq5).coin.not,\level,0.5,\dur,1/4)).play;

	Pdef(\y,Pbind(\instrument,\kickbass,\dur,1/2,\freq1,83,\freq2,23,\freq3,30,\atk,0.001,\decay,0.001,\release,0.1,\famp1,0.001,\famp2,0.02,\famp3,0.01,\aamp1,1,\aamp2,1,\aamp4,1,\ochoose,0,\owhich2,3,\level,0.3,\isRest,Pseq([0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0],inf).coin.not)).play;

)


(
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
)


(


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

)
