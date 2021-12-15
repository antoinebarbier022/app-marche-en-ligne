part of '../_pages.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Authentification"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Log in"),
              Tab(text: "Register"),
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
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true, // password
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
            Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true, // password
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Confirm passwword',
                          ),
                          obscureText: true, // password
                          onChanged: (val) {
                            setState(() => confirmPassword = val);
                          },
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              print(email);
                              print(password);
                              print(confirmPassword);
                            }),
                      ],
                    ),
                  ),
                ),
              
          ],
        ),
      ),
    );
  }
}
