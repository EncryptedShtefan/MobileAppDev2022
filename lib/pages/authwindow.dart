import 'package:flutter/material.dart';
import 'package:mymobileappfirst/domain/userManager.dart';
import 'friendswindow.dart';
import 'package:mymobileappfirst/pages/regwindow.dart';

class Authwindow extends StatefulWidget {
  const Authwindow({Key? key}) : super(key: key);

  @override
  _AuthwindowState createState() => _AuthwindowState();
}

class _AuthwindowState extends State<Authwindow> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 80),
            child: appicon()
            //loginfields(context)
            ),
        authfields()
      ]),
    );
  }

  Widget authfields() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 25, 30, 10),
      child: Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              TextField(
                controller: loginController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 173, 142, 180),
                    hintText: 'Login',
                    hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                    errorText: isValid ? null : "Неверный логин или пароль",
                    errorStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 173, 142, 180),
                      hintText: 'Password',
                      hintStyle: const TextStyle(fontStyle: FontStyle.italic)),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SizedBox(
                      width: double.infinity,
                      height: 43,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Color.fromARGB(255, 102, 69, 134))),
                          onPressed: () async {
                            var userExists = await authenticateUser(
                                loginController.text, passwordController.text);
                            if (userExists) {
                              setState(() {
                                isValid = true;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Friendswindow()));
                              });
                            } else {
                              loginController.text = "";
                              passwordController.text = "";
                              setState(() {
                                isValid = false;
                              });
                            }
                          },
                          child: const Text('Sign In',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))))),
              const SizedBox(width: double.infinity, height: 43),
              const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Haven’t registered yet? You can create a new account:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w100,
                        color: Colors.white),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SizedBox(
                      width: double.infinity,
                      height: 43,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Color.fromARGB(157, 101, 69, 134))),
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistrationPage()))
                              },
                          child: const Text('Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))))),
            ],
          )),
    );
  }

/* Здесь виджет под название приложения на экране входа */
  Widget appicon() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: const <Widget>[
            Text('Welcome to Metaru Social Network!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 112, 100, 177),
                )),
          ],
        ),
      ),
    );
  }

  Widget loginfields(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Align(
        alignment: Alignment.center,
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                filled: true,
                fillColor: const Color.fromARGB(255, 195, 168, 199),
                hintText: 'login'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: TextField(
                decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              filled: true,
              fillColor: const Color.fromARGB(255, 195, 168, 199),
              hintText: 'password',
            )),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                  width: double.infinity,
                  height: 43,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color.fromRGBO(138, 117, 159, 1.0))),
                      onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Friendswindow()),
                            )
                          },
                      child: const Text('Sign In',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))))),
        ]),
      ),
    );
  }
}
