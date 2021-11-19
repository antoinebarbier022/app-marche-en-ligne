part of '../_pages.dart';

class ShoppingListDetailsPage extends StatelessWidget {
  ShoppingListDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  var list = [
    Product("Pomme", 2.4, "Popular", "test"),
    Product("Banane", 5,  "Popular", "test"),
    Product("Cerise", 2.4,  "Popular", "test"),
    Product("Mangue", 2.4,  "Popular", "test"),
    Product("Carotte", 2.4,  "Vegetables", "test"),
    Product("Tomate", 2.4,  "Vegetables", "test"),
    Product("Orange", 2.4,  "Popular", "test")
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
                  physics: const NeverScrollableScrollPhysics(),
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
                        product: list[index]);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
