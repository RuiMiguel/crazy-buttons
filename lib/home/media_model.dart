import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MediaItem {
  String name;
  String media;
  String image;
  String category;

  MediaItem({this.name, this.media, this.image, this.category});

  factory MediaItem.fromJson(Map<String, dynamic> parsedJson) {
    return MediaItem(
        name: parsedJson["name"],
        media: parsedJson["media"],
        image: parsedJson["image"],
        category: parsedJson["category"]);
  }
}
