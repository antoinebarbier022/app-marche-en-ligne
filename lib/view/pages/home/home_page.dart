part of '../_pages.dart';


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
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: CupertinoSearchTextField(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: const Text("Store Departements"),
                    onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => StoreDepartementPage(
                                title: "Store Departements",
                              )),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              CollectionList(
                  id: '', 
                  title: "Shopping List",
                  listShoppingList: list_shopping,
                  link: ShoppingListsPage(
                    title: 'Shopping lists',
                  ), ),
              
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              CollectionList(
                  id: '', 
                  title: "Popular",
                  listProduct: list_fruit,
                  link: DepartementCategoryPage(
                    title: 'Popular',
                  ), ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              CollectionList(
                  id:'',
                  title: "Fruits",
                  listProduct: list_fruit,
                  link: DepartementCategoryPage(
                    title: 'Fruits',
                  )),
            ],
          ),
        ));
  }
}
