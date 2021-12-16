part of '_widgets.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
    required this.title,
    this.search = false,
  }) : super(key: key);

  final String title;
  final bool search;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    return AppBar(
      centerTitle: true,
      title: Text(title),
      automaticallyImplyLeading: true,
      actions: [
        Visibility(
          visible: search,
          child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              }),
        ),
        // On récupère le nombre d'item dans le panier
        DragTarget<Product>(builder: (context, candidateItems, rejectedItems) {
          return BlocBuilder<ShopBloc, ShopState>(
            builder: (context, state) {
              // Si le panier est récupérer alors on affiche le badge avec le nombre d'items présent dans le panier
              if (state is ShopLoadSuccess) {
                return Badge(
                  badgeContent: Text(
                    "${state.cart.getTotalItems()}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: state.cart.getTotalItems() < 10 ? 12 : 9),
                  ),
                  showBadge: state.cart.items.isNotEmpty,
                  badgeColor: Colors.red.shade400,
                  shape: BadgeShape.circle,
                  position: BadgePosition.topEnd(top: 1, end: 5),
                  toAnimate: false,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StreamProvider<UserModel?>.value(
                                  value: AuthService().user,
                                  initialData: null,
                                  child: const ShoppingCartPage(),
                                )),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                );
                // On affiche pas le badge car on a pas encore pu récupérer le nombre d'items dans le panier
              } else {
                return IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StreamProvider<UserModel?>.value(
                                  value: AuthService().user,
                                  initialData: null,
                                  child: const ShoppingCartPage(),
                                )),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                );
              }
            },
          );
          // Lorsque le produuit est au dessus du panier et laché alors il est accepté, et on execute l'action dans le bloc
        }, onAccept: (product) {
          // On rajoute 1 item (si il existe déjà dans le panier au augmente la quantité de 1)
          BlocProvider.of<ShopBloc>(context)
              .add(ItemAdded(idUser : user==null ? "":user.email!, item: Item(product: product, quantity: 1)));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  'Vous avez ajouté le produit : "${product.name}" dans votre panier.')));
        }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class DataSearch extends SearchDelegate<String> {
  final products = ["Apple", "Banana", "Orange"];
  final recentProducts = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final productsBloc = BlocProvider.of<ProductBloc>(context);
    productsBloc.add(GetAllProducts());
    // show hen someone searches for something

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          final suggestionList = query.isEmpty
              ? state.products // Tous les produits sont afficher
              : state.products.where((p) => p!.name.startsWith(query)).toList();

          if (suggestionList.isEmpty) {
            return const Center(child: Text("Aucun résultat."));
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    // On renvoie le résultat
                    //showResults(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StreamProvider<UserModel?>.value(
                                  value: AuthService().user,
                                  initialData: null,
                                  child: ProductDetailPage(
                                product: suggestionList[index],
                              ),
                                )),
                    );
                  },
                  leading: const Icon(Icons.shopping_cart_outlined),
                  title: RichText(
                      text: TextSpan(
                          text: suggestionList[index]!
                              .name
                              .substring(0, query.length),
                          style: TextStyle(
                              color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                          text: suggestionList[index]!
                              .name
                              .substring(query.length),
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        )
                      ]))),
              itemCount: suggestionList.length,
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
