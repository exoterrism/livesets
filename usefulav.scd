( // a custom dual oscilloscope
Server.default = Server.internal;
Server.default.waitForBoot({
// make internal the default server
var waveScope, phaseScope; // the two scopes
// allocate two audio buffers
var bufferA = Buffer.alloc(Server.default, 1024,2);
var bufferB = Buffer.alloc(Server.default, 1024,2);
// a stereo signal
var sound = {
var signal = Resonz.ar(
[ ClipNoise.ar(1.7), ClipNoise.ar(1.8) ],
SinOsc.ar(1000).range(100,500)); // a stereo signal
ScopeOut.ar(signal, bufferA); // update first buffer
ScopeOut.ar(signal, bufferB); // update second buffer
Out.ar(0,signal); // write to output
}.play;
// create the main Window
var window = Window("Dual Oscilloscope", 640@320).front
.onClose_({ // on close stop sound and free buffers
		sound.free;
bufferA.free;
bufferB.free;
});
window.addFlowLayout; // add a flowLayout to the window
// create the ScopeViews and set their buffers
waveScope = ScopeView(window,314@310).bufnum_(bufferA.bufnum);
phaseScope = ScopeView(window,314@310).bufnum_(bufferB.bufnum);
// customize waveScope
waveScope.style_(1)
// overlay channels
.waveColors_([Color.red,
Color.yellow]).background_(Color.magenta(0.4))
.xZoom_(1.7).yZoom_(1.2);
// scaling factors
// customize phaseScope
phaseScope.style_(2)
// lissajous mode
.waveColors_([Color.magenta]).background_(Color.cyan(0.3))
.xZoom_(1.2).yZoom_(1.2);
// scaling factors
})
)


( // a custom Frequency Analyzer
Server.default = Server.local; // set local as the default server
Server.default.waitForBoot({
// create the parent window
var window = Window("Frequency Analyzer", 640@480).front
.onClose_({ // on close
sound.free; // stop sound
scope.kill; // kill the analyzer
});
// the bus to scope
var bus = Bus.audio(Server.default,2);
// a stereo signal
var sound = {
var signal = Resonz.ar(
[ ClipNoise.ar(1.7), ClipNoise.ar(1.8) ],
SinOsc.ar(1000).range(100,500)); // a stereo signal
Out.ar(bus,signal); // update bus for scoping
Out.ar(0,signal);
// write to output
}.play;
	// the frequency scope
var scope = FreqScopeView(window,640@480).active_(true);
// activate it
scope.background_(Color.red).waveColors_([Color.yellow]);
// set colors
scope.dbRange_(120); // set amplitude range (in decibels)
scope.inBus_(bus); // select Bus to scope
})
)


( // Simple Level Metering
Server.default.waitForBoot({
// create the parent window
var window = Window.new("Level Metering", Rect(200,400,60,220)).
front
	.onClose_({
// stop routine when the window is closed
updateIndicator.stop;
sound.free;
});
var bus = Bus.control();
	 // create a Bus to store amplitude data
// an audio signal
var sound = {
var sound = WhiteNoise.ar(Demand.kr
(Dust.kr(20),0,Dbrown(0,1,0.3)));
var amp = Amplitude.kr(sound); // track the signal's amplitude
Out.kr(bus, amp); // write amplitude data to control bus
Out.ar(0,sound);
// write sound to output bus
}.play;
// create and customize Indicator
var indicator = LevelIndicator(window,Rect(10,10,40,200))
.warning_(0.5)
// set warning level
.critical_(0.7)
// set critical level
.background_(Color.cyan) // set Color
.numTicks_(12)
// set number of measurement lines
.numMajorTicks_(3)
// set number of major measurement lines
.drawsPeak_(true);
// draw Peak Values
// update the Indicator's value with a routine
var updateIndicator = fork{loop{
bus.get({
// get current value from the bus
arg value;
{indicator.value_(value);
// set Indicator's value
indicator.peakLevel_(value); // set Indicator's peak value
}.defer(); // schedule in the AppClock
});
0.01.wait; // indicator will be updated every 0.01 seconds
}};
});
)


( // Monitoring a complex numerical Dataset
var indicators, updateIndicators;
var index = 0; // a global index used to iterate through the dataset
var dataset = Array.fill(8,{Array.fill(1000,{rrand(0,1.0)})});
// a multi-dimensional dataset
// create window
var window = Window.new("Monitoring a complex numerical dataset",
360@210).front.onClose_({ updateIndicators.stop });
window.addFlowLayout; // add flowLayout
// create and customize 8 Level indicators
indicators = Array.fill(8, {LevelIndicator(window,40@200)});
indicators.do { arg item;
item.warning_(0.8).critical_(0.9).background_(Color.cyan).drawsPeak_
(true);
};
// update the indicators with a routine
updateIndicators = fork{loop{
indicators.do{ arg item, i; {
var value = dataset[i][index]; // read value from the dataset
item.value_(value);
// set each Indicator's value
item.peakLevel_(value);
// set each Indicator's peak value
}.defer(); // schedule in the AppClock
};
// increment index or set to 0 if it has exceeded dataset's size
if ( index < 1000) {index = index + 1;} {index = 0; };
0.1.wait; // indicators will be updated every 0.1 seconds
}};
)

