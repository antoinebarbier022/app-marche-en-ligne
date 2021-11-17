part of '_pages.dart';

class Departement {
  String title;
  String image;
  Color? color;

  Departement(this.title, this.color, this.image);
}

class StoreDepartementPage extends StatelessWidget {
  StoreDepartementPage({Key? key, required this.title}) : super(key: key);

  final String title;

  var list = [
    Departement("Popular", Colors.brown[50], "star"),
    Departement("Meat", Colors.red[100], "meat"),
    Departement("Fruits", Colors.green[100], "fruits"),
    Departement("Grains & Pasta", Colors.orange[100], "grains"),
    Departement("Vegetables", Colors.green[100], "vegetables"),
    Departement("Cheese", Colors.blue[100], "cheese"),
    Departement("Bakery & Pastry", Colors.yellow[100], "bakery"),
    Departement("Seafood", Colors.blueGrey[50], "fish"),
    Departement("Dairy & Eggs", Colors.purple[50], "dairy"),
    Departement("Nuts & Seeds", Colors.brown[50], "nuts"),
    Departement("Beverages", Colors.green[100], "beverages"),
    Departement("Japan food", Colors.orange[100], "sushi"),
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
                    color: list[index].color,
                    image: list[index].image);
          },
        ));
  }
}
