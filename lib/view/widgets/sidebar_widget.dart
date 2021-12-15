part of '_widgets.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    return SizedBox(
      width: 250,
      child: Drawer(
        child: Material(
            color: Theme.of(context).primaryColorDark,
            child: Column(
              children: [
                Visibility(
                  visible: (user != null),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(user == null ? "" : user.uid),
                  ),
                ),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 60.0),
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
                        text: user == null ? "Login" : "Logout",
                        icon: user == null ? Icons.login : Icons.logout,
                        context: context,
                        itemIslogOut: user != null, // on est l'item logout
                        link: user == null
                            ? const Authenticate()
                            : const HomePage()),
                    /*buildMenuItem(
                                text: "Help",
                                icon: Icons.help_center,
                                context: context,
                                link: const BuildingPage()),
                            buildMenuItem(
                                text: "About",
                                icon: Icons.info,
                                context: context,
                                link: const BuildingPage()),*/
                  ]).toList(),
                ),
              ],
            )),
      ),
    );
  }
}

Widget buildMenuItem(
    {required String text,
    required IconData icon,
    bool isShoppingCart = false,
    required BuildContext context,
    bool itemIslogOut = false,
    required Widget link}) {
  final AuthService _auth = AuthService();
  final user = Provider.of<UserModel?>(context);

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
    onTap: () async {
      if (itemIslogOut) {
        await _auth.signOut();
      }
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => link),
      );
    },
  );
}
