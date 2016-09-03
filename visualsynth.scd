SynthDef(\visual,{arg del =0.2;
	var sig = SoundIn.ar(2,1);
	Out.ar(0,[sig,DelayL.ar(sig,1,del)]);
}).add;

~visual = Synth(\visual);
~visual.free;
s.scope;

~visual.set(\del,0.01);

