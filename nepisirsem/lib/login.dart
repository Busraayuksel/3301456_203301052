import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:nepisirsem/yardim.dart';

import 'firebase/firebase_service.dart';
import 'kategoriler.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textEditingControllerEmail =
      TextEditingController(); //Girdi bilgilerini alıyoruz ve kontrol edebiliyoruz.
  TextEditingController textEditingControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('NE PİŞİRSEM ?'),
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: ekranYuksekligi / 20),
                child: SizedBox(
                  width: ekranGenisligi / 4,
                  height: ekranYuksekligi / 6,
                  child: Image.asset('images/asci.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi / 30),
                child: TextField(
                  controller: textEditingControllerEmail,
                  decoration: const InputDecoration(
                      hintText: "Email",
                      filled: true, // ARKA PLAN İÇİN
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi / 30),
                child: TextField(
                  controller: textEditingControllerPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Şifre",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi / 25),
                child: SizedBox(
                  width: ekranGenisligi / 2,
                  height: ekranYuksekligi / 12,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      FirebaseService firebaseService = FirebaseService();
                      try {
                        var box = Hive.box("lastLogin");
                        firebaseService.loginFirebase(
                            textEditingControllerEmail.text.toString(),
                            textEditingControllerPassword.text.toString());
                        if (box.isNotEmpty) {
                          Fluttertoast.showToast(msg: box.get("lastLogin"));
                        }
                        box.put(
                            "lastLogin", DateTime.now().millisecondsSinceEpoch);
                      } catch (e) {
                        print(e.toString());
                      }
                      if (FirebaseAuth.instance.currentUser != null) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/categories",
                          (route) => false,
                        );
                      }
                    },
                    child: Text(
                      'GİRİŞ YAPa',
                      style: TextStyle(fontSize: ekranGenisligi / 25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi / 75),
                child: SizedBox(
                  width: ekranGenisligi / 2,
                  height: ekranYuksekligi / 12,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      FirebaseService firebaseService = FirebaseService();
                      try {
                        firebaseService.registerFirebase(
                            textEditingControllerEmail.text.toString(),
                            textEditingControllerPassword.text.toString());
                        firebaseService.addFirestore(
                            textEditingControllerEmail.text.toString());
                      } catch (e) {
                        print(e.toString());
                      }
                      if (FirebaseAuth.instance.currentUser != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Kategoriler()),
                        );
                      }
                    },
                    child: Text(
                      'KAYIT OL',
                      style: TextStyle(fontSize: ekranGenisligi / 25),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const yardim()),
                  );
                },
                child: TextButton(
                  child: const Text("YARDIM"),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.pink,
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
