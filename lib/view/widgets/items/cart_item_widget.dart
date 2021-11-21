part of '../_widgets.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  final double quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        padding: const EdgeInsets.all(10.0),
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
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
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
                            Text(product.name, style: const TextStyle(fontSize: 18)),
                            Text("1 lb",
                                style: TextStyle(color: Colors.grey[700])),
                          ]),
                      Text("${product.price}€",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                    
                  ),
                ),
                
              ],
              
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => BlocProvider.of<ShopBloc>(context).add(ItemDeleted(product)),
            )
          ],
        ));
  }
}
