public var curSpeed:Float = 1;

function update() {
    if (FlxG.keys.justPressed.TWO) curSpeed -= 0.1;
    if (FlxG.keys.justPressed.THREE) curSpeed = 1;
    if (FlxG.keys.justPressed.FOUR) curSpeed += 0.1;
    curSpeed = FlxMath.bound(curSpeed, 0.1, 2);
    
    updateSpeed(FlxG.keys.pressed.FIVE ? 20 : curSpeed);
}

function updateSpeed(speed:Float)
    FlxG.timeScale = inst.pitch = vocals.pitch = speed;

function onGamePause()
    updateSpeed(1);
function onSongEnd()
    updateSpeed(1);

function destroy() {
    FlxG.timeScale = 1;
    FlxG.sound.muted = false;
}