(  // A non-standard visualizer
var sliders, updateSliders;
var index = 0;  // a global index used to iterate through the dataset
var dataset = Array.fill(8,{Array.fill(1000,{rrand(0,1.0)})}); // a multi-dimensional dataset

// create window
var window = Window.new("Monitoring a complex numerical dataset", 360@210).front.onClose_({ updateSliders.stop});
window.addFlowLayout; // add flowLayout

// create and customize 8 RangeSliders
sliders = Array.fill(8, {RangeSlider(window,40@200)});
sliders.do { arg item;
	item.background_(Color.cyan); // set background Color
	item.knobColor_(Color.green); // set knob color
};

updateSliders = fork{loop{
	sliders.do{ arg item, i; {
		var value;
		// store current and previous values in an array and sort it so that the smaller number is always the first
		value = [dataset[i][index-1], dataset[i][index]].sort;
		// set each RangeSlider's value
		item.setSpan(value[0],value[1]);
	}.defer();
	};
	if ( index < 1000) {index = index + 1;} {index = 0; }; // increment
	0.1.wait; // sliders will be updated every 0.1 seconds
}};
)











a=1@2;f=1;w=Window().front.drawHook_({900.do{Pen.line(a*200,(a=(a*(f=f+2e-6)).y.cos+1@a.x)*200)};Pen.stroke});AppClock.play{w.refresh;0.01} // by Andrea Valle
/*
itaru yasuda -- complex composition
100923 supercollider symposium 2010 in berlin, ausland concert 1
--
duration:
about 13 minutes(executed on supercollider revision10269 with mbp 15' 2.5ghz intel, osx.5.8)
--
based on:
http://www.fredrikolofsson.com/f0blog/?q=node/316
http://twitter.com/headcube/status/3084580983
*/

