part of '../_widgets.dart';

class DepartementItem extends StatelessWidget {
  const DepartementItem({
    Key? key,
    required this.title,
    required this.color,
    required this.image,
  }) : super(key: key);

  final String title;
  final Color? color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 110,
        padding: const EdgeInsets.all(10.0),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/$image.png',
                  width: 70,
                  fit: BoxFit.scaleDown,
                ),
                Center(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => DepartementDetailsPage(
                    title: title,
                  )),
        );
      },
    );
  }
}
