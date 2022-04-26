// To parse this JSON data, do
//
//     final videoApi = videoApiFromJson(jsonString);

import 'dart:convert';

VideoApi videoApiFromJson(String str) => VideoApi.fromJson(json.decode(str));

String videoApiToJson(VideoApi data) => json.encode(data.toJson());

class VideoApi {
  VideoApi({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory VideoApi.fromJson(Map<String, dynamic> json) => VideoApi(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.video,
    this.relatedProducts,
    this.feedbacks,
  });

  Video video;
  List<Video> relatedProducts;
  List<dynamic> feedbacks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        video: Video.fromJson(json["video"]),
        relatedProducts: List<Video>.from(
            json["related_products"].map((x) => Video.fromJson(x))),
        feedbacks: List<dynamic>.from(json["feedbacks"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "video": video.toJson(),
        "related_products":
            List<dynamic>.from(relatedProducts.map((x) => x.toJson())),
        "feedbacks": List<dynamic>.from(feedbacks.map((x) => x)),
      };
}

class Video {
  Video({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.offerPrice,
    this.preview,
    this.feature,
    this.image,
    this.author,
    this.video,
    this.videoUrl,
    this.type,
  });

  int id;
  String title;
  String slug;
  int price;
  int offerPrice;
  int preview;
  int feature;
  String image;
  String author;
  String video;
  String videoUrl;
  String type;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        price: json["price"],
        offerPrice: json["offer_price"],
        preview: json["preview"],
        feature: json["feature"],
        image: json["image"],
        author: json["author"],
        video: json["video"],
        videoUrl: json["video_url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "price": price,
        "offer_price": offerPrice,
        "preview": preview,
        "feature": feature,
        "image": image,
        "author": author,
        "video": video,
        "video_url": videoUrl,
        "type": type,
      };
}
