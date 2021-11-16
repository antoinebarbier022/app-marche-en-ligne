part of '_pages.dart';

class DepartementDetailsPage extends StatelessWidget {
  DepartementDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  var list_category = [
    "Pork",
    "Beef",
    "Chicken",
    "Pork",
    "Beef",
    "Chicken",
    "Pork",
    "Beef",
    "Chicken"
  ];

  var list = [
    [
      Product("Pork 100g", 2.4, Colors.green[100]),
      Product("Pork 200b", 5, Colors.yellow[200]),
      Product("Pork 1kg", 2.4, Colors.red[200]),
      Product("Pork 10kg", 2.4, Colors.yellow[200]),
    ],
    [
      Product("Beef 100g", 2.4, Colors.green[100]),
      Product("Beef 200b", 5, Colors.yellow[200]),
      Product("Beef 1kg", 2.4, Colors.red[200]),
      Product("Beef 10kg", 2.4, Colors.yellow[200]),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          title: title,
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ElevatedButton(
            child: const Text("Search Bar"),
            onPressed: () => print("ok"),
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: list_category.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(list_category[index]),
                      ))),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => DepartementCategoryPage(
                                title: list_category[index],
                              )),
                    );
                  },
                );
              },
            ),
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductList(
                  title: "Category",
                  list: list[index],
                  link: DepartementCategoryPage(title: 'Category',)
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 20,
                  thickness: 1,
                );
              },
            ),
          ),
        ])));
  }
}
