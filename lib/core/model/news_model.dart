class NewsArticleModel {
  final String? author;
  final String? title;
  final String? imageUrl;
  final String? newsUrl;
  final String? sourceName;
  final String? publishedAt;

  NewsArticleModel({
    this.author,
    this.title,
    this.imageUrl,
    this.newsUrl,
    this.sourceName,
    this.publishedAt,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      author: json['author'],
      title: json['title'],
      imageUrl: json['urlToImage'],
      newsUrl: json['url'],
      sourceName: json['source']['name'].split(" ").first,
      publishedAt: json['publishedAt'].substring(0, 10),
    );
  }
}
