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
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                  Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                  Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                  Container(
                    
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text("+${shoppingList.products.length}", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), )),
                ),
                ],
              ),
              const SizedBox(
                height:5,
              ),
              Text(shoppingList.name),
            ],
          )),
      onTap: (){
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