(
	//--server setting
	s.options.memSize= 262144;
	s.latency= 0.1;
	s.waitForBoot{
		//--window size
		var width= 1024, height=768;
		//--sounds
		var syn0= SynthDef(\syn0, {|mof= 0, dep= 0, caf= 0, amp= 0, spr= 0|
			var mod= Pulse.ar(mof, 0.5, dep, dep/4);
			var car= SinOsc.ar(caf, mod, amp);
			Out.ar(0, Splay.ar(car, spr, amp, 0));
		}, #[0.06, 0.01, 0.03, 0.01, 0.01]).play(s);

		var syn1= SynthDef(\syn1, {|mof= 0, dep= 0, caf= 0, amp= 0, pan= 0|
			var mod= Saw.ar(mof, 0, dep);
			var car= SinOsc.ar(caf, mod, amp);
			Out.ar(0, Pan2.ar(car, pan, amp));
		}, #[0.01, 0.01, 0.01, 0.01, 0.01]).play(s);

		var syn2r= SynthDef(\syn2r, {|mof= 0, dep= 0, caf= 0, amp=0, pan= 0|
			var mod= Saw.ar(mof, 0, dep);
			var car= SinOsc.ar(caf, mod, amp);
			Out.ar(0, Pan2.ar(car, pan));
		}, #[0.04, 0.04, 0.04, 0.04, 0.04]).play(s);

		var syn2l= SynthDef(\syn2l, {|mof= 0, dep= 0, caf= 0, amp=0, pan= 0|
			var mod= VarSaw.ar(mof, 0.2, 0.5, dep);
			var car= SinOsc.ar(caf, mod, amp);
			Out.ar(0, Pan2.ar(car, pan));
		}, #[0.01, 0.01, 0.01, 0.01, 0.01]).play(s);

		var syn3= SynthDef(\syn3, {|mof= 0, dep= 0, caf= 0, amp=0, pan= 0|
			var mod= LFSaw.ar(mof, 0.5, dep);
			var car= SinOsc.ar(caf, mod, amp);
			Out.ar(0, Pan2.ar(car, pan, amp));
		}, #[0.01, 0.01, 0.01, 0.01, 0.01]).play(s);

		var syn4= SynthDef(\syn4, {|mof= 0, dep= 0, caf= 0, amp=0, pan= 0|
			var mod= LFSaw.ar(mof, 0.5, dep);
			var car= SinOsc.ar(caf, mod, amp);
			Out.ar(0, Pan2.ar(car, pan, amp));
		}, #[0.05, 0.05, 0.05, 0.05, 0.05]).play(s);

		//--window setting
		//w= Window("|", Rect(200, 200, width, height), false);
		w= Window("|", Rect(0, 0, width, height), false, border:false); //mirroring
		// w= Window("|", Rect(1440, 132, width, height), false, border:false); //output
		v= UserView(w, w.view.bounds);
		v.background= Color.black;
		v.animate= true; //*** if you use swingosc, just comment out this line and uncomment following line marked by '***' but sorry, i guess it may be very slow...

		//--parameters initial setting
		~seq= 0;
		~subseq= 0;
		~num= 1000;
		~a= 1@1;
		~aa= 1@1;
		~f= 0;
		~ff= 0;
		~z= 1e-4;
		~zz= 3;
		~r= 1;
		~d= 1;
		~cnt= 8e-8;

		v.drawFunc= {
			var x, y, yxx, temp, xx, yy;
			var wh= width/2, hh= height/2, wq= width/4, xo= width/8, yo= height/8;
			var sa= sin(2pi*~r), ca= cos(2pi*~r);

			Pen.strokeColor= Color.white;
			//--seq0
			if(~seq==0, {
				//--mess up henon map calculation
				x= exprand(2,6)-4;
				y= exprand(2,6)-4;
				yxx= y-(x*x%x).tanh;
				temp= (x*ca)-(yxx*sa);
				y= (x*sa)+(yxx*ca);
				x= temp;
				xx= xo + (width/30*x.sin);
		        	yy= yo - (height/30*y.cos);

		        	Pen.translate(wh, hh);
		        	~num.do{
		        		~p0= (xx@yy)+~d;
		        		~p1= ~a*hh%~p0;
		        		~p2= (~a=(~a+~z*(~f=~f+~cnt)).x.sin@~a.x.tanh+~z)*~p0/2;
		        		~p3= (~p1%~p0)*2;
		        		~p4= (~p2%~p0)*2;
		        		Pen.line(~p3, ~p4);
		        		Pen.rotate(1);
		        	};
		        	Pen.stroke;
		        	syn0.set(
		        		\mof, (~p3.x+~p4.x).abs/3,
		        		\dep, (~p3.y+~p4.y/2).abs/5,
		        		\caf, 64,
		        		\amp, 0.72,
		        		\spr, (~p3.x+~p4.x/2).linlin(width.neg*0.5, width*0.5, 0, 1)
		        	);
		        	//--control
		        	if(~z<0.05,{~z= ~z*1.004},{~z= ~z*1.0006});
				if(~z>0.3, {~z= ~z*1.001; ~cnt= 1e-7});
				if(~f>0.15, {~cnt= 1e-6; ~r= 0.1});
				if(~f>0.75, {~cnt= 5e-6; ~d= ~d*1.001});
				if(~f>1.2, {~r= 0.768; ~cnt= 8e-6;});
				if(~f>1.5, {~r= 0.168; ~d= ~d*1.007});
				if(~d>2000, {~cnt= 0; ~z= 0.25; ~f= 0; ~d= 250; ~ct.start});
				~ct= Task({
					80.wait; //better to comment-out when you check the sequence
					~f= 0;
					~z= 10;
					~cnt= 1e-6;
					~num= 600;
					~seq= 1;
					syn0.free;
				}, AppClock);
			});
			//--seq#1
			if(~seq==1, {
				~num.do{
					~p1= ~a*hh;
					~p2= (~a=(~a+~z*(~f=~f+~cnt)).x.sin+1.7@~a.x-0.35)*hh;
					Pen.line(~p1, ~p2);
				};
				Pen.stroke;
				syn1.set(
					\mof, ~p1.x+~p2.x/2,
					\dep, (~p2.x-~p2.y).abs/hh*1500,
					\caf, 100+(~f*2),
					\amp, 0.67,
					\pan, 2*(~p1.x+~p2.x/2)/width-1
				);
				//--control
				~z= ~z*1.0003;
				~cnt= ~cnt*1.0001;
				if(~f>3, {~z= ~z*1.0005; ~cnt= ~cnt*1.0005});
				if(~f>5, {~z= ~z*1.001; ~cnt= ~cnt*1.001});
				if(~f>10, {~f= 0; ~z= 0.1; ~cnt= 0; ~seq= 2; syn1.free});
			});
			//--seq#2r
			if(~seq==2, {
				400.do{|i|
					~p1= ~a*wq;
					~p2= (~a=(~a+(i*~z)*(~f=~f+2e-6)).x.cos+4@~a.x-1)*wq;
					Pen.line(~p1, ~p2);
				};
				Pen.stroke;
				syn2r.set(
					\mof, (~p1.x+~p2.x),
					\dep, (~p2.x-~p2.y).abs/wq*1500,
					\caf, 75+(~f*2),
					\amp, 0.3,
					\pan, 2*(~p1.x+~p2.x/2)/width-1
				);
				//--control
				~z= ~z*1.0002;
				if(~f>2, {~subseq= 1; ~z= ~z*1.0005});
			});
			//--seq#2l
			if(~subseq==1, {
				400.do{|i|
					~p3= ~aa*wq;
					~p4= (~aa=(~aa+(i*2)+~zz%(~ff=~ff+6e-6)).y.sin+1@~aa.x)*wq;
					Pen.line(~p3, ~p4);
				};
				Pen.stroke;
				syn2l.set(
					\mof, (~p3.x+~p4.x)/4,
					\dep, (~p4.x-~p4.y).abs/wq*800,
					\caf, 50+(~ff*2),
					\amp, 0.3,
					\pan, 2*(~p3.x+~p4.x/2)/width-1
				);
				//--control
				~zz= ~zz*1.002;
				if(~zz>2000, {
					~a= 1@1;
					~f= 0;
					~ff= 0;
					~z= 0.5;
					~zz= 0;
					~num=1001;
					~cnt= 7e-7;
					~subseq= 0;
					~seq= 3;
					syn2r.free;
					syn2l.free;
				});
			});
			//--seq#3
			if(~seq==3, {
				Pen.translate(wh, hh);
				~num.do{|i|
					~p1= ~a*i/1.68;
					~p2= (~a= (~a+~z*(~f=~f+~cnt)).y.tan@~a.x.tanh)*hh;
					Pen.line(~p1, ~p2);
				};
				Pen.stroke;
				syn3.set(
					\mof, ~p1.y+~p2.y,
					\dep, ~p1.y+~p2.y/16,
					\caf, 640+(~f*12),
					\amp, 0.55,
					\pan, (~p1.x+~p2.x/2).linlin(width.neg*0.5, width*0.5, -1, 1)
				);
				//--control
				if(~f<1, {~z= ~z*1.001},{~z= ~z*1.0015});
				if(~f>1.2, {~z= ~z*1.002; ~cnt= 1e-6});
				if(~f>1.4, {~z= ~z*1.003;});
				if(~f>1.6, {~z= ~z-0.08; ~cnt= 3e-6});
				if(~f>2.8, {
					~a= 1@2;
					~f= 0;
					~z= 1;
					~d= 2;
					~num= 1001;
					~cnt= 1e-8;
					~seq= 4;
					syn3.free;
				});
			});
			//--seq#4
			if(~seq==4, {
				Pen.translate(wh, hh);
				~num.do{|i|
					~p1= ~a*i/~d;
					~p2= (~a= (~a*~z.trunc(~f=~f+~cnt)).y.tan@(~a*~z).x.tanh.atan.reciprocal)*hh;
					Pen.line(~p1, ~p2);
				};
				Pen.stroke;
				syn4.set(
					\mof, ~p1.y+~p2.y,
					\dep, ~p1.y+~p2.y/16,
					\caf, 640+(~f*12),
					\amp, 0.55,
					\pan, (~p1.x+~p2.x/2).linlin(width.neg*0.5, width*0.5, -1, 1)
				);
				//--control
				if(~f<0.005, {~z= ~z*1.0007}, {~d= ~d*1.001; ~z= ~z*1.003});
				if(~f>0.01,{~cnt= 2e-7; ~z= ~z*1.01});
				if(~z>10000, {~z= 5000});
				if(~d>10, {~f= 30; ~z= -1; ~num= 909; ~d= ~d*1.007});
				if(~d>200, {~d= 10; ~f= 77; ~z= -1000; ~num= 999; ~qt.start});
				~qt= Task({20.wait; w.close}, AppClock);
			});
		};
	//c= ClockFace.new.play; //quakrs: ClockFace
	w.front;
	//({while({w.isClosed.not}, {w.refresh; (1/60).wait})}).fork(AppClock);//***
	w.onClose= {syn0.free; syn1.free; syn2r.free; syn2l.free; syn3.free; syn4.free; /*c.window.close;*/};
	CmdPeriod.doOnce({if(w.isClosed.not, {w.close})});
	};
)
s.meter;
a=1@2;f=1;w=Window().front.drawHook_({900.do{Pen.line(a*200,(a=(a*(f=f+2e-6)).y.cos+1@a.x)*200)};Pen.stroke});AppClock.play{w.refresh;0.01}
//--check the sequence
~f=6
~d=2000
~f=1
~f=2.5
~zz= 2000
~f= 2.8
~f= 0.01
~z= 10000
~d= 10
~d= 200