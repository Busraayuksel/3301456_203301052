import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yemek_tarifleri/kategoriler.dart';
import 'package:yemek_tarifleri/router/routerClass.dart';

import 'firebase/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  await Hive.openBox("lastLogin");
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
      //Kategorilere yönlendir
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routerr.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingControllerEmail = TextEditingController();
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
          // klavye ekrana gelince üzerindeki şeriti kaldırır
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: ekranYuksekligi / 20),
                child: SizedBox(
                  width: ekranGenisligi / 4,
                  height: ekranYuksekligi / 6,
                  child: Image.asset('resimler/aşcı.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi / 30),
                child: TextField(
                  controller: textEditingControllerEmail,
                  // KULLANICI ADI KISMI İÇİN OLUŞTURDUK
                  decoration: const InputDecoration(
                      hintText: "Kullanıcı Adı", // YAZILARIN GÖZÜKMESİ İÇİN
                      filled: true, // ARKA PLAN İÇİN
                      fillColor: Colors.white, //ARKA PLAN RENGİ AYARLANDI
                      border: OutlineInputBorder(
                          //ARKA PLAN KUTUSUNUN KÖŞELERİNİ OVALLEŞTİRDİK
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)) //KÖŞE OVAL AYARINI YAPTIK
                          )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi / 30),
                child: TextField(
                  controller: textEditingControllerPassword,
                  // KULLANICI ADI KISMI İÇİN OLUŞTURDUK
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Şifre", // YAZILARIN GÖZÜKMESİ İÇİN
                      filled: true, // ARKA PLAN İÇİN
                      fillColor: Colors.white, //ARKA PLAN RENGİ AYARLANDI
                      border: OutlineInputBorder(
                          //ARKA PLAN KUTUSUNUN KÖŞELERİNİ OVALLEŞTİRDİK
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)) //KÖŞE OVAL AYARINI YAPTIK
                          )),
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
                      if (textEditingControllerEmail.text.isNotEmpty &&
                          textEditingControllerPassword.text.isNotEmpty) {
                        try {
                          FirebaseService firebaseService = FirebaseService();
                          firebaseService.loginFirebase(
                              textEditingControllerEmail.text.toString(),
                              textEditingControllerPassword.text.toString());
                        } catch (e) {
                          print(e);
                        }
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Kategoriler()),
                      );
                    },
                    child: Text(
                      'GİRİŞ YAP',
                      style: TextStyle(fontSize: ekranGenisligi / 25),
                    ),
                  ),
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
                      if (textEditingControllerEmail.text.isNotEmpty &&
                          textEditingControllerPassword.text.isNotEmpty) {
                        try {
                          FirebaseService firebaseService = FirebaseService();
                          firebaseService.registerFirebase(
                              textEditingControllerEmail.text.toString(),
                              textEditingControllerPassword.text.toString());
                          firebaseService.loginFirebase(
                              textEditingControllerEmail.text.toString(),
                              textEditingControllerPassword.text.toString());
                        } catch (e) {
                          print(e);
                        }
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Kategoriler()),
                      );
                    },
                    child: Text(
                      'KAYIT OL',
                      style: TextStyle(fontSize: ekranGenisligi / 25),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('yardım seçildi');
                },
                child: Text(
                  'YARDIM',
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: ekranGenisligi / 30,
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
