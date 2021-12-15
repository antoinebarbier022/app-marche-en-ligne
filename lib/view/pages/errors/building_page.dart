part of '../_pages.dart';

class BuildingPage extends StatelessWidget {
  const BuildingPage({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel?>(context);
    print(user);
    return Scaffold(
        appBar: const AppBarCustom(
          title: '',
        ),
        // Menu latérale gauche
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/illustrations/Building.png',
                width: 200,
                fit: BoxFit.scaleDown,
              ),
              const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Building ... Come back soon !",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
            ],
          ),
        ),
        );
  }

}