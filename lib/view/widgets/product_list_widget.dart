part of '_widgets.dart';

class ProductList extends StatelessWidget {
  ProductList({
    Key? key,
    required this.title,
    required this.list, 
    required this.link,
  }) : super(key: key);

  final String title;
  final Widget link;
  var list = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => link),
                  );
                },
              )
            ],
          ),
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
              return ProductItem(
                  title: list[index].title,
                  price: list[index].price,
                  color: list[index].color);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                  //width: 10,
                  );
            },
          ),
        ),
      ],
    );
  }
}
