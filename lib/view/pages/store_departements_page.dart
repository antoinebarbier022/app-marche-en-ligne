part of '_pages.dart';

class Departement {
  String title;
  Color? color;

  Departement(this.title, this.color);
}

class StoreDepartementPage extends StatelessWidget {
  StoreDepartementPage({Key? key, required this.title}) : super(key: key);

  final String title;

  var list = [
    Departement("Popular", Colors.blue[100]),
    Departement("Meat", Colors.yellow[200]),
    Departement("Seafood", Colors.red[200]),
    Departement("Fruits", Colors.purple[100]),
    Departement("Vegetables", Colors.orange[200]),
    Departement("Beverages", Colors.blue[200]),
    Departement("Bakery & Pastry", Colors.yellow[200]),
    Departement("Dairy & Eggs", Colors.red[200]),
    Departement("Grains & Pasta", Colors.purple[100]),
    Departement("Popular", Colors.green[100]),
    Departement("Meat", Colors.yellow[200]),
    Departement("Seafood", Colors.red[200]),
    Departement("Fruits", Colors.yellow[200]),
    Departement("Vegetables", Colors.orange[200]),
    Departement("Beverages", Colors.yellow[200]),
    Departement("Bakery & Pastry", Colors.orange[200]),
    Departement("Dairy & Eggs", Colors.orange[200]),
    Departement("Grains & Pasta", Colors.orange[200])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          automaticallyImplyLeading: true,
        ),
        body: GridView.builder(
          itemCount: list.length,
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, 
              childAspectRatio: 0.85,
              crossAxisSpacing: 4.0, 
              mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return DepartementItem(
                    title: list[index].title,
                    color: list[index].color);
          },
        ));
  }
}
