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
        BlocBuilder<ShopBloc, ShopState>(
          builder: (context, state) {
            if (state is ShopLoadSuccess) {
              return Badge(
                badgeContent: Text(
                  "${state.cart.items.length}",
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                showBadge: state.cart.items.isNotEmpty,
                badgeColor: Colors.red.shade400,
                shape: BadgeShape.circle,
                position: BadgePosition.topEnd(top: 2, end: 7),
                toAnimate: false,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoppingCartPage(
                                title: '',
                              )),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
              );
            } else {
              return Badge(
                badgeContent: const Text(
                  "0",
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                showBadge: false,
                badgeColor: Colors.red.shade400,
                shape: BadgeShape.circle,
                position: BadgePosition.topEnd(top: 2, end: 7),
                toAnimate: false,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoppingCartPage(
                                title: '',
                              )),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
