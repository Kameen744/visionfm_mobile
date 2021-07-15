class Video {
  String id;
  String title;
  String thumbnailUrl;
  String channelTitle;
  String publishedAt;

  Video.fromJson(Map<String, dynamic> snippet)
      : id = snippet['id']['videoId'],
        title = snippet['snippet']['title'],
        thumbnailUrl = snippet['snippet']['thumbnails']['medium']['url'],
        channelTitle = snippet['snippet']['channelTitle'],
        publishedAt = snippet['snippet']['publishedAt'];
}
