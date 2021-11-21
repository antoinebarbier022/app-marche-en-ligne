part of '_models.dart';

class Cart {
  // On associe le produit avec la quantité
  List<Item> items;

  Cart(this.items);


}

class Item{
    Product product;
    double quantity;
    Item(this.product, this.quantity);
  }