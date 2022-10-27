import 'package:flutter/material.dart';
import 'friendswindow.dart';

class Authwindow extends StatefulWidget {
  const Authwindow({Key? key}) : super(key: key);

  @override
  _AuthwindowState createState() => _AuthwindowState();
}

class _AuthwindowState extends State<Authwindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 80),
            child: appicon()),
        loginfields(context)
      ]),
    );
  }
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

/* Здесь виджет с текстовыми полями под логин пароль, которые обернуты в паддинги, а также кнопка принятия (перехода) */
Widget loginfields(context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
    child: Align(
      alignment: Alignment.center,
      child: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
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
