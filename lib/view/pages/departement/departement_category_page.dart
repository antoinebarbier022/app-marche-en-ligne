part of '../_pages.dart';

class DepartementCategoryPage extends StatelessWidget {
  DepartementCategoryPage({Key? key, required this.title}) : super(key: key);

  final String title;

  var list = [
    Product("Pork 100g", 2.4, Colors.green[100]),
    Product("Pork 200b", 5, Colors.yellow[200]),
    Product("Pork 1kg", 2.4, Colors.red[200]),
    Product("Pork 10kg", 2.4, Colors.yellow[200]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          title: title,
        ),
        body: GridView.builder(
          itemCount: list.length,
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return ProductItem(
                title: list[index].name, 
                price: list[index].price,
                color: list[index].color);
          },
        ));
  }
}
