part of '_widgets.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Drawer(
        child: Material(
          color: Theme.of(context).primaryColorDark,
          child: ListView(
            padding: const EdgeInsets.only(top: 70.0),
            children: ListTile.divideTiles(context: context, tiles: [
              buildMenuItem(
                  text: "Store",
                  icon: Icons.store,
                  context: context,
                  link: const HomePage(
                    title: 'Home',
                  )),
              buildMenuItem(
                  text: "Shopping Cart",
                  icon: Icons.shopping_cart,
                  context: context,
                  isShoppingCart: true,
                  link: const ShoppingCartPage()),
              buildMenuItem(
                  text: "Shopping List",
                  icon: Icons.list,
                  context: context,
                  link: const ShoppingListsPage(
                    title: 'Shopping Lists',
                  )),
              buildMenuItem(
                  text: "Recipes",
                  icon: Icons.menu_book,
                  context: context,
                  link: const BuildingPage()),
              buildMenuItem(
                  text: "Order History",
                  icon: Icons.history,
                  context: context,
                  link: const BuildingPage()),
              buildMenuItem(
                  text: "Login",
                  icon: Icons.login,
                  context: context,
                  link: const BuildingPage()),
              buildMenuItem(
                  text: "Help",
                  icon: Icons.help_center,
                  context: context,
                  link: const BuildingPage()),
              buildMenuItem(
                  text: "About",
                  icon: Icons.info,
                  context: context,
                  link: const BuildingPage()),
            ]).toList(),
          ),
        ),
      ),
    );
  }
}

Widget buildMenuItem(
    {required String text,
    required IconData icon,
    bool isShoppingCart = false,
    required BuildContext context,
    required Widget link}) {
  return ListTile(
    leading: Icon(icon, color: Colors.white),
    title: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    trailing: Visibility(
      visible: isShoppingCart,
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          if (state is ShopLoadSuccess) {
            return Container(
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text("${state.cart.getTotalItems()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            );
          } else {
            return Container();
          }
        },
      ),
    ),
    onTap: () {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => link),
      );
    },
  );
}
