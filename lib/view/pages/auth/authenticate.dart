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
                        Row(
                          children: [
                            ElevatedButton(
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  print(email);
                                  print(password);
                                  dynamic result =
                                      await _auth.signWithEmailAndPassword(
                                          email, password);
                                  
                                  if (result == null) {
                                    print("error");  
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Erreur : Email incorrect ou mot de passe invalide")));
                                  } else {
                                    print("sign in");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return StreamProvider<
                                              UserModel?>.value(
                                            value: AuthService().user,
                                            initialData: null,
                                            child: const HomePage(),
                                          );
                                        },
                                      ),
                                    );
                                  }
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
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
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);
                                  
                                  if (result == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Erreur : Email incorrect ou mot de passe invalide")));
                                  
                                    
                                    print("error");  
                                  } else {
                                    print("register");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return StreamProvider<
                                              UserModel?>.value(
                                            value: AuthService().user,
                                            initialData: null,
                                            child: const HomePage(),
                                          );
                                        },
                                      ),
                                    );
                                  }
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
