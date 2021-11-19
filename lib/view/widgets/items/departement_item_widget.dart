part of '../_widgets.dart';

class DepartementItem extends StatelessWidget {
  const DepartementItem({
    Key? key,
    required this.departement,
  }) : super(key: key);


  final Departement departement;

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
              color: departement.color,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(5, 10), // changes position of shadow
                        ),
                      ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/${departement.image}.png',
                  width: 60,
                  fit: BoxFit.scaleDown,
                ),
                Center(
                    child: Text(
                  departement.name,
                  overflow: TextOverflow.ellipsis,
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
                    departement: departement,
                  )),
        );
      },
    );
  }
}
