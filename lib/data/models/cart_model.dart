part of '_models.dart';

class Cart {
  String name;
  // On associe le produit avec la quantité
  Map<Product, String> items;

  Cart(this.name, this.items);
}