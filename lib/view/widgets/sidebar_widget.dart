part of '_widgets.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:250,
      child: Drawer(
        child: Material(
          color: Theme.of(context).primaryColor,
          child: ListView(
            padding: const EdgeInsets.only(top: 70.0),
            children: ListTile.divideTiles(context: context, tiles: [
              buildMenuItem(
                  text: "Store",
                  icon: Icons.store,
                  context: context,
                  link: HomePage(
                    title: 'Home',
                  )),
              buildMenuItem(
                  text: "Shopping Cart",
                  icon: Icons.shopping_cart,
                  context: context,
                  link: ShoppingCartPage(
                    title: 'Shopping Cart',
                  )),
              buildMenuItem(
                  text: "Shopping List",
                  icon: Icons.list,
                  context: context,
                  link: ShoppingListsPage(
                    title: 'Shopping Lists',
                  )),
              buildMenuItem(
                  text: "Recipes",
                  icon: Icons.menu_book,
                  context: context,
                  link: HomePage(title: "Home",)),
              buildMenuItem(
                  text: "Order History",
                  icon: Icons.history,
                  context: context,
                  link: HomePage(title: "Home",)),
              buildMenuItem(
                  text: "Login",
                  icon: Icons.login,
                  context: context,
                  link: HomePage(title: "Home",)),
              buildMenuItem(
                  text: "Help",
                  icon: Icons.help_center,
                  context: context,
                  link: HomePage(title: "Home",)),
              buildMenuItem(
                  text: "About",
                  icon: Icons.info,
                  context: context,
                  link: HomePage(title: "Home",)),
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
    required BuildContext context,
    required Widget link}) {
  return ListTile(
    leading: Icon(icon, color: Colors.white),
    title: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    onTap: () {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => link),
      );
    },
  );
}
