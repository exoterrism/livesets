Ndef(\saw,{SinOsc.ar(400)}).play;


Ndef(\saw).free;

Ndef(\saw).fadeTime = 10;


s.meter;

Ndef(\saw).play;


Ndef(\saw).clear;



Ndef(\saw,{SinOsc.ar(400)*SinOsc.ar(1)}).play; // Amplitude modulation

//same


Ndef(\saw,{SinOsc.ar(400,0,SinOsc.ar(100))}).play; //

//frequency moduation

Ndef(\saw,{SinOsc.ar(SinOsc.ar(1,[0,pi/16],40),0,1)}).play//

//additive
Ndef(\saw,{(SinOsc.ar(30)+SinOsc.ar(600)*0.5)}).play;


// soustractive

//filer//  Envelopes
Ndef(\saw,{LPF.ar(Mix.ar(SinOsc.ar([100,200,300,1000,2000])),Duty.kr(10,0,Dseq([100,200,300,400],inf)))}).play;

Ndef(\test,{
	var env= EnvGen.ar(Env.perc(0.01,1).circle);
	var sig  = SinOsc.ar(4000) *env;
	sig;
}).play;


///

SynthDef(\test,{arg gate= 1;
	var env= EnvGen.ar(Env.perc(0.01,1),gate,doneAction:2);
	var sig  = SinOsc.ar(4000) *env;
	Out.ar(0,sig);
}).add(s);

Pdef(\pattern,Pbind(\instrument,\test)).play;

s.plotTree;




/// Exercice
/// Créer une envelope qui va modifier la frequence  de 10000 hz à 50 hz en 0.01 seconde;
// et une envelope qui va modifier l'amplitude de 1 à 0 en 0.1 seconde;

utiliser EnvGen.ar(Env.new([],[]))

SynthDef(\test,{arg gate= 1,freq=1000;
	var env= EnvGen.ar(Env.perc(0,0.1),gate,doneAction:2);
	var freqenv = EnvGen.ar(Env.new([1000,50],[0.01]));
	var sig  = SinOsc.ar(freq) *env;
	Out.ar(0,sig);
}).add(s);

Pdef(\pattern,Pbind(\instrument,\test,\freq,Pseq([1000,800,600],inf))).play;



SynthDef(\test,{arg gate= 1,freq=1000;
	var env= EnvGen.ar(Env.perc(0,0.1),gate,doneAction:2);
	var freqenv = EnvGen.ar(\envf.kr(Env.new([1000,50],[0.01])));
	var sig  = SinOsc.ar(freqenv) *env;
	Out.ar(0,sig);
}).add(s);

Pdef(\pattern,Pbind(\instrument,\test,
	\dur,1/8,
	\isRest,Pseq([1,0,0,1,0,0,1,0],inf).coin.not,
	\envf,Pseq([
	[Env([1000,50],[0.01])],
	[Env([10000,50],[0.01])],
	[Env([100,5000],[0.01])],
],inf))).play;


SynthDef(\mixer,{arg aux1 = 0;
	var in = In.ar(0,1)*aux1;
	Out.ar(18,in);
}).add(s);


SynthDef(\delay,{
	var in = In.ar(18,1);
	var sig = DelayL.ar(in,0.2,1/SampleRate.ir);
	Out.ar(0,sig);
}).add(s);

~delay = Synth(\delay);
~mixer = Synth(\mixer);


~mixer.set(\aux1,1);

~mixer.free;
~delay.free;
s.scope;
FreqScope.new;


// one sample delay;
Ndef(\noise,{arg fblevel=0.5;
	var sig= WhiteNoise.ar;
	sig = DelayL.ar(sig,0.1,(1/SampleRate.ir*10))+sig;
	sig *0.5;
}).play;


// echo
Ndef(\noise,{arg fblevel=0.6,delay=0.01,pitch=1;
	var sig= In.ar(0,1);
	sig = (sig)+ (DelayL.ar(LocalIn.ar(1)*fblevel,0.1,delay));
	sig = Limiter.ar(FreeVerb.ar(sig,1,1),0.6);
	LocalOut.ar(sig);
	sig = PitchShift.ar(sig,0.2,pitch);
	sig;
}).play;

Ndef(\noise).unset(\delay);
Ndef(\noise)[1]=\set->Pbind(\dur,1/4,\delay,Pseq([0.01,0.02,1,2,0.1,0.05,0.07],inf));
Ndef(\noise)[2]=\set->Pbind(\dur,1,\fblevel,Pseq([0.9,0.02,0.9,0.9,0.1,0.05,0.07],inf));
Ndef(\noise)[3]=\set->Pbind(\dur,1/32,\pitch,Pseq([0.9,0.02,0.9,9,0.1,5,0.07],inf));

Pdef(\pattern).play;

Ndef(\noise).clear;
Ndef(\noise,{arg fblevel=0.6,delay=0.01;
	var sig= In.ar(0,1);
	sig = AllpassL.ar(sig,0.2,rrand(0.01,0.05),0.1)+sig;
	sig = AllpassL.ar(sig,0.2,rrand(0.01,0.05),0.1)+sig;
	sig = AllpassL.ar(sig,0.2,rrand(0.01,0.05),0.1)+sig;
	sig = AllpassL.ar(sig,0.2,rrand(0.01,0.05),0.1)+sig;
	sig = AllpassL.ar(sig,0.2,rrand(0.01,0.05),0.1)+sig;
	sig = AllpassL.ar(sig,0.2,rrand(0.01,0.05),0.1)+sig;
	sig = AllpassL.ar(sig,0.2,rrand(0.01,0.05),0.1)+sig;
	sig = AllpassL.ar(sig,0.2,rrand(0.01,0.05),0.1)+sig;
	sig;
}).play;

s.meter;



~sinus = {arg name,freq, phase, amp;
	Ndef(name,{SinOsc.ar(freq,phase,amp)}).play;
}
~sinus.(\sin1,400,0,1);
~sinus.(\sin2,401,0,1);

~freq = [400,1000,200,600,700,800,1000];

8.do{arg i ;
	~sinus.((\sin++i).asSymbol,~freq[i],0,1);
};



s.plotTree;

Ndef(\sin,{SinOsc.ar}).play
Ndef(\sin).fadeTime =10;
Ndef(\sin).free;


Ringz.ar(sig,[1000,2000,5000,6000]