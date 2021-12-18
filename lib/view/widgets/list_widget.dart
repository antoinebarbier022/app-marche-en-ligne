part of '_widgets.dart';

class CollectionList extends StatelessWidget {
  final String id;
  final String title;
  final Widget link;
  final bool isShopingList;
  final List<Product?> listProduct; // liste des produits
  final List<ShoppingList?> listShoppingList; // liste des listes de shopping

  const CollectionList(
      {Key? key,
      required this.id,
      required this.title,
      required this.link,
      this.isShopingList = false,
      this.listProduct = const [],
      this.listShoppingList = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 40,
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // titre de la catégorie
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    // alors on est sur une liste de produit dans shopping liste
                    Visibility(
                      child: Row(
                        children: [
                          //on affiche l'icon d'ajout de la liste dans le panier si il y a des produits
                          Visibility(
                            visible: listProduct.isNotEmpty,
                            child: Container(
                              decoration: ShapeDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: const CircleBorder(),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.add_shopping_cart,
                                    size: 18),
                                constraints: const BoxConstraints(),
                                color: Colors.white,
                                onPressed: () {
                                  // On ajoute la liste de produits dans le panier
                                  for (var product in listProduct) {
                                    BlocProvider.of<ShopBloc>(context).add(
                                        ItemAdded(item: Item(
                                            product: product, quantity: 1)));
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Vous avez ajouté la liste "$title" dans votre panier.')));
                                },
                              ),
                            ),
                          ),
                          TextButton(
                            child: Text("${listProduct.length} items"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (context) => link),
                              );
                            },
                          ),
                        ],
                      ),
                      visible: isShopingList,
                    ),

                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => link),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            // si on affiche les produits d'une shopping liste mais qu'il n'y en a pas, alors on diminue la hauteur de l'affichage des items (car il n'y en a pas). On souhaite tout de même laisser afficher le titre de la shopping list
            height: (isShopingList && listProduct.isEmpty) ? 0 : 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              // Let the ListView know how many items it needs to build.
              itemCount: listShoppingList.isEmpty
                  ? listProduct.length
                  : listShoppingList.length,

              // Provide a builder function. This is where the magic happens.
              // Convert each item into a widget based on the type of item it is.
              itemBuilder: (context, index) {
                if (listShoppingList.isNotEmpty) {
                  return ShoppingItem(
                    shoppingList: listShoppingList[index]!,
                  );
                } else {
                  return ProductItem(product: listProduct[index]);
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                    //width: 10,
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
