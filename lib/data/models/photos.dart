// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);

import 'dart:convert';

List<Photos> photosFromJson(String str) => List<Photos>.from(json.decode(str).map((x) => Photos.fromJson(x)));

String photosToJson(List<Photos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photos {
  Photos({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  dynamic albumId;
  dynamic id;
  dynamic title;
  dynamic url;
  dynamic thumbnailUrl;

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
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
