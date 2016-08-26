o = Server.local.options;
o.numOutputBusChannels = 8; // The next time it boots, this will take effect


t= TempoClock.default;
t.tempo = 60/60;
~eu = {arg len, hits,offset;
	var seq = Array.newClear();
	for(0, len - 1, {arg i;
		seq = seq.add((i * hits % len) < hits)
	});
	seq.rotate(offset)
};

Pdef(\noise).stop;

Pdef(\clap2).stop;

Pdef(\snare).stop;
Pdef(\clap).stop;
Pdef(\oh).stop;
Pdef(\snare2).stop;
Pdef(\x).stop;
Pdef(\y).stop;
Pdef(\hh).stop;

Pdef(\z).stop;
Pdef(\hh2).stop;


(
Tdef(\trackish,{
	Pdef(\melo).play;
	Pdefn(\seq1,Pseq([Pseq(~eu.(8,3,0).asInteger,1),Pseq(~eu.(8,1,0).asInteger,1)],inf));

	Pdef(\hh2,Pbind(\instrument,\snaremed,\freq1,100.44,\freq2,80,\freq3,100.88,\atk,0.001,\decay,0.04,\release,0.01,\oamp,0,\aamp1,0.02,\aamp2,0.01,\aamp3,0,\aamp4,0,\famp1,0.001,\famp2,0,\famp3,0,\noise,0.4,\fratio,0.001,\owhich2,0.5,\ochoose,0.01,\dc,0.5, \level,0.5,\isRest,Pseq([1,0],inf).coin.not,\level,Pseq([Pseq([0.25],2),Pseq([0.5],2)],inf),\dur,Pseq([Pseq([1/8],4),Pseq([1/16],6),Pseq([1/4],2),Pseq([1/16],10)],inf))).play;


	Pdef(\y,Pbind(\instrument,\kickmed,\dur,1/4,\freq1,90,\freq2,33,\freq3,30.3,\release,1,\famp1,0.1,\famp2,0.4,\ochoose,1,\owhich2,0,\level,0.1,\fratio,10,\aamp1,1,\aamp2,0.1,\aamp3,0.3,\aamp4,1,\noise,0,\lag,Pseq([Pseq([0.005],2),Pseq([0.025],6)],inf),\isRest,Pdefn(\seq1).coin.not)).play;

	Pdef(\x,Pbind(\instrument,\kickbass,\dur,1/4,\freq1,110,\freq2,33,\freq3,[29.4,30.3],\release,1,\famp1,0.01,\famp2,0.4,\famp3,0.2,\aamp1,0.0005,\aamp3,1,\aamp4,1,\ochoose,3,\owhich2,0,\level,0.2,\isRest,Pdefn(\seq1).coin.not,\lag,Pseq([Pseq([0.005],2),Pseq([0.025],6)],inf))).play;

	Pdef(\z,Pbind(\instrument,\snarehi,\freq1,110.3,\freq2,80,\freq3,110,\dur,1,\famp1,0.001,\famp2,0.001,\famp3,0,\famp4,0,\decay,0,\release,0.1,\aamp1,1,\aamp2,1,\aamp3,0,\aamp4,0.1,\oamp,0.01,\noise,1,\owhich2,1,\ochoose,3,\dc,0.01,\level,0.01,\fratio,10,\isRest,Pseq([0,1],inf).coin.not,\level,0.1)).play;

	Pdef(\y).play;
	Pdef(\x).play;
	Ndef(\feedback).clear;
	Ndef(\noise).clear;
	16.wait;
	Pbindef(\y,\release,0.1);
	Pbindef(\x,\release,0.1);
	Pdef(\hh,Pbind(\instrument,\snaremed,\freq1,40,\freq2,70,\freq3,60,\atk,0.02,\decay,0,\release,0,\oamp,0,\aamp1,1,\aamp2,0,\aamp3,0,\aamp4,0.01,\famp1,0.001,\famp2,0.01,\famp3,0.1,\noise,0.5,\fratio,1,\owhich2,3,\ochoose,1,\dc,0,\isRest,Pdefn(\seq3).coin.not,\level,Pseq([Pseq([0],2),Pseq([0.4],2)],inf),\dur,Pseq([Pseq([1/2],30),Pseq([1/8],2),Pseq([1/4],1),Pseq([1/8],4),Pseq([1/2],32)],inf))).play;

	~part1.();
	Pdef(\samplesnare2).play;
	Pdef(\samplesnare,Pbind(\instrument,\s1,\bufnum,d,\isRest,Pdefn(\seq2).coin.not,\dur,4)).stop;



	16.wait;

	Pdef(\hh).stop;

	~part1.();
	16.wait;
	Pdefn(\seq1,Pseq([Pseq(~eu.(8,3,0).asInteger,1),Pseq(~eu.(8,1,0).asInteger,1)],inf));
	~intro.();
	16.wait;
	~part2.();
	16.wait;
	Pdefn(\seq1,Pseq([1, 0, 0.5, 0, 0, 0, 0, 0,Pseq(~eu.(8,1,2).asInteger,1)],inf));
	~intro.();
	16.wait;
	Pdef(\samplesnare).stop;
	~part4.();
	16.wait;
	Ndef(\stutter2).clear;
	~part1.();

	16.wait;

	Pdef(\x).play;
	Pdef(\y).play;


	Pdef(\z,Pbind(\instrument,\snarehi,\freq1,120,\freq2,80,\freq3,110,\dur,1,\famp1,0.001,\famp2,0.001,\famp3,0,\famp4,0,\atk,0.005,\decay,0,\release,0.01,\aamp1,1,\aamp2,1,\aamp3,0,\aamp4,0.1,\oamp,0.01,\noise,1,\owhich2,1,\ochoose,3,\dc,0.01,\level,0.01,\fratio,10,\isRest,Pseq([0,1],inf).coin.not,\level,0.1)).play;
	Pdef(\samplesnare,Pbind(\instrument,\s1,\bufnum,d,\isRest,Pdefn(\seq2).coin.not,\dur,4)).stop;
	Pdef(\samplesnare2).stop;

	Pdefn(\seq1,Pseq([1, 0, 0.5, 0, 0, 0, 0, 0,Pseq(~eu.(8,1,2).asInteger,1)],inf));
	//
	15.wait;
	Pdef(\x).stop;
	Pdef(\z).stop;
	Pdef(\z2).stop;
	Pdef(\y).stop;
	1.wait;

	~part3.();
	16.wait;
	~part4.();
	Pdef(\samplesnare).stop;

	36.wait;
	Pdef(\samplesnare2).play;
	Pdef(\samplesnare).stop;
	Pdef(\y).stop;
	Pdef(\x).stop;
	Pdef(\hh2).stop;
	Pdef(\melo2).stop;Pdef(\melo).stop;
	Pdef(\z).stop;
	Pdef(\z2).stop;
	6.wait;


}).play;


~intro = {


	Ndef(\noise).clear;

	Pdef(\z).stop;
	Pdef(\samplesnare,Pbind(\instrument,\s1,\bufnum,d,\isRest,Pdefn(\seq2).coin.not,\dur,4)).play;
	Pdef(\samplesnare2,Pbind(\instrument,\snare,\bufnum,g,\isRest,Pseq([0,1],inf).coin.not,\dur,1)).play;


	"~~intro".postln;
	Ndef(\feedback,{arg	band1=1,band2=1,band3=0.1,band4=0.1,band5=0.1,band6=0.11,band7=0.1,band8=1,band9=1,band10=1,dynratio=1,wet=0.1,aux1=0.1,aux2=0,aux3=0,aux4=0,aux5=0,aux6=0 ,dis=3,masteraux1=1,level=0.007,dc =1,dist=0.8;
		var source = (InFeedback.ar(0,2)*aux1);
		source =  Mix.ar(RLPF.ar(
			source,[31.25, 62.5, 125,250,500,1000,2000,4000,8000,16000]*dynratio,    [band1,band2,band3,band4,band5,band6,band7,band8,band9,band10]
		));
		source = (source.abs < dist) *source;
		source = Limiter.ar(source,0.9,0.0001);
		source = RHPF.ar(FreeVerb.ar(source,0.3,0.4,1),30);
		//source = SelectX.ar(wet,[source.tanh + (source * 0.01) !2,InFeedback.ar(6,2)]);
		source = LeakDC.ar(source,dc,30);
		Out.ar(0,source!2*level);

	});
	Ndef(\noise).set(\freq,10);

	Ndef(\noise,{arg freq =40;
		var source = (InFeedback.ar(0))*CuspN.ar(SampleRate.ir/2, LFNoise2.kr([6,6.2],1.1,freq*2), LFNoise2.kr([1.8,1.9],10,freq)) ;
		source = (source.abs < 1) *source*1.tanh.distort;
		Out.ar(0,source*0.1);
	});

	//	Pdef(\melo2,Pbind(\instrument,\melody,\freq,Pseq([659,800]/4,inf),\dur,4)).play;

};
s.plotTree;
~part1 = {

	Ndef(\noise).clear;
	"~part1".postln;
	Ndef(\noise).set(\freq,1);
	Pbindef(\x,\lag,Pseq([Pseq([0.01],2),Pseq([0],2),Pseq([0],4)],inf),\level,0.2,\release,Pseq([1,0.55],inf)).play;
	Pbindef(\y,\lag,Pseq([Pseq([0.01],2),Pseq([0],2),Pseq([0],4)],inf),\level,0.1,\release,Pseq([1,0.55],inf),\freq,30).play;

	Pdefn(\seq1,Pseq([1,0,1, 0, 0, 1, 0, 0, 0, 0,1, 0, 0, 1, 0,0 ],inf));
	Pdef(\z,Pbind(\instrument,\snarehi,\freq1,120,\freq2,80,\freq3,120,\dur,1,\famp1,0.001,\famp2,0,\famp3,0,\famp4,0,\decay,0,\release,0.3,\aamp1,1,\aamp2,1,\aamp3,0,\aamp4,0.1,\oamp,0.01,\noise,1,\owhich2,1,\ochoose,3,\dc,0.01,\level,0.1,\fratio,10,\isRest,Pseq([0,1],inf).coin.not,\level,0.1)).play;

	Pdef(\z2,Pbind(\instrument,\snarehi,\freq1,120,\freq2,100,\freq3,120,\dur,1,\famp1,0.001,\famp2,0,\famp3,0.1,\famp4,0.1,\atk,0.001,\decay,0,\release,0.3,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\lag,0.02,\oamp,0,\noise,1,\owhich2,1,\ochoose,3,\dc,0.01,\level,1,\fratio,10,\isRest,Pseq([0,1],inf).coin.not,\level,0.1)).play;


	Pdef(\samplesnare,Pbind(\instrument,\s1,\bufnum,e,\isRest,Pdefn(\seq2).coin.not,\dur,4,\pos,800)).play;

	Pdef(\samplesnare2,Pbind(\instrument,\snare,\bufnum,g,\lag,Pseq([0.05,0],inf),\isRest,Pseq([0,1],inf).coin.not,\dur,1)).play;

	Tdef(\intro,{
		Pdef(\y).play;
		Pdef(\x).play;
		15.wait;

		Pdef(\z).stop;
		Pdef(\y).stop;
		//	Pdef(\x).stop;
		Pdef(\z2).stop;
		1.wait;


	}).play;
};


~part2 = {
	"~~part2".postln;
	Pbindef(\x,\release,2,\lag,Pseq([Pseq([[0]],4),Pseq([0.5],4)],inf));
	Pbindef(\y,\release,2,\lag,Pseq([Pseq([[0]],4),Pseq([0.5],4)],inf));
	Pdef(\y).play;
	Pdef(\x).play;
	Pdefn(\seq1,Pseq([1, 0, 0, 0, 0, 0, 0, 1,0, 0, 0, 0, 0, 0, 1,0],inf));
	Pdef(\samplesnare,Pbind(\instrument,\s2,\bufnum,f,\isRest,Pdefn(\seq2).coin.not,\dur,4,\pos,0)).play;
	Pdef(\z2,Pbind(\instrument,\snarehi,\freq1,91.2,\freq2,100,\freq3,80,\dur,1,\famp1,0,\famp2,0,\famp3,0.1,\famp4,0.1,\atk,0.01,\decay,0,\release,0.01,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\lag,0.02,\oamp,0,\noise,1,\owhich2,1,\ochoose,2,\dc,0.01,\level,1,\fratio,10,\isRest,Pseq([0,1],inf).coin.not,\level,0.1)).play;
	Pdef(\samplesnare2).play;



	Tdef(\part2,{
		Pdef(\melo,Pbind(\instrument,\melody,\freq,Pseq([888,999],inf),\dur,4)).play;
		Ndef(\noise).set(\freq,10);
		Ndef(\noise,{arg freq =4;
			var source = (InFeedback.ar(0))*CuspN.ar(SampleRate.ir, LFNoise2.kr([0.6,0.62],1.1,freq), LFNoise2.kr([0,0.9],[2,2.9],freq/2)) ;
			source = (source.abs < 1) *source*1.tanh.distort;
			Out.ar(0,source*0.15);
		});
		8.wait;
		Pdefn(\seq1,Pseq([1, 0, 0, 0, 0, 0, 0, 1,0, 0, 0, 0, 0, 0, 1,0],inf));

		Pdef(\y).play;
		Pdef(\x).play;
		Pbindef(\x,\release,2,\lag,Pseq([Pseq([[0]],4),Pseq([0.5],4)],inf));
		Pbindef(\y,\release,2,\lag,Pseq([Pseq([[0]],4),Pseq([0.5],4)],inf));
		Pdef(\samplesnare,Pbind(\instrument,\s2,\bufnum,f,\isRest,Pdefn(\seq2).coin.not,\dur,4,\pos,2)).play;
		Pdef(\samplesnare2).play;

		8.wait;

	}).play

};


~part3 = {
	Pdefn(\seq1,Pseq([1, 0, 0, 0, 0, 0, 0, 0,Pseq(~eu.(8,1,4).asInteger,1)],inf));

	Pdef(\z).stop;
	Pbindef(\x,\lag,Pseq([Pseq([0],8),Pseq([0],8)],inf));
	Pbindef(\y,\lag,Pseq([Pseq([0],8),Pseq([0],8)],inf));


	// LESS YOU SMOKE MORE YOUR STONED



	Tdef(\part3,{
		Pdef(\samplesnare2).stop;

		"~~~part3.1".postln;
		Pdef(\z2,Pbind(\instrument,\snarehi,\freq1,93.4,\freq2,90,\freq3,114,\dur,1,\famp1,0,\famp2,0,\famp3,0.1,\famp4,0.1,\decay,0,\release,0.2,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\lag,0.02,\oamp,0.05,\noise,0.1,\owhich2,1,\ochoose,3,\dc,0.01,\level,0.7,\fratio,10,\isRest,Pseq([0,1],inf).coin.not,\level,0.1)).play;
		Pdef(\samplesnare,Pbind(\instrument,\s1,\bufnum,e,\isRest,Pdefn(\seq2).coin.not,\dur,4,\pos,700)).play;
		Pdef(\samplesnare2,Pbind(\instrument,\snare,\bufnum,g,\lag,0,\isRest,Pseq([0,1],inf).coin.not,\dur,1)).play;

		Pdef(\y).play;
		Pdef(\x).play;
		Pdef(\melo2,Pbind(\instrument,\melody,\freq,Pseq([659,800]/4,inf),\dur,4)).play;
		8.wait;
		Pdef(\melo2,Pbind(\instrument,\melody,\freq,Pseq([659,800,888,999]/4,inf),\dur,4)).play;
		8.wait;
		Pdef(\melo2,Pbind(\instrument,\melody,\freq,Pseq([659,800]/5,inf),\dur,4)).play;
		8.wait;
		Pdef(\melo2,Pbind(\instrument,\melody,\freq,Pseq([659,800,888,999]/4,inf),\dur,4)).play;


		6.wait;
		Pdef(\y).stop;
		Pdef(\x).stop;
		2.wait;
		Pdef(\y).play;
		Pdef(\x).play;
		"~~~part3.2".postln;

		Tdef(\part4).stop;
		Pdefn(\seq1,Pseq([1,0,0,0,
			0,0,0,0,
			0,1,0,0,
			0,0,0,0
		],inf));



		8.wait;
		Pdef(\y).play;
		Pdef(\x).play;
		Pdef(\samplesnare2).stop;
		Pdef(\hh).stop;
		Pbindef(\x,\release,2,\lag,Pseq([Pseq([[0]],4),Pseq([0.5],8),Pseq([0.038],4)],inf));
		Pbindef(\y,\release,2,\lag,Pseq([Pseq([[0]],4),Pseq([0.5],8),Pseq([[0.038]],4)],inf));

		Pdef(\z2,Pbind(\instrument,\snarehi,\freq1,120,\freq2,90,\freq3,[88,88.5],\dur,1,\famp1,0,\famp2,0,\famp3,0.1,\famp4,0.1,\atk,0.001,\decay,0,\release,0.1,\aamp1,1,\aamp2,1,\aamp3,1,\aamp4,0.1,\lag,0.02,\oamp,0.05,\noise,0.1,\owhich2,1,\ochoose,3,\dc,0.01,\level,1,\fratio,10,\isRest,Pseq([0,1],inf).coin.not,\level,0.1)).play;

		Pdef(\samplesnare,Pbind(\instrument,\s1,\bufnum,d,\isRest,Pdefn(\seq2).coin.not,\dur,4)).play;

		"~~~part3.3".postln;
		Pdef(\samplesnare2).play;

		Pdefn(\seq1,Pseq([1,0,0,0,
			0,0,0,0,
			0,1,0,0,
			0,0,0,0
		],inf));
		4.wait;

		Pdef(\samplesnare2).stop;
		Pdef(\z).stop;
		16.wait;

		1.wait;
	}).play;
};

~part4 = {

	Pdef(\z,Pbind(\instrument,\snarehi,\freq1,110.3,\freq2,80,\freq3,110,\dur,1,\famp1,0.001,\famp2,0,\famp3,0,\famp4,0,\decay,0,\release,0.3,\aamp1,1,\aamp2,1,\aamp3,0,\aamp4,0.1,\oamp,0.01,\noise,1,\owhich2,1,\ochoose,3,\dc,0.01,\level,0.01,\fratio,10,\isRest,Pseq([0,1],inf).coin.not,\level,0.1)).play;
	Pbindef(\x,\lag,Pseq([Pseq([0.02],4),Pseq([0],12)],inf),\release,2);
	Pbindef(\y,\lag,Pseq([Pseq([0.02],4),Pseq([0],12)],inf),\release,2);
	"~~~part4".postln;
	Tdef(\part4,{
		Pdef(\x).play;
		Pdef(\melo2).stop;Pdef(\melo).stop;
		Pdefn(\seq1,Pseq([1, 0, 0, 0, 0, 0, 0, 0,Pseq(~eu.(8,0,2).asInteger,1)],inf));
		Pdef(\samplesnare2,Pbind(\instrument,\snare,\bufnum,g,\lag,Pseq([Pseq([0],13),0.5,Pseq([0],6)],inf),\isRest,Pseq([0,1],inf).coin.not,\dur,1)).play;

		//		Pdef(\samplesnare,Pbind(\instrument,\s1,\bufnum,d,\isRest,Pdefn(\seq2).coin.not,\dur,4,\pos,Pseq([2,3,1,1.5,2.5],inf)*44100)).play;



		30.wait;
		Pdefn(\seq1,Pseq([Pseq(~eu.(8,1,0).asInteger,1),Pseq(~eu.(8,1,3).asInteger,1)],inf));
		Pdef(\samplesnare2).stop;
		Pdef(\samplesnare).stop;
		Pdef(\y).stop;
		2.wait;

		15.wait;
		Pdef(\y).stop;
		Pdef(\x).stop;
		Ndef(\noise).set(\freq,1);
		1.wait;

	}).play;
};
)

