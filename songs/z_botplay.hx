// my reasoning for coding it like this is bc
// in the case that the engine uses onDadHit / onPlayerHit, i still want onPlayerHit to be properly called for players
// that's why i'm not simply setting the player to cpu

public var curBotplay:Bool = false;

function update(elapsed:Float) {
    if (FlxG.keys.justPressed.SIX)
        curBotplay = !curBotplay;

    if (!curBotplay)
        return;
    
    for (i in playerStrums.members)
        if (i.animation.finished && i.getAnim() == "confirm")
            i.playAnim("static");

    for (note in playerStrums.notes) {
        if (Conductor.songPosition >= note.strumTime) { // TODO: maybe check if the note is meant to be pressed
            playerStrums.members[note.noteData].press();
            goodNoteHit(playerStrums, note);
        }
    }
}

function onInputUpdate(event:InputSystemEvent) {
    if (curBotplay)
        event.cancel();
}

function onPlayerHit(e) {
    if (!curBotplay)
        return;

    e.score = 300;
    e.countScore = true;
    e.accuracy = 1;
    e.countAsCombo = true;
    e.showRating = true;
    e.note.strumLine.addHealth(0.023);
    e.showSplash = !e.note.isSustainNote;
}