part of '../_widgets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      dragAnchorStrategy:
          pointerDragAnchorStrategy, // Permet d'avoir l'élement positionné sur la souris (en haut à gauche)
      feedback: FractionalTranslation(
        translation: const Offset(
            -0.5, -0.5), // Permet de centrer l'element sur la souris
        child: Container(
          width: 50,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            width: 110,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(5, 10), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(product.name),
                Text(
                  "${product.price}€/kg",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            )),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                      product: product,
                    )),
          );
        },
      ),
    );
  }
}
