function update(elapsed:Float) {
    if (FlxG.keys.justPressed.EIGHT) {
		persistentUpdate = false;
		persistentDraw = true;
		paused = true;
        openSubState(new ModSubState("WizDebugMenu"));
    }
}