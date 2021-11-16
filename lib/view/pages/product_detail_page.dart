part of '_pages.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(
          title: 'Product détail',
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Product X", style: TextStyle(fontSize: 18)),
            const Text("Price €",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("per lb"),
            const SizedBox(
              height: 40,
            ),
            DefaultTabController(
                length: 3, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const TabBar(
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(text: 'Details'),
                          Tab(text: 'Nutrition'),
                          Tab(text: 'Related'),
                        ],
                      ),
                      Container(
                          height: 300, //height of TabBarView
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: const Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel ligula non dolor volutpat dignissim. Ut vel tempor velit, quis vestibulum ante. Fusce eleifend tempus imperdiet. Mauris consequat interdum iaculis. Maecenas at hendrerit est, id pulvinar mauris. Nullam vel malesuada arcu. Aliquam sit amet nunc ac risus blandit elementum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam molestie massa lacus, ac lacinia odio ultricies id. Suspendisse vel augue nec libero condimentum commodo et a purus. Etiam massa odio, eleifend in imperdiet nec, posuere eget arcu. Nulla sollicitudin massa et nulla eleifend ullamcorper.'),
                            ),
                            Container(
                              child: const Center(
                                child: Text('Display Tab 2',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: const Center(
                                child: Text('Display Tab 3',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ]))
                    ])),
          ],
        ))),
        bottomSheet: Container(
            width: double.infinity,
            height: 50,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      child: const Icon(Icons.remove),
                      onPressed: () => null,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("1",style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                      child: const Icon(Icons.add),
                      onPressed: () => null,
                    ),
                  ],
                ),
                ElevatedButton(
                  child: const Text("Add to cart"),
                  onPressed: () => null,
                )
              ],
            )));
  }
}
