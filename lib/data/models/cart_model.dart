part of '_models.dart';

class Cart {
  // On associe le produit avec la quantité
  List<Item?> items;

  Cart({required this.items});

  double getTotalPrice(){
    double sum = 0;
    for (var element in items) {
      sum += (element!.quantity * element.product!.price);
    }
    return sum;
  }

  int getTotalItems(){
    int total = 0;
    for (var element in items) {
      total += element!.quantity.toInt();
    }
    return total;
  }


  Map<String, dynamic> toJson() => _cartToJson(this);

  Cart.fromJson(Map<String, dynamic> json)
      : this(
          items: List<Item?>.from(json["items"].map((x) => Item.fromJson(x))),
        );


  Map<String, dynamic> _cartToJson(Cart instance) => <String, dynamic>{
      "items" : List<dynamic>.from(items.map((x) => x!.toJson())),
      };

}

class Item{
    Product? product;
    double quantity;
    Item({required this.product, required this.quantity});

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        product: Product.fromJson(json["product"]),
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "product": product!.toJson(),
    };



  }