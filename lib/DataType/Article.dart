class Articles {
  String title;
  String description;
  String urlToImage;
  String publishedAt;
  String content;
  String url;

  Articles(this.title, this.description, this.urlToImage, this.publishedAt,
      this.content, this.url);

  Articles.fromJson(Map<String, dynamic> parsedJson) {
    title = parsedJson['title'];
    description = parsedJson['description'];
    urlToImage = parsedJson['urlToImage'];
    publishedAt = parsedJson['publishedAt'];
    content = parsedJson['content'];
    url = parsedJson['url'];
  }
}
