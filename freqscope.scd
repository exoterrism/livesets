


SynthDef(\all,{
	var sig = Mix.ar(In.ar([0,1,2,3,4,6],1));
	Out.ar(48,sig);
}).add;

~all = Synth(\all);
~all.free;

FreqScope.new