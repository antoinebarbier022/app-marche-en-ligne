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
    Product("Pomme", 2.4, "Popular", "test"),
    Product("Banane", 5,  "Popular", "test"),
    Product("Cerise", 2.4,  "Popular", "test"),
    Product("Mangue", 2.4,  "Popular", "test"),
    Product("Carotte", 2.4,  "Vegetables", "test"),
    Product("Tomate", 2.4,  "Vegetables", "test"),
    Product("Orange", 2.4,  "Popular", "test")
  ];

  final list_shopping = [
    Shopping("Evening Shopping list", 4),
    Shopping("Weekend Shopping list", 6),
    Shopping("Favorite product", 9),
  ];

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ProductBloc>(context);
    themeBloc.add(GetAllProducts());

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
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductsLoaded) {
                    return CollectionList(
                      id: '',
                      title: "Popular",
                      listProduct: state.products.where((i) => i.price > 3).toList(),
                      link: DepartementCategoryPage(
                        title: 'Popular',
                      ),
                    );
                  } else {
                    return const Center(child: Text("Is Empty."));
                  }
                },
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              CollectionList(
                  id: '',
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
