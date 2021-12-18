part of '_models.dart';

class ShoppingList {
  String idUser;
  String name;
  List<Product?> products;

  ShoppingList({required this.name, required this.products, required this.idUser});

  Map<String, dynamic> toJson() => _shoppingListToJson(this);

  ShoppingList.fromJson(Map<String, dynamic> json)
      : this(
          idUser: json["idUser"] as String,
          name: json["name"] as String,
          products: List<Product?>.from(json["products"].map((x) => Product.fromJson(x))),
        );

  Map<String, dynamic> _shoppingListToJson(ShoppingList instance) =>
      <String, dynamic>{
        "idUser": instance.idUser,
        "name": instance.name,
        "products": List<dynamic>.from(products.map((x) => x!.toJson())),
      };
}
