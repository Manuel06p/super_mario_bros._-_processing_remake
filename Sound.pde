/**
 * Class used to manage Sound.
 */
class Sound {
  
  SoundFile sound;

  /**
   * Create a new Sound object.
   * - parent: parent component of sound.
   * - path: path of the sound resource.
   */
  Sound(PApplet parent, String path) {
    sound = new SoundFile(parent, path);
  }
  //

  /**
   * Create a new Sound object.
   * - parent: parent component of Sound.
   * - path: path of the Sound resource.
   * - volume: volume (0.0 - 1.0).
   */
  Sound(PApplet parent, String path, float volume) {
    this(parent, path);
    volume(volume);
  }
  //

  /**
   * Start playing the Sound.
   */
  void play() {
    sound.play();
  }
  //
  
  /**
   * Start playing the Sound in loop.
   */
  void loop() {
    sound.loop();
  }
  //
  
  /**
   * Pause the Sound.
   */
  void pause() {
    sound.pause();
  }
  //

  /**
   * Stop the Sound.
   */
  void stop() {
    sound.stop();
  }
  //
  
  /**
   * Set the volume of the Sound.
   * - value: volume (0.0 - 1.0).
   */
  void volume(float value) {
    sound.amp(value);
  }
  //

  /**
   * Check if the Sound is playing.
   * - return true if the Sound is playing, false otherwise.
   */
  boolean isPlaying() {
    return sound.isPlaying();
  }
  //

}
//