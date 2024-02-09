class Level0 extends Level {

    Text controls = new Text(
        STANDARD_FONT, 
        62, 
        400, 
        new StringBuilder(
            "Controls:\n" +
            "\n" +
            "- Press the arrows to move\n" +
            "- Press the spacebar to jump\n" +
            "- Press Shift to run\n" +
            "- Press x to use fire balls\n" +
            "- Press p to pause\n" +
            "\n" +
            "Hit the flag to start!"), 
        color(40, 40, 40), 
        40
    );

    Sprite logo;

    Level0() {
        super(overworld_ost);
        reset();
    }

    @Override
    void reset() {
        super.reset();;
        backgroundColor = BACKGROUND_1;
        length = 1920;
        cameraSpeed = 5;
        playerInitialPosition = new PVector(500, GAME_HEIGHT - 243);
        tag = "level_0";
        name = "Start Level";
        id = 0;

        logo = new Sprite(LOGO, new PVector(607, 50));

        platforms.add(ground(0, 120, 17, 1));

        powerUps.add(new Flag(1680 + 52, 680 + 240));
        platforms.add(block(1680, 240, 1, 1));
        
    }

    @Override
    void drawHud() {
    }

    @Override
    void finished() {
        isFinished = true;
        music.stop();
        lets_a_go_effect.play();
        newLevelAnimationLevelTimeDuration.elapsed = 350;
        updateNextLevelName();
    }



    @Override
    void draw() {
        super.draw();
        logo.draw();
        controls.draw();
    }
}
