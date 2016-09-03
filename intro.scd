/// create parts to launch with pad
"/home/xtr/exoterrism/livesets/electropixel.scd".loadPath;
s.scope;

s.meter;
~elapsedtime.time;
s.plotTree;
Ndef(\noise2).free;

Ndef(\drones).free;
Ndef(\drones2).free;
(
~hollow = Buffer.read(s, "/home/xtr/Desktop/.footwork/soundfiles/hollowearth.wav");

t = TempoClock.default;
t.tempo= 60/60;
~elapsedtime = BeatSched.new;
"/home/xtr/exoterrism/patterns/dub.scd".loadPath;


Ndef(\drones).fadeTime=1;
Ndef(\drones2).fadeTime=1;
Ndef(\drones3).fadeTime=1;
Ndef(\noise).fadeTime =0.5;

Tdef(\intro,{

Ndef(\noise,{
	var sig =SinOsc.ar([55.5,55]);
	sig = Compander.ar(sig,In.ar(0,1),0.05,1,0.01,0.01,3);
		sig = Limiter.ar(sig,0.3);
		sig *0.8;
		Out.ar(4,sig);
});

16.wait;

Ndef(\drones,{arg deltime;
	var sig = WhiteNoise.ar(0.1);
	sig = CombL.ar(sig,0.1,[0.02,0.03]+deltime);
	sig = (sig *0.1)+SinOsc.ar([40,40.5],0,0.7);
	sig = sig + HPF.ar(sig,1000,0.3).tanh;
	sig = Compander.ar(sig,In.ar(0,1),0.05,1,0.01,0.01,1);
	sig = sig *0.5*Line.kr(0,1,4);
	Out.ar(4,sig);
});

16.wait;

Pdef(\sample,Pbind(\instrument,\playbuf,\bufnum,~hollow,\pos,0*44100,\out,3,\len,60,\speed,1,\pitch,0.88,\rel,0.1,\isRest,Pseq([1],1),\dur,60)).play;

33.wait;

Ndef(\drones3,{arg deltime=0.1;
	var sig = WhiteNoise.ar(0.1);
	sig = CombL.ar(sig,0.1,[0.02,0.01]+deltime);
	sig = (sig *0.1)+SinOsc.ar(([80,83,87,75]+(432.cpsmidi-69)).midicps+SinOsc.kr(deltime);
,[deltime,deltime+0.1],0.7);
	sig = sig + HPF.ar(sig,500,0.3).tanh;
	sig = Splay.ar(sig*0.05);
	Out.ar(4,sig*Line.kr(0,1,4));

});
16.wait;
8.wait;
Ndef.clear;

		5.wait;

Ndef(\noise,{
	var sig =SinOsc.ar([55.5,55]);
	sig = Compander.ar(sig,In.ar(0,1),0.05,1,0.01,0.01,3);
		sig = Limiter.ar(sig,0.3);
		Out.ar(4,sig*Line.kr(0,1,4));
});

Pdef(\melo,Pbind(\instrument,\notes2,\out,4,\sus,0.3,\dur,Pseq([2,2,4],inf),\at,4,\notes,Pseq([69,70,69],inf))).play;
Pdef(\melo2,Pbind(\instrument,\notes2,\out,4,\dur,Pseq([8],inf),\at,6,\notes,Pseq([81,82,79],inf))).play;

	16.wait;

Pdef(\t1).play;
Pbindef(\t1,\dur,1,\rel,1);


32.wait;

Pdef(\t2).play;
Pdef(\snare).play;

28.wait;
			Pdef(\snare).stop;
			Pdef(\hat).play;
4.wait;
			Pdef(\snare2).play;
			Pdef(\sub,Pbind(\instrument,\kicknoise,\dur,4,\amp,0.3)).play;
			Pbindef(\t1,\dur,1/4,\rel,0.5);
32.wait;

	Pdef(\t2).stop;
	Pdef(\snare).stop;
	Pdef(\t1).stop;

31.wait;

Pdef(\sample,Pbind(\instrument,\playbuf,\bufnum,~hollow,\pos,44100*4.5,\out,3,\level,2,\len,1,\speed,1,\pitch,0.88,\rel,0.1,\isRest,Pseq([1],inf),\dur,1)).play;

	1.wait;
	Pdef(\t2).play;
	Pdef(\snare).play;
	Pdef(\t1).play;

	64.wait;


	Ndef(\noise2,{
	var sig;
	var r;
    r = MouseX.kr(3.5441, 4);
	sig =  QuadN.ar(SampleRate.ir/4, r.neg, r, 0, 0.1) * 0.4;
	sig = HPF.ar(sig,1000);
	sig = Limiter.ar(sig,0.4);
	sig = [sig ,DelayL.ar(sig,0.1,1000/44100)];
	sig = Compander.ar(sig,In.ar(0,2),0.1,1,0.1,0.01,0.5);
	sig = sig*0.4;
Out.ar(4,sig);
});

	64.wait;

Ndef(\noise,{
	var sig =SinOsc.ar([55.5,55]);
	sig = Compander.ar(sig,In.ar(0,1),0.05,1,0.001,0.01,3);
		sig = Limiter.ar(sig,0.3);
		Out.ar(4,sig);

});

	Pdef(\hat).stop;
	Pdef(\snare2).stop;
	Pdef(\sub).stop;
    Pdef(\t2).stop;
	Pdef(\snare).stop;
	Pdef(\t1).stop;

Pdef(\sample,Pbind(\instrument,\playbuf,\pos,44100*17,\bufnum,~hollow,\out,3,\level,2,\len,32,\rel,4,\pitch,0.88,\speed,1,\isRest,Pseq([1],1),\dur,32)).play;

	30.wait;
	Pdef(\melo).stop;
	Pdef(\melo2).stop;
	2.wait;

Ndef(\noise).clear;
	Pdef(\hat).play;
	Pdef(\snare2).play;
	Pdef(\sub).play;
    Pdef(\t2).play;
	Pdef(\snare).play;
	Pdef(\t1).play;
	64.wait;
	"end".postln;
	Pdef(\hat).stop;
	Pdef(\snare2).stop;
	Pdef(\sub).stop;
    Pdef(\t2).stop;
	Pdef(\snare).stop;
	Pdef(\t1).stop;
4.wait;

	~elapsedtime.time;
4.wait;
	Ndef(\noise).clear;

4.wait;


}).play;
);
