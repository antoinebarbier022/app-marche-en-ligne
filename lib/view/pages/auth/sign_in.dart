part of '../_pages.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign in"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: ElevatedButton(
                    onPressed: () async {
                      dynamic result = await _auth.signInAnnonyme();
                      if (result == null) {
                        // ignore: avoid_print
                        print("error sign in ");
                      } else {
                        // ignore: avoid_print
                        print("sign in");
                        // ignore: avoid_print
                        print(result.uid);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return StreamProvider<UserModel?>.value(
                                value: AuthService().user,
                                initialData: null,
                                child: const HomePage(
                                  title: "Yes",
                                ),
                              );
                            },
                          ),
                        );
    /*    
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const HomePage(
                                  title: "Yes",
                                )),
                      );*/
                      }
                    },
                    child: Text(user == null ? "Sign in annonymous" : user.uid),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20.0),
                        TextFormField(
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                            child: const Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              print(email);
                              print(password);
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
