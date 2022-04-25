import 'package:publication_app/base/base_viewmodel.dart';
import 'package:publication_app/models/homepage_response.dart';
import 'package:publication_app/utils/database_services.dart';
import 'dart:convert';

class CartViewModel extends BaseViewModel {
  //
  List<CartItem> cartItems = [];
  CartService _cartService = CartService();
  Future<void> getCartItems() async {
    //
    var results = await _cartService.getFromDB();
    cartItems.addAll(results);
    notifyListeners();
  }

  Future<void> removeItemFromCart(int id, {int index}) async {
    cartItems.removeAt(index);
    await _cartService.deleteFromDB(id);
    notifyListeners();
  }

  Future<void> updateCart(dynamic item) async {
    //
    var cartItem = CartItem(
      id: item.id,
      image: item.image,
      name: item.title,
      author: item is Packages ? "" : item.author,
      price: item.price,
      type: item is Books
          ? "Book"
          : item is Video
              ? "Video"
              : "Package",
      quantity: 1,
    );

    bool cartContainsItem = await _cartService.queryItemDB(item.id);
    print(cartContainsItem);
    if (cartContainsItem)
      print("already on cart");
    //  await _cartService.
    else {
      await _cartService.addToDB(cartItem);
      // print("added");
    }
  }

  Future<void> addToCart(dynamic item) async {
    //
    var cartItem = CartItem(
      id: item.id,
      image: item.image,
      name: item.title,
      author: item is Books ? "" : item.author,
      price: item.price,
      type: item is Books
          ? "Book"
          : item is Video
              ? "Video"
              : "Package",
      quantity: 1,
    );

    bool cartContainsItem = await _cartService.queryItemDB(item.id);
    print(cartContainsItem);
    if (cartContainsItem)
      print("already on cart");
    //  await _cartService.
    else {
      await _cartService.addToDB(cartItem);
      // print("added");
    }
  }
}

CartItem cartItemFromMap(String str) => CartItem.fromMap(json.decode(str));

String cartItemToMap(CartItem data) => json.encode(data.toMap());

class CartItem {
  CartItem({
    this.id,
    this.name,
    this.type,
    this.author,
    this.price,
    this.image,
    this.quantity,
  });
  final String type;
  final int id;
  final String name;
  final String author;
  final dynamic price;
  final String image;
  dynamic quantity;

  CartItem copyWith({
    int id,
    String type,
    String name,
    String author,
    dynamic price,
    String image,
    dynamic quantity,
  }) =>
      CartItem(
        id: id ?? this.id,
        type: type ?? this.type,
        name: name ?? this.name,
        author: author ?? this.author,
        price: price ?? this.price,
        image: image ?? this.image,
        quantity: quantity ?? this.quantity,
      );

  factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        author: json["author"] == null ? null : json["author"],
        price: json["price"] == null ? null : json["price"],
        image: json["image"] == null ? null : json["image"],
        quantity: json["quantity"] == null ? null : json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "name": name == null ? null : name,
        "author": author == null ? null : author,
        "price": price == null ? null : price,
        "image": image == null ? null : image,
        "quantity": quantity == null ? null : quantity,
      };
}
