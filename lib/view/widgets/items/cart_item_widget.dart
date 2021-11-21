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
        width: double.infinity,
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
                            Text(product.name,
                                style: const TextStyle(fontSize: 18)),
                            Text("x ${quantity.toInt()}",
                                style: TextStyle(color: Colors.grey[700])),
                            
                          ]),
                          Row(
                              children: [
                                InkWell(
                                  radius: 5,
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:  Icon(Icons.remove, size: 20, color: Theme.of(context).primaryColor,),
                                  ),onTap: (){

                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("1",
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
                                    child: const Icon(Icons.add, size: 20, color: Colors.white),
                                  ),onTap: (){

                                  },
                                )
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey[700]),
                  onPressed: () => BlocProvider.of<ShopBloc>(context)
                      .add(ItemDeleted(product)),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text("${product.price}€",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ));
  }
}
