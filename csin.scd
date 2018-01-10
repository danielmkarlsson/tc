(
SynthDef(\csin, {|out, sustain=1, pan, accelerate, f |
	var env = EnvGen.ar(Env.perc(0.00001, 0.999, 1, -4), timeScale:sustain, doneAction:2);
	var sound = SinOsc.ar(f * Line.kr(1,1+accelerate, sustain));
	OffsetOut.ar(out, DirtPan.ar(sound, ~dirt.numChannels, pan, env));
}).add
);
