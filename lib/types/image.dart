// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

import 'dart:convert';

List<Image> imageFromJson(String str) => List<Image>.from(json.decode(str).map((x) => Image.fromJson(x)));

String imageToJson(List<Image> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Image {
    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    Image({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}

