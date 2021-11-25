part of '../_widgets.dart';

class ShoppingItem extends StatelessWidget {
  ShoppingItem({
    Key? key,
    required this.shoppingList,
  }) : super(key: key);

  final ShoppingList shoppingList; // titre de la categorie

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          width: 110,
          padding: const EdgeInsets.all(10.0),
          //color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: shoppingList.products.isEmpty
                        ? null
                        : ImageNetworkProduct(
                              url: shoppingList.products[0].urlImage),
                  ),
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: shoppingList.products.length < 2
                          ? null
                          : ImageNetworkProduct(
                              url: shoppingList.products[1].urlImage)),
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: shoppingList.products.length < 3
                          ? null
                          : ImageNetworkProduct(
                              url: shoppingList.products[2].urlImage,
                            )),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // Si on a plus de 4 produits, on affiche seulement les 3 premiers produits et le dernier container affiche le nombre de produit en plus dans la liste
                    child: shoppingList.products.length < 5
                        ? (shoppingList.products.length < 4
                            ? null
                            : ImageNetworkProduct(
                              url: shoppingList.products[3].urlImage))
                        : Center(
                            child: Text(
                            "+${shoppingList.products.length - 3}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontWeight: FontWeight.bold),
                          )),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(shoppingList.name),
            ],
          )),
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => ShoppingListDetailsPage(
                    shoppingList: shoppingList,
                  )),
        );
      },
    );
  }
}
