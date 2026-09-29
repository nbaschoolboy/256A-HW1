Gain bus => NRev rev => dac;
rev.mix(.3); // set reverb
bus.gain(.3); // set master gain


fun void addFly(Envelope env, float midi)
{
    GSphere fly --> GG.scene(); // create "fireflies"
    .1 => fly.sca; // set scale to .1

    //random flashing positions
    Math.random2f(-2.0, 2.0) => fly.posX;
    Math.random2f(-2.0, 2.0) => fly.posY;
    
    while(true)
    {
        //env.value() * Color.random() => fly.color; //epilepsy mode
        
        env.value() * Color.YELLOW => fly.color; // sync envelope value to color
        env.value() => fly.sca;                // sync envelope value to scale
    
        GG.nextFrame() => now;
    }
}

fun void playNote(float midi, dur note_dur)
{
    TriOsc osc => Envelope env => bus; //osc pathway

    Std.mtof(midi) => osc.freq; //set frequency of first midi note
    note_dur * 1.5 => env.duration; //set envelope duration, 1 or above looks best

    spork ~ addFly(env, midi); //spawn visual

        env.keyOn();            //open the envelope
        note_dur /2 => now;     //wait half the note duration
        
        env.keyOff();           //close the envelope
        note_dur /2 => now;     //wait the other half of the note duration
}

//note sequence, needs array!
//midi notes: low Ab 56, low C 60, low Eb 63, Bb 70, C 72, Eb 75, F 77, high Bb 82, D 86

playNote(70, 0.25::second);
playNote(77, 0.25::second);
playNote(86, 0.25::second);
playNote(70, 0.25::second);
playNote(77, 0.25::second);
playNote(82, 0.5::second);
playNote(75, 0.25::second);
playNote(63, 0.25::second);
playNote(70, 0.25::second);
playNote(77, 0.25::second);
playNote(75, 0.25::second);
playNote(77, 0.25::second);
playNote(82, 0.5::second);
playNote(75, 0.25::second);
playNote(56, 0.25::second);
playNote(63, 0.25::second);
playNote(56, 0.25::second);
playNote(70, 0.25::second);
playNote(56, 0.25::second);
playNote(75, 0.25::second);
playNote(63, 0.25::second);
playNote(56, 0.5::second);
playNote(70, 0.25::second);
playNote(72, 0.25::second);
playNote(70, 0.25::second);
playNote(60, 0.25::second);
playNote(75, 0.25::second);
playNote(77, 0.5::second);

//second sequence

playNote(70, 0.25::second);
playNote(77, 0.25::second);
playNote(86, 0.25::second);
playNote(70, 0.25::second);
playNote(77, 0.25::second);
playNote(82, 0.5::second);
playNote(75, 0.25::second);
playNote(63, 0.25::second);
playNote(70, 0.25::second);
playNote(77, 0.25::second);
playNote(75, 0.25::second);
playNote(80, 0.25::second);
playNote(79, 0.25::second);
playNote(75, 0.25::second);
playNote(70, 0.25::second);
playNote(56, 0.25::second);
playNote(63, 0.25::second);
playNote(72, 0.25::second);
playNote(70, 0.25::second);
playNote(72, 0.25::second);
playNote(75, 0.25::second);
playNote(63, 0.25::second);
playNote(56, 0.5::second);
playNote(70, 0.25::second);
playNote(72, 0.25::second);
playNote(70, 0.25::second);
playNote(60, 0.25::second);
playNote(75, 0.25::second);
playNote(77, 0.25::second);


while(true)
{
    second => now;
}