part of '_widgets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.title,
    required this.price,
    required this.color,
  }) : super(key: key);

  final String title;
  final double price;
  final Color? color;

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
                color: color,
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
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Text(title),
                Text("$price€/kg"),
              ],
            )),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ProductDetailPage(
                      title: '',
                    )),
          );
        },
      ),
    );
  }
}
