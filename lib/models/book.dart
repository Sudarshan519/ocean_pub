// To parse this JSON data, do
//
//     final bookApi = bookApiFromJson(jsonString);

import 'dart:convert';

BookApi bookApiFromJson(String str) => BookApi.fromJson(json.decode(str));

String bookApiToJson(BookApi data) => json.encode(data.toJson());

class BookApi {
  BookApi({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory BookApi.fromJson(Map<String, dynamic> json) => BookApi(
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
    this.book,
    this.relatedProducts,
    this.childCategory,
    this.feedbacks,
  });

  Book book;
  List<Book> relatedProducts;
  Child childCategory;
  List<dynamic> feedbacks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        book: Book.fromJson(json["book"]),
        relatedProducts: List<Book>.from(
            json["related_products"].map((x) => Book.fromJson(x))),
        childCategory: Child.fromJson(json["child_category"]),
        feedbacks: List<dynamic>.from(json["feedbacks"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "book": book.toJson(),
        "related_products":
            List<dynamic>.from(relatedProducts.map((x) => x.toJson())),
        "child_category": childCategory.toJson(),
        "feedbacks": List<dynamic>.from(feedbacks.map((x) => x)),
      };
}

class Book {
  Book({
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
  dynamic isbnNo;
  String edition;
  String language;
  int rating;
  dynamic description;
  dynamic tableOfContent;
  String digitalOrHardcopy;
  String type;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        book: json["book"],
        image: json["image"],
        price: json["price"],
        offerPrice: json["offer_price"] == null ? "" : json["offer_price"],
        author: json["author"],
        isbnNo: json["isbn_no"],
        edition: json["edition"],
        language: json["language"],
        rating: json["rating"],
        description: json["description"],
        tableOfContent: json["table_of_content"],
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
        "isbn_no": isbnNo,
        "edition": edition,
        "language": language,
        "rating": rating,
        "description": description,
        "table_of_content": tableOfContent,
        "digital_or_hardcopy": digitalOrHardcopy,
        "type": type,
      };
}

class Child {
  Child({
    this.id,
    this.title,
    this.slug,
    this.parentId,
    this.icon,
    this.image,
    this.status,
    this.description,
    this.childs,
  });

  int id;
  String title;
  String slug;
  int parentId;
  dynamic icon;
  String image;
  Status status;
  dynamic description;
  List<Child> childs;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        parentId: json["parent_id"],
        icon: json["icon"],
        image: json["image"],
        status: statusValues.map[json["status"]],
        description: json["description"],
        childs: List<Child>.from(json["childs"].map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "parent_id": parentId,
        "icon": icon,
        "image": image,
        "status": statusValues.reverse[status],
        "description": description,
        "childs": List<dynamic>.from(childs.map((x) => x.toJson())),
      };
}

enum Status { ACTIVE }

final statusValues = EnumValues({"Active": Status.ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
