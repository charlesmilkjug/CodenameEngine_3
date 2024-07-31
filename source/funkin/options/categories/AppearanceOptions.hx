package funkin.options.categories;

class AppearanceOptions extends OptionsScreen {
	public override function new() {
		super("Appearance", "Change Appearance options such as Gameplay Shaders.");
		add(new NumOption(
			"Framerate",
			"Pretty self explanatory, isn't it?",
			30, // minimum
			240, // maximum
			10, // change
			"framerate", // save name or smth
			__changeFPS)); // callback
		add(new Checkbox(
			"Antialiasing",
			"If unchecked, will disable antialiasing on every sprite. Can boost performances at the cost of sharper, crisper sprites.",
			"antialiasing"));
		add(new Checkbox(
			"Colored Healthbar",
			"If unchecked, the health bar colors will be the red and green colors opposed to ones that are customized. Red for opponent and Green for the player.",
			"colorHealthBar"));
		add(new Checkbox(
			"Pixel Perfect Effect",
			"If checked, Week 6 will have a pixel-perfect effect to it enabled, aligning every pixel on the screen.",
			"week6PixelPerfect"));
		add(new Checkbox(
			"Gameplay Shaders",
			"If unchecked, gameplay shaders (visual effects like Thorns's chromatic aberration) won't be loaded; this may be helpful on weak devices.",
			"gameplayShaders"));
		add(new Checkbox(
			"Flashing Lights in Menus",
			"If unchecked, will disable some flashing when you select an option in the Main Menu, and other flashes will be slower.",
			"flashingMenu"));
		add(new Checkbox(
			"Note Splashes",
			"If checked, will play a splashing animation on the strums, every time a note gets hit.",
			"splashesEnabled"));
		add(new Checkbox(
			"Low Memory Mode",
			"If checked, will disable certain background elements in stages to reduce memory usage.",
			"lowMemoryMode"));
		#if sys
		if (!Main.forceGPUOnlyBitmapsOff) {
			add(new Checkbox(
				"VRAM-Only Sprites",
				"If checked, will only store the bitmaps in the GPU, freeing a LOT of memory (EXPERIMENTAL). Turning this off will consume a lot of memory, especially on bigger sprites. If you aren't sure, leave this on.",
				"gpuOnlyBitmaps"));
		}
		#end
		add(new Checkbox(
			"Auto Pause",
			"If checked, switching windows will pause the game.",
			"autoPause"));
		add(new Checkbox(
			"Green Screen Mode",
			"For those green screen vid- oh yeah, those already died out.",
			"greenScreenMode"));
		add(new Checkbox(
			"Use inactive volume",
			"If checked, the games volume will turn down when the window is inactive.",
			"inactiveVolumeEnabled"));
		add(new NumOption(
			"Inactive Volume",
			"Volume percentage the window will change too when the window is inactive.",
			0,
			100,
			2,
			"inactiveVolume",
			null));
	}

	private function __changeFPS(change:Float) {
		// if statement cause of the flixel warning
		if(FlxG.updateFramerate < Std.int(change))
			FlxG.drawFramerate = FlxG.updateFramerate = Std.int(change);
		else
			FlxG.updateFramerate = FlxG.drawFramerate = Std.int(change);
	}
}