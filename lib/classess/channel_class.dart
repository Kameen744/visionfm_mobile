class Channel {
  int id;
  String title;
  String profilePictureUrl;
  int subscriberCount;
  int videoCount;
  int uploadPlaylistId;
  List videos;

  Channel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['snippet']['title'],
        profilePictureUrl = map['snippet']['thumbnails']['default']['url'],
        subscriberCount = map['statistics']['subscriberCount'],
        videoCount = map['statistics']['videoCount'],
        uploadPlaylistId = map['contentDetails']['relatedPlaylists']['uploads'];
}
