class Level0 extends Level {

    Text controls = new Text(STANDARD_FONT, 62, 400, new StringBuilder("Comandi:\n\n- Frecce per muoversi\n- Barra spaziatrice per saltare\n- Shift per correre\n- X per usare il potere fuoco\n\n\nColpisci la bandiera per iniziare!"), color(40, 40, 40), 40);
    Sprite logo;

    Level0() {
        super(overworld_ost);
        reset();
    }

    @Override
    void reset() {
        super.reset();;

        length = 1920;
        cameraSpeed = 5;
        playerInitialPosition = new PVector(500, GAME_HEIGHT - 243);
        tag = "level_0";
        name = "Main Menu";
        id = 0;

        logo = new Sprite(LOGO, new PVector(607, 50));

        platforms.add(ground_17x1(0, 120));

        platforms.add(block(1680, 240, 1, 1));
        powerUps.add(new Flag(1680 + 52, 800 + 240));
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
    }



    @Override
    void draw() {
        super.draw();
        logo.draw();
        controls.draw();
    }
}