Ndef(\echo).clear;
Ndef(\echo, { arg out=0, maxdtime=0.2, dtime=0.2, decay=2, gate=1,fader1=0, amp=1;
	var env, in;
	env = Linen.kr(gate, 0.5, 0.4, 0.1, 2);
	in = InFeedback.ar(14,2)*fader1;
	//in = LPF.ar(in,15000,1,0.01);

	//	in = HPF.ar(in,400,1,0.01)+in;
	Out.ar(0,CombL.ar(in * env, maxdtime, dtime, decay, amp, in));
	//XOut.ar(out, env, CombL.ar(in * env, maxdtime, dtime, decay, amp, in));
}, [\ir, \ir, 0.1, 0.1, 0]);


~midifuncfx = {arg fx,value,num,coef=1;
	MIDIdef.cc(value++fx, {arg vel;
		Ndef(fx).set(value,vel/127*coef);
		(value++":"++vel).asSymbol.postln;
	},num);
};

~midifuncfx.(\echo,\maxdtime,36);
~midifuncfx.(\echo,\dtime,37);
~midifuncfx.(\echo,\decay,38,8);
~midifuncfx.(\echo,\amp,39);

~midifuncfx.(\echo,\fader1,11);

s.meter;
MIDIIn.connectAll;
s.makeGui;

~vocals.free;

Ndef(\chorus).clear;
~vocals = Ndef(\chorus, { arg inbus=10, outbus=2, predelay=0.8, speed=0.05, depth=0.1, ph_diff=0.5,level=1;
	var in, sig, modulators, source, numDelays = 12;
	source = AudioIn.ar(3,1);
	source = HPF.ar(source,700);
	in = (source) * numDelays.reciprocal;
	modulators = Array.fill(numDelays, {arg i;
		LFPar.kr(speed * rrand(9.34, 9.06), ph_diff * i, depth, predelay);});
	sig = DelayC.ar(in, 0.5, modulators);
	sig = sig.sum; //Mix(sig);
	Out.ar(2, sig!2*level); // output in stereo
	//Out.ar(14, sig!2*10*level);
});
~vocals.set(\level,40);


~vocals.set(\predelay, 0.2);
~vocals.set(\speed, 0.92);
~vocals.set(\depth, 5);
~vocals.set(\pd_diff, 0.7);
~vocals.set(\predelay, 10);


Ndef(\feedback).edit;