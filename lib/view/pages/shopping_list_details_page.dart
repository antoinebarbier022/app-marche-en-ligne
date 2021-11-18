part of '_pages.dart';

class ShoppingListDetailsPage extends StatelessWidget {
  ShoppingListDetailsPage({Key? key, required this.title}) : super(key: key);

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.mode_edit_outline_outlined),
                    label: const Text("Edit"),
                    onPressed: (){},
                    ),
                    ElevatedButton.icon(
                    icon: const Icon(Icons.delete_outline),
                    label: const Text("Remove"),
                    onPressed: (){},
                    )
              ],),
              SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
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
                ),
              ),
            ],
          ),
        ));
  }
}
