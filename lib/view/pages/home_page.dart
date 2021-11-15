part of '_pages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final list = [
    "Pomme",
    "Banane",
    "orange",
    "citron",
    "mangue",
    "cerise",
    "Pomme",
    "Banane",
    "orange",
    "citron",
    "mangue",
    "cerise"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(
          title: 'Good Market',
        ),
        drawer: const SideBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text("Search Bar"),
                  Text("Store Departement"),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                   Text("Shopping lists"),
                  Icon(Icons.chevron_right)
                ],),
              ),
              
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  // Let the ListView know how many items it needs to build.
                  itemCount: list.length,

                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    final item = list[index];

                    return ProductItem(
                      title: list[index],
                      price: 4.3,
                      color: Colors.red
                      );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      //width: 10,
                    );
                  },
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                   Text("Popular"),
                  Icon(Icons.chevron_right)
                ],),
              ),
              
              GridView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Container(color: Colors.red),
                    Container(color: Colors.yellow),
                    Container(color: Colors.blue),
                    Container(color: Colors.green),
                    Container(color: Colors.red),
                    Container(color: Colors.yellow),
                    Container(color: Colors.blue),
                    Container(color: Colors.green),
                    Container(color: Colors.red),
                    Container(color: Colors.yellow),
                    Container(color: Colors.blue),
                    Container(color: Colors.green),
                    Container(color: Colors.red),
                    Container(color: Colors.yellow),
                    Container(color: Colors.blue),
                    Container(color: Colors.green)
                  ],
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 10),
                ),
              
            ],
          ),
        ));
  }
}
