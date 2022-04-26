// To parse this JSON data, do
//
//     final categoriesApi = categoriesApiFromJson(jsonString);

import 'dart:convert';

CategoriesApi categoriesApiFromJson(String str) => CategoriesApi.fromJson(json.decode(str));

String categoriesApiToJson(CategoriesApi data) => json.encode(data.toJson());

class CategoriesApi {
    CategoriesApi({
        this.status,
        this.data,
    });

    bool status;
    List<Category> data;

    factory CategoriesApi.fromJson(Map<String, dynamic> json) => CategoriesApi(
        status: json["status"],
        data: List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Category {
    Category({
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
    List<Category> childs;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        parentId: json["parent_id"],
        icon: json["icon"],
        image: json["image"],
        status: statusValues.map[json["status"]],
        description: json["description"],
        childs: json["childs"] == null ? null : List<Category>.from(json["childs"].map((x) => Category.fromJson(x))),
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
        "childs": childs == null ? null : List<dynamic>.from(childs.map((x) => x.toJson())),
    };
}

enum Status { ACTIVE }

final statusValues = EnumValues({
    "Active": Status.ACTIVE
});

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
