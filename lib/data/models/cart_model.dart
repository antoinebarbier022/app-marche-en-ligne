part of '_models.dart';

class Cart {
  // On associe le produit avec la quantité
  List<Item> items;

  Cart(this.items);

  double getTotalPrice(){
    double sum = 0;
    for (var element in items) {
      sum += (element.quantity * element.product.price);
    }
    return sum;
  }

}

class Item{
    Product product;
    double quantity;
    Item(this.product, this.quantity);
  }