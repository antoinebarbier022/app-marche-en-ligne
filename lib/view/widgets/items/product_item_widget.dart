part of '../_widgets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<Product>(
      data: product,
      dragAnchorStrategy:
          pointerDragAnchorStrategy, // Permet d'avoir l'élement positionné sur la souris (en haut à gauche)
      feedback: DragingItem(urlImage : product!.urlImage),
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
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,//Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset:
                              const Offset(5, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ImageNetworkProduct(url: product!.urlImage,)
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  product!.name,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${product!.price.toStringAsPrecision(3)}€/kg",
                  style: TextStyle(color: Theme.of(context).hintColor),
                ),
              ],
            )),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StreamProvider<UserModel?>.value(
                                  value: AuthService().user,
                                  initialData: null,
                                  child: ProductDetailPage(
                      product: product,
                    )
                                )),
          );
        },
      ),
    );
  }
}

class DragingItem extends StatelessWidget {
  const DragingItem({
    Key? key, required this.urlImage,
  }) : super(key: key);

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation:
          const Offset(-0.5, -0.5), // Permet de centrer l'element sur la souris
      child: SizedBox(
        width: 50,
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ImageNetworkProduct(url: urlImage,),
          ),
        ),
      ),
    );
  }
}
