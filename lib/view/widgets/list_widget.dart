part of '_widgets.dart';

class CollectionList extends StatelessWidget {
  final String id;
  final String title;
  final Widget link;
  final bool isShopingList;
  final List<Product> listProduct; // liste des produits
  final List<Shopping> listShoppingList; // liste des listes de shopping

  CollectionList(
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
    return Column(
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
                        Container(
                          decoration: ShapeDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: const CircleBorder(),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add_shopping_cart, size: 18),
                            
                    constraints: const BoxConstraints(),
                            color: Colors.white,
                            onPressed: () {},
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
        SizedBox(
          height: 150,
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
                  title: listShoppingList[index].title,
                  color: Theme.of(context).primaryColorLight,
                  nbItem: listShoppingList[index].nbItem,
                );
              } else {
                return ProductItem(
                    title: listProduct[index].name,
                    price: listProduct[index].price,
                    color: listProduct[index].color);
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
    );
  }
}