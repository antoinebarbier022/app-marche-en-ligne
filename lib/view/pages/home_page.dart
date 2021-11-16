part of '_pages.dart';

class Product {
  String title;
  double price;
  Color? color;

  Product(this.title, this.price, this.color);
}

class Shopping {
  String title;
  int nbItem;

  Shopping(this.title, this.nbItem);
}

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final list_fruit = [
    Product("pomme", 2.4, Colors.green[100]),
    Product("banane", 5, Colors.yellow[200]),
    Product("cerise", 2.4, Colors.red[200]),
    Product("mangue", 2.4, Colors.yellow[200]),
    Product("orange", 2.4, Colors.orange[200])
  ];

  final list_shopping = [
    Shopping("Evening Shopping list", 4),
    Shopping("Weekend Shopping list", 6),
    Shopping("Favorite product", 9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(
          title: 'Good Market',
        ),
        drawer: const SideBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: const Text("Search Bar"),
                    onPressed: () => print("ok"),
                  ),
                  ElevatedButton(
                    child: const Text("Store Departement"),
                    onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => StoreDepartementPage(
                                title: "Store Departement",
                              )),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              ShoppingList(
                title: "Shopping lists",
                list: list_shopping,
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              ProductList(
                title: "Popular",
                list: list_fruit,
                link: DepartementCategoryPage(title: 'Popular',)
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              ProductList(
                title: "Fruits",
                list: list_fruit,
                link: DepartementCategoryPage(title: 'Fruits',)

              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text("Popular"), Icon(Icons.chevron_right)],
                ),
              ),
              GridView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(color: Colors.red),
                  Container(color: Colors.yellow),
                  Container(color: Colors.blue),
                  Container(color: Colors.green),
                  Container(color: Colors.red),
                  Container(color: Colors.yellow),
                  Container(color: Colors.blue),
                  Container(color: Colors.green),
                  Container(color: Colors.red),
                  Container(color: Colors.yellow),
                  Container(color: Colors.blue),
                  Container(color: Colors.green),
                  Container(color: Colors.red),
                  Container(color: Colors.yellow),
                  Container(color: Colors.blue),
                  Container(color: Colors.green)
                ],
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.5,
                    crossAxisSpacing: 10),
              ),
            ],
          ),
        ));
  }
}
