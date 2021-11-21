part of '_widgets.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      automaticallyImplyLeading: true,
      actions: [
        // On récupère le nombre d'item dans le panier
        DragTarget<Product>(
          builder: (context, candidateItems, rejectedItems){
          return BlocBuilder<ShopBloc, ShopState>(
            builder: (context, state) {
              // Si le panier est récupérer alors on affiche le badge avec le nombre d'items présent dans le panier
              if (state is ShopLoadSuccess) {
                return Badge(
                  badgeContent: Text(
                    "${state.cart.getTotalItems()}",
                    style:  TextStyle(color: Colors.white, fontSize: state.cart.getTotalItems() < 10 ? 12 : 9),
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
                            builder: (context) => const ShoppingCartPage()),
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
                          builder: (context) => const ShoppingCartPage()),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                );
              }
            },
          );
          // Lorsque le produuit est au dessus du panier et laché alors il est accepté, et on execute l'action dans le bloc
          }, onAccept: (product){
            BlocProvider.of<ShopBloc>(context).add(
                                ItemAdded(Item(product, 1)));
          }
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
