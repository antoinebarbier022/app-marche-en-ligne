part of '../_widgets.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product? product;
  final double quantity;

  @override
  // ignore: no_logic_in_create_state
  _CartItemState createState() => _CartItemState(quantity);
}

class _CartItemState extends State<CartItem> {
  double _quantity;
  _CartItemState(this._quantity);

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity <= 0) {
        _quantity = 0;
      } else {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right:15),
      decoration: BoxDecoration(
        color: Colors.white,
          //border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, -4), // changes position of shadow
                ),
              ],
        ),
      
        width: double.infinity,
        height: 130,
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black12, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ImageNetworkProduct(url: widget.product!.urlImage,)
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.product!.name,
                            overflow: TextOverflow.fade,
                                style: const TextStyle(fontSize: 18)),
                            Text("x ${widget.quantity.toInt()}",
                                style: TextStyle(color: Colors.grey[700])),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            radius: 5,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onTap: () {
                              _decrementQuantity();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${_quantity.toInt()}",
                                style: TextStyle(color: Colors.grey[700])),
                          ),
                          InkWell(
                            radius: 5,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.add,
                                  size: 20, color: Colors.white),
                            ),
                            onTap: () {
                              _incrementQuantity();
                            },
                          ),
                          const SizedBox(width: 10),

                          // On affiche le bouton update si la quantité réel est différente de la quantité voulue
                          Visibility(
                            visible: (widget.quantity != _quantity),
                            child: SizedBox(
                              height: 30,
                              child: TextButton(
                                style: _quantity == 0
                                    ? TextButton.styleFrom(
                                        primary: Colors.red.shade400,
                                      )
                                    : null,
                                child: Text(
                                    _quantity == 0 ? "Remove" : "Update",
                                    style: const TextStyle(fontSize: 12)),
                                onPressed: () {
                                  var dataQuantity = _quantity;
                                  setState(() {
                                    _quantity = dataQuantity;
                                  });
                                  if (dataQuantity == 0) {
                                    // On delete l'item
                                    BlocProvider.of<ShopBloc>(context)
                                        .add(ItemDeleted(widget.product));
                                  } else {
                                    BlocProvider.of<ShopBloc>(context).add(
                                        ItemUpdated(Item(
                                            widget.product, dataQuantity)));
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      /*Text("Quantité : ${quantity.toInt()}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),*/
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey[700]),
                  onPressed: () => BlocProvider.of<ShopBloc>(context)
                      .add(ItemDeleted(widget.product)),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 15),
                  child: Text(
                      "${((widget.product!.price) * (_quantity)).toStringAsFixed(2)}€",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ));
  }
}
