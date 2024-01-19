abstract interface class IPlayMusicFunction {
  void shuffle();
  void skipPrevious();
  void playPause();
  void skipNext();
  void repeat();
  void favorite();
  void playlistAdd();
  void fileDownload();
  void seek(double value);
}