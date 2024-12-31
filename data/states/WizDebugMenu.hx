import funkin.editors.charter.Charter;
import funkin.editors.character.CharacterEditor;

var cam:FlxCamera;

var name:FlxText = new FlxText(0, 0, FlxG.width, "Debug Menu Wow", 48);
var setSongPosTxt:FlxText = new FlxText(200, 200, 0, "set song pos", 32);
var openCharterTxt:FlxText = new FlxText(0, 300, FlxG.width, "open charter", 32);
var editOpponentTxt:FlxText = new FlxText(200, 500, 0, "edit opponent", 32); // TODO: maybe a drop down of all the characters in the game?
var editStageTxt:FlxText = new FlxText(550, 500, FlxG.width, "edit stage", 32);
var editPlayerTxt:FlxText = new FlxText(800, 500, 0, "edit player", 32);

function create() {
    cam = new FlxCamera();
    cam.bgColor = 0x80000000;
    FlxG.cameras.add(cam, false);

    name.alignment = "center";
    openCharterTxt.alignment = "center";

    for (obj in [name, setSongPosTxt, openCharterTxt, editOpponentTxt, editStageTxt, editPlayerTxt]) {
        obj.cameras = [cam];
        add(obj);
    }
}

var selectedColor:Int = 0xff4f4f94;
function update(elapsed:Float) {
    
    for (txt in [setSongPosTxt, openCharterTxt, editOpponentTxt, editStageTxt, editPlayerTxt]) {
        txt.updateHitbox();
        txt.color = FlxG.mouse.overlaps(txt) ? selectedColor : 0xffffffff;
        if (txt.color == selectedColor && FlxG.mouse.justPressed) {
            switch (txt) {
                case setSongPosTxt: trace('i need to make the bar on the right of this first');
                case openCharterTxt:
                    FlxG.switchState(new Charter(PlayState.instance.SONG.meta.name, difficulty, false));
                    trace('i need to add the drop down to select difficulties, for now it\'s just the current difficulty');
                case editOpponentTxt:
                    FlxG.switchState(new CharacterEditor(PlayState.instance.cpuStrums.characters[0].curCharacter));
                    trace('maybe a dropdown of all the chars in game?');
                case editPlayerTxt:
                    FlxG.switchState(new CharacterEditor(PlayState.instance.playerStrums.characters[0].curCharacter));
                    trace('maybe a dropdown of all the chars in game?');
                case editStageTxt:
                    trace('heh, not so quick you scallywag!');
            }
        }
    }

    if (controls.BACK) {
        FlxG.cameras.remove(cam);
        // TODO: destroy script
        close();
    }
}