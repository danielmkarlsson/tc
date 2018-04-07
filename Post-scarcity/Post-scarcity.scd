(
SynthDef("plucksc", {arg amp = 0.1, freq = 440, decay = 5, coef = 0.1, pan = 0.5, accelerate, sustain=1,out;
var env, sound;
env = EnvGen.ar(Env.perc(0.00001, 0.999, 1, -4), timeScale:sustain, doneAction:2);
sound = Pluck.ar(
        in: WhiteNoise.ar(amp),
        trig: Impulse.kr(0),

        maxdelaytime: 2,
        delaytime: freq.reciprocal* Line.kr(1,1+accelerate, sustain),
        decaytime: decay,
        coef: coef);
	OffsetOut.ar(out, DirtPan.ar(sound, ~dirt.numChannels, pan, env));
}).add;
)