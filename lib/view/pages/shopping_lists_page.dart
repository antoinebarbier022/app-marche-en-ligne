part of '_pages.dart';

class ShoppingListsPage extends StatelessWidget {
  ShoppingListsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  var list = [
    [
      Product("Pork 100g", 2.4, Colors.green[100]),
      Product("Pork 200b", 5, Colors.yellow[200]),
      Product("Pork 1kg", 2.4, Colors.red[200]),
      Product("Pork 10kg", 2.4, Colors.yellow[200]),
    ],
    [
      Product("Beef 100g", 2.4, Colors.green[100]),
      Product("Beef 200b", 5, Colors.yellow[200]),
      Product("Beef 1kg", 2.4, Colors.red[200]),
      Product("Beef 10kg", 2.4, Colors.yellow[200]),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          title: title,
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              ElevatedButton(
                child: const Text("+ New List"),
                onPressed: () => print("ok"),
              ),
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductList(
                        title: "Category",
                        list: list[index],
                        link: DepartementCategoryPage(
                          title: 'Category',
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 20,
                      thickness: 1,
                    );
                  },
                ),
              ),
            ])));
  }
}
