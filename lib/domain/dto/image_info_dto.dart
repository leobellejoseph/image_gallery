class ImageInfoDto {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadUrl;
  const ImageInfoDto({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });
  factory ImageInfoDto.fromJson(Map<String, dynamic> json) => ImageInfoDto(
        id: json['id'],
        author: json['author'],
        width: json['width'] as int,
        height: json['height'] as int,
        url: json['url'],
        downloadUrl: json['download_url'],
      );
}
