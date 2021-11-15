part of '_widgets.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: const EdgeInsets.only(top: 70.0),
          children: ListTile.divideTiles(
              context: context,
              tiles: [
                buildMenuItem(text: "Store", icon: Icons.store),
                buildMenuItem(text: "Shopping Cart", icon: Icons.shopping_cart),
                buildMenuItem(text: "Shopping List", icon: Icons.list),
                buildMenuItem(text: "Recipes", icon: Icons.menu_book),
                buildMenuItem(text: "Order History", icon: Icons.history),
                buildMenuItem(text: "Login", icon: Icons.login),
                buildMenuItem(text: "Help", icon: Icons.help_center),
                buildMenuItem(text: "About", icon: Icons.info),
              ]).toList(),
        ),
      ),
    );
  }
}

Widget buildMenuItem({required String text, required IconData icon}) {
  return ListTile(
    leading: Icon(icon, color: Colors.white),
    title: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    onTap: () => {},
  );
}
