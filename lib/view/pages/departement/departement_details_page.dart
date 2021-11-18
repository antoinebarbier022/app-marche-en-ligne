part of '../_pages.dart';

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
      Product("Pomme", 2.4, "Popular", "test"),
    Product("Banane", 5,  "Popular", "test"),
    Product("Cerise", 2.4,  "Popular", "test"),
    Product("Mangue", 2.4,  "Popular", "test"),
    Product("Carotte", 2.4,  "Vegetables", "test"),
    Product("Tomate", 2.4,  "Vegetables", "test"),
    Product("Orange", 2.4,  "Popular", "test")
    ],
    [
      Product("Pomme", 2.4, "Popular", "test"),
    Product("Banane", 5,  "Popular", "test"),
    Product("Cerise", 2.4,  "Popular", "test"),
    Product("Mangue", 2.4,  "Popular", "test"),
    Product("Carotte", 2.4,  "Vegetables", "test"),
    Product("Tomate", 2.4,  "Vegetables", "test"),
    Product("Orange", 2.4,  "Popular", "test")
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
          const Padding(
                padding: EdgeInsets.all(10.0),
                child: CupertinoSearchTextField(),
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
                        color: Theme.of(context).primaryColorLight,
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
                return CollectionList(
                  id:'',
                  title: "Category",
                  listProduct: list[index],
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
