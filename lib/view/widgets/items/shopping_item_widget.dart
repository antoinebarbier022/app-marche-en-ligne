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
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: shoppingList.products.isEmpty? null : Image.asset(
                      shoppingList.products[0].urlImage,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: shoppingList.products.length < 2 ? null : Image.asset(
                      shoppingList.products[1].urlImage,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: shoppingList.products.length < 3 ? null : Image.asset(
                      shoppingList.products[2].urlImage,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // Si on a plus de 4 produits, on affiche seulement les 3 premiers produits et le dernier container affiche le nombre de produit en plus dans la liste
                    child: shoppingList.products.length < 5
                        ? (shoppingList.products.length < 4 ? null : Image.asset(
                      shoppingList.products[3].urlImage,
                      fit: BoxFit.scaleDown,
                    ))
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
