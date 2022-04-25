// To parse this JSON data, do
//
//     final homepageResponse = homepageResponseFromJson(jsonString);

import 'dart:convert';

HomepageResponse homepageResponseFromJson(String str) =>
    HomepageResponse.fromJson(json.decode(str));

String homepageResponseToJson(HomepageResponse data) =>
    json.encode(data.toJson());

class HomepageResponse {
  HomepageResponse({
    this.status,
    this.data,
  });

  bool status;
  HomepageData data;

  factory HomepageResponse.fromJson(Map<String, dynamic> json) =>
      HomepageResponse(
        status: json["status"],
        data: HomepageData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class HomepageData {
  HomepageData({
    this.banner,
    this.extraBanners,
    this.books,
    this.video,
    this.packages,
  });

  List<Banners> banner;
  List<Banners> extraBanners;
  Books books;
  Video video;
  Packages packages;

  factory HomepageData.fromJson(Map<String, dynamic> json) => HomepageData(
        banner:
            List<Banners>.from(json["banner"].map((x) => Banners.fromJson(x))),
        extraBanners: List<Banners>.from(
            json["extra_banners"].map((x) => Banners.fromJson(x))),
        books: Books.fromJson(json["books"]),
        video: Video.fromJson(json["video"]),
        packages: Packages.fromJson(json["packages"]),
      );

  Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
        "extra_banners":
            List<dynamic>.from(extraBanners.map((x) => x.toJson())),
        "books": books.toJson(),
        "video": video.toJson(),
        "packages": packages.toJson(),
      };
}

class Banners {
  Banners({
    this.id,
    this.name,
    this.image,
  });

  int id;
  String name;
  String image;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

class Books {
  Books({
    this.heading,
    this.data,
  });

  String heading;
  List<BooksDatum> data;

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        heading: json["heading"],
        data: List<BooksDatum>.from(
            json["data"].map((x) => BooksDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BooksDatum {
  BooksDatum({
    this.id,
    this.title,
    this.slug,
    this.book,
    this.image,
    this.price,
    this.offerPrice,
    this.author,
    this.isbnNo,
    this.edition,
    this.language,
    this.rating,
    this.description,
    this.tableOfContent,
    this.digitalOrHardcopy,
    this.type,
  });

  int id;
  String title;
  String slug;
  String book;
  String image;
  int price;
  dynamic offerPrice;
  String author;
  String isbnNo;
  String edition;
  String language;
  int rating;
  String description;
  String tableOfContent;
  String digitalOrHardcopy;
  String type;

  factory BooksDatum.fromJson(Map<String, dynamic> json) => BooksDatum(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        book: json["book"],
        image: json["image"],
        price: json["price"],
        offerPrice: json["offer_price"],
        author: json["author"],
        isbnNo: json["isbn_no"] == null ? null : json["isbn_no"],
        edition: json["edition"],
        language: json["language"],
        rating: json["rating"],
        description: json["description"] == null ? null : json["description"],
        tableOfContent:
            json["table_of_content"] == null ? null : json["table_of_content"],
        digitalOrHardcopy: json["digital_or_hardcopy"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "book": book,
        "image": image,
        "price": price,
        "offer_price": offerPrice,
        "author": author,
        "isbn_no": isbnNo == null ? null : isbnNo,
        "edition": edition,
        "language": language,
        "rating": rating,
        "description": description == null ? null : description,
        "table_of_content": tableOfContent == null ? null : tableOfContent,
        "digital_or_hardcopy": digitalOrHardcopy,
        "type": type,
      };
}

class Packages {
  Packages({
    this.heading,
    this.data,
  });

  String heading;
  List<PackagesDatum> data;

  factory Packages.fromJson(Map<String, dynamic> json) => Packages(
        heading: json["heading"],
        data: List<PackagesDatum>.from(
            json["data"].map((x) => PackagesDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PackagesDatum {
  PackagesDatum({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.offerPrice,
    this.image,
    this.packageType,
    this.description,
    this.rating,
    this.type,
  });

  int id;
  String title;
  String slug;
  int price;
  int offerPrice;
  String image;
  String packageType;
  String description;
  int rating;
  String type;

  factory PackagesDatum.fromJson(Map<String, dynamic> json) => PackagesDatum(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        price: json["price"],
        offerPrice: json["offer_price"],
        image: json["image"],
        packageType: json["package_type"],
        description: json["description"],
        rating: json["rating"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "price": price,
        "offer_price": offerPrice,
        "image": image,
        "package_type": packageType,
        "description": description,
        "rating": rating,
        "type": type,
      };
}

class Video {
  Video({
    this.heading,
    this.data,
  });

  String heading;
  List<VideoDatum> data;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        heading: json["heading"],
        data: List<VideoDatum>.from(
            json["data"].map((x) => VideoDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class VideoDatum {
  VideoDatum({
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

  factory VideoDatum.fromJson(Map<String, dynamic> json) => VideoDatum(
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
