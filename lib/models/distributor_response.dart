// To parse this JSON data, do
//
//     final distributorResponse = distributorResponseFromMap(jsonString);

import 'dart:convert';

DistributorResponse distributorResponseFromMap(String str) =>
    DistributorResponse.fromMap(json.decode(str));

String distributorResponseToMap(DistributorResponse data) =>
    json.encode(data.toMap());

class DistributorResponse {
  DistributorResponse({
    this.data,
    this.success,
  });

  final List<DistributorData> data;
  final bool success;

  DistributorResponse copyWith({
    List<DistributorData> data,
    bool success,
  }) =>
      DistributorResponse(
        data: data ?? this.data,
        success: success ?? this.success,
      );

  factory DistributorResponse.fromMap(Map<String, dynamic> json) =>
      DistributorResponse(
        data: json["data"] == null
            ? null
            : List<DistributorData>.from(
                json["data"].map((x) => DistributorData.fromMap(x))),
        success: json["success"] == null ? null : json["success"],
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
        "success": success == null ? null : success,
      };
}

class DistributorData {
  DistributorData({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.address,
    this.contactPerson,
    this.phoneNumber,
    this.books,
  });

  final int id;
  final String name;
  final String slug;
  final String image;
  final String address;
  final String contactPerson;
  final String phoneNumber;
  final List<dynamic> books;

  DistributorData copyWith({
    int id,
    String name,
    String slug,
    String image,
    String address,
    String contactPerson,
    String phoneNumber,
    List<dynamic> books,
  }) =>
      DistributorData(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        image: image ?? this.image,
        address: address ?? this.address,
        contactPerson: contactPerson ?? this.contactPerson,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        books: books ?? this.books,
      );

  factory DistributorData.fromMap(Map<String, dynamic> json) => DistributorData(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        image: json["image"] == null ? null : json["image"],
        address: json["address"] == null ? null : json["address"],
        contactPerson:
            json["contact_person"] == null ? null : json["contact_person"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        books: json["books"] == null
            ? null
            : List<dynamic>.from(json["books"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "image": image == null ? null : image,
        "address": address == null ? null : address,
        "contact_person": contactPerson == null ? null : contactPerson,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "books": books == null ? null : List<dynamic>.from(books.map((x) => x)),
      };
}
