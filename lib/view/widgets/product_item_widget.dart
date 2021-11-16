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
    return InkWell(
      child: Container(
          width: 110,
          padding: const EdgeInsets.all(10.0),
          //color: Colors.grey[200],
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
    );
  }
}
