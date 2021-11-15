part of '_widgets.dart';

class ShoppingItem extends StatelessWidget {
  ShoppingItem({
    Key? key,
    required this.title,
    required this.color,
    required this.list,
  }) : super(key: key);

  final String title; // titre de la categorie
  final Color color;
  var list = []; // list des item de la categorie

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        padding: const EdgeInsets.all(10.0),
        //color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
              ),
              children: [
                Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
                Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
                Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
                Container(
                  
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(child: Text("+2", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), )),
              ),
              ],
            ),
            
            Text(title),
          ],
        ));
  }
}
