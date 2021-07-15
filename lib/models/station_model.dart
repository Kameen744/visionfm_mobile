class Station {
  int id;
  String title;
  String frequency;
  String location;
  String streamUrl;
  bool playing;

  Station({
    this.id,
    this.title = 'Vision FM',
    this.frequency,
    this.location,
    this.streamUrl,
    this.playing,
  });
}
