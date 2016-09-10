

(

Pdef(\melo).stop;
Pdef(\melo2).stop;
Ndef(\noise2).clear;
Tdef(\intro).stop;
Ndef(\noise2).free;
Ndef(\drones).free;
Ndef(\drones2).free;
Tdef(\track1,{
Ndef(\noise3,{
var sig = LatoocarfianL.ar(
		SampleRate.ir/MouseX.kr(0,4),
			LFNoise2.kr([2,2],1.5,1.5),
		LFNoise2.kr([2,2],1.5,1.5),
		LFNoise2.kr([2,2],0.5,1.5),
		LFNoise2.kr([2,2],0.5,1.5);
	);
	sig = HPF.ar(sig,1000);
	sig = Limiter.ar(sig,0.4);
	sig =	[sig ,DelayL.ar(sig,0.1,100/44100)];
	sig = Compander.ar(sig,In.ar(0,1),0.01,1,0.01,0.01,0.1);
	sig = sig*0.5;
	Out.ar(4,sig);
});

Pdef(\t3,Pbind(\instrument,\t1kick,\dur,4,
	\rel,Pseq([6],inf),
	\isRest,Pdefn(\seqt1).coin.not,
	\amp,0.5,
	\pitch,1,
)).play;

16.wait;
Pbindef(\t3,\dur,1/4,\rel,Pseq([0.6],inf),\amp,0.5);
Pdef(\snare,Pbind(\instrument,\snare2,\out,1,\dur,1/4,\isRest,Pseq([Pseq([0,0,0,0,0,0,1,0],15),Pseq([0,0,0,0,0,0,1,0],1)],inf).coin.not)).play;
	16.wait;
	Pdef(\snare).stop;
	Pdef(\t3).stop;
	4.wait;
Pdef(\snare).play;
Pdef(\t3).play;

Pdef(\hat,Pbind(\instrument,\hat,\dur,1/9,\out,2,\amp,Pseq([0.5,0.3,0.6],inf),\rel,0.05,\isRest,Pseq([Pseq([1,1,1,1,1,1,1,1],15),Pseq([1,0,0,0,1,1,1,1],1)],inf).coin.not)).play;

32.wait;


Pdef(\t4,Pbind(\instrument,\t1kick2,
	\dur,1/4,
	\out,0,
	\rel,Pseq([0.1,0.2],inf),
	\isRest,Pdefn(\seqt1).coin.not,
	\pitch,1,
	\amp,1,
)).play;

32.wait;

Pdef(\t3).stop;
Pdef(\t5,Pbind(\instrument,\t1kick,\dur,1,
	\out,0,
	\rel,1,
	\isRest,0,
	\pitch,1,
	\amp,1,
)).play;

24.wait;

Pdef(\t4).stop;
Pdef(\t5).stop;
Pdef(\hat).stop;
Pdef(\snare).stop;

	4.wait;

Pdef(\bass, Pbind(
	\instrument, \bass,
	\out,3,
	\ctranspose, Pseq([-26,-25],inf),
	\degree,1,
	\dur, 4,
	\legato, Pseq([Pseq([1],7),Pseq([0.8],1)],inf),
	\amp, 0.5,
)).play;

	16.wait;
	Ndef(\noise3).rebuild;
Pdef(\hat).play;
Pdef(\snare).play;
Pdef(\t4).play;
Pbindef(\t4,\dur,1/4);
Pdef(\t5).play;

32.wait;

	Pdef(\t4).stop;
	Pdef(\t5).stop;
	Pdef(\hat).stop;
	Pdef(\snare).stop;
	32.wait;
	Ndef(\noise3).rebuild;
	Pdef(\sample,Pbind(\instrument,\playbuf,\bufnum,~hollow,\out,[4,5],\pos,Pseq([24,25,26,27]*44100,inf),\len,1,\speed,Pseq([0.98,1,0.98,0.95],inf),\level,2,\pitch,Pseq([0.98,0.98,0.98,0.5],inf),\rel,0,\isRest,Pseq([1,1,1,1],inf),\dur,8/4)).play;

	Pdef(\t4).play;
	Pdef(\hat).play;
	Pdef(\snare).play;
	Pdef(\bass).play;

Pdef(\bass, Pbind(
	\instrument, \bass,
	\out,3,
	\lrate,50,
	\ctranspose, Pseq([-26,-25],inf),
	\degree,1,
	\dur, 4,
	\filter,Pseq([500,400,300,300],inf),
	\legato, Pseq([Pseq([1],7),Pseq([0.8],1)],inf),
	\amp, 0.5,
)).play;


Pdef(\t5,Pbind(\instrument,\kick,
	\outBus,0,
	\dur,1/4,\amp,0.1,
	\frequ,Pseq([60,50,40,30],inf),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf),\isRest,Pseq([0,0,0,1,0,0,1,0],inf).coin.not)).play;



	16.wait;

Pdef(\t5,Pbind(\instrument,\kick,
	\outBus,0,
	\dur,1/4,\amp,0.1,\frequ,Pseq([100,50,40,30],inf),\tu,Pseq([Pseq([1.4],8),Pseq([1.3],4),Pseq([1.2],4)],inf),\isRest,Pseq([Pseq([1,0,1,0,0,0,0,0],1),Pseq([1,0,0,0,0,1,0,0],1)],inf).coin.not)).play;

	Pdef(\ri,Pbind(\instrument,\rim,\tu,Pseq([1,1,1,1.3],inf),\dur,1/8,\rel,0.01,\amp,Pseq([0.1,0.1,0.05],inf),
	\isRest,Pseq([
	1,0,1,0,0,1,0,0,
	1,0,1,0,0,1,0,0,
	1,1,0,0,1,1,1,0,
	0,0,0,1,1,1,1,0
],inf).coin.not)).play;

	28.wait;

Pbindef(\ri,\dur,1/16);

4.wait;

Pbindef(\ri,\dur,1/4);

16.wait;

Pbindef(\t5,\isRest,Pseq([Pseq([1,0,0,1,0,0,1,0],7),Pseq([1,0,0,0,0,1,0,0],1)],inf).coin.not);

12.wait;
	Pdef(\hat2).stop;
	Pdef(\snare2).stop;
	Pdef(\t4).stop;
	Pdef(\hat).stop;
	Pdef(\snare).stop;
	Pdef(\bass).stop;
    Pdef(\ri).stop;
Pbindef(\t5,\dur,1/16,\isRest,Pseq([Pseq([1,0,0,1,0,0,1,0],7),Pseq([1,0,0,0,0,1,0,0],1)],inf).coin.not);

	4.wait;

	Pdef(\t5).stop;



	4.wait;

	Pbindef(\t5,\dur,1/8);
	Pdef(\t5).play;
	Pdef(\t4).play;
	Pdef(\hat).play;
	Pdef(\snare).play;
	Pdef(\bass).play;
	Ndef(\noise3).rebuild;

	120.wait;

	Pdef(\hat2).stop;
	Pdef(\snare2).stop;
	Pdef(\t4).stop;
	Pdef(\snare).stop;
	Pdef(\sample).stop;

	4.wait;
Pdef(\hat).stop;
Pbindef(\t5,\dur,1/12,\isRest,Pseq([Pseq([1,0,0,1,0,0,1,0],7),Pseq([1,0,0,0,0,1,0,0],1)],inf).coin.not);

4.wait;
	Pdef(\t5).stop;
	Pdef(\bass).stop;
	Pdef(\sample,Pbind(\instrument,\playbuf,\bufnum,~hollow,\out,[4,5],\pos,Pseq([26]*44100,inf),\level,2,\len,0.9,\speed,Pseq([0.98,1,0.98,0.95],inf),\pitch,Pseq([0.98,0.98,0.98,0.5],inf),\rel,0,\isRest,Pseq([1,1,1,1],inf),\dur,8/6)).play;

4.wait;

Pdef(\t5).play;
Pbindef(\t5,\dur,1/12,\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not);
32.wait;
	Ndef(\noise3).rebuild;
Pdef(\hat).stop;
Pdef(\hat2,
	Ppar([
	Pbind(\instrument,\hat808,\out,2,
	\dur,1/9,
	\amp,0.05,
	\isRest,Pseq([
	Pseq([1,0,0,1,0,0,1,0],1),
	Pseq([1,0,0,1,0,0,1,0],1),
	Pseq([1,0,0,1,0,0,1,0],1),
	Pseq([1,0,0,1,0,0,1,0],1),
],inf).coin.not),
	Pbind(\instrument,\hat808,\out,2,
	\dur,1/6,
	\amp,0.1,
	\isRest,Pseq([0,
	Pseq([0,0,0,1,0,0,1,0],1),
	Pseq([1,0,0,1,1,1,1,0],1),
	Pseq([1,0,0,1,0,0,1,0],1),
	Pseq([1,0,0,1,1,1,1,1],1),
],inf).coin.not),
	])
).play;

32.wait;

Pdef(\snare2,Pbind(\instrument,\junglesnare,
	\out,1,
	\dur,1/3,
	\amp,0.1,
	\tu,1.1,
	\isRest,Pseq([Pseq([0,0,0,0,1,0,0,0],15),Pseq([0,0,0,0,1,0,0,0],1)],inf).coin.not
)).play;

24.wait;
Pbindef(\snare2,\dur,1/16);
8.wait;
Pbindef(\snare2,\dur,1/6);
32.wait;
Pdef(\t5).stop;
Pdef(\hat2).stop;
Pdef(\snare2).stop;
Pdef(\sample).stop;
"end".postln;
	4.wait;
	Ndef(\noise3).free;
	4.wait;

}).play;
)









// fx




// reverb


Ndef(\dist,{arg delay = 0.02;
	var in = In.ar(2,1);
	var sig =FreeVerb.ar(in,0.6,1);
	sig =	[sig ,DelayL.ar(sig,0.1,100/44100)];
    Out.ar(6,sig);
});
///


