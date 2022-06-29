import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nepisirsem/router/routerClass.dart';
import 'package:hive_flutter/hive_flutter.dart';



//import 'firebase/firebase_service.dart';
import 'kategoriler.dart';
import 'package:nepisirsem/yardim.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  await Hive.openBox("lastLogin");
  // FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //   if (user == null) {
  //     print('User is currently signed out!');
  //   } else {
  //     print('User is signed in!');
  //     //Kategorilere yönlendir
  //   }  
  // });
  await Hive.initFlutter('lastLogin');
  var box = await Hive.openBox<String>('lastLogin');
  */
  await Hive.initFlutter('nepisirsem');
  var box = await Hive.openBox<String>('lastLogin');
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
    FirebaseAuth auth = FirebaseAuth.instance;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = FirebaseAuth.instance;

    // auth.authStateChanges().listen((User? user) {
    //   if(user == null){
    //     debugPrint("user oturumu kapalı");
    //   }
    //   else{
    //     debugPrint("user oturum açık ${user.email} ve email dırımu ${user.emailVerified}");
    //   }
    // });
  }

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
                padding: EdgeInsets.only(bottom: ekranYuksekligi / 30),
                child: Container(
                  width: ekranGenisligi / 2,
                  height: ekranYuksekligi / 8,
                  decoration: const BoxDecoration(image:  DecorationImage(image:AssetImage("resimler/asci.png"))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi / 30 ),
                child: TextField(
                  controller: textEditingControllerEmail,
                  // KULLANICI ADI KISMI İÇİN OLUŞTURDUK
                  decoration: const InputDecoration(
                      hintText: "Email", // YAZILARIN GÖZÜKMESİ İÇİN
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
                      hintText: "Password", // YAZILARIN GÖZÜKMESİ İÇİN
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
                child: SizedBox(
                  width: ekranGenisligi / 2,
                  height: ekranYuksekligi / 12,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                    ),
                    onPressed: ()  async {
                      
                    
                        try {
                          // FirebaseService firebaseService = FirebaseService();
                          // firebaseService.loginFirebase(
                          //     textEditingControllerEmail.text.toString(),
                          //     textEditingControllerPassword.text.toString());
                          
                            await auth.createUserWithEmailAndPassword(email: textEditingControllerEmail.text, password:textEditingControllerPassword.text);  
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Kategoriler()),
                          );

                        } catch (e) {
                          showDialog(context: context, builder: (BuildContext context ) {
                            return AlertDialog( title: Text("hatalı işlem"),
                           content: SizedBox(height: ekranYuksekligi/35,child: Text("kayıtlı kullanıcı!"),),
                             );                          
                            });                      
                      }
                        var box = Hive.box<String>('lastLogin');
                         await  box.clear();
                           //box.add(textEditingControllerEmail.text.toString());
                           //box.add(textEditingControllerPassword.text.toString());
                          
                            await box.put(textEditingControllerEmail.text.toString(), textEditingControllerPassword.text.toString());
                           debugPrint(box.toMap().toString());
                           debugPrint(box.get(textEditingControllerEmail.text.toString()));
                           debugPrint(box.length.toString());
                    },
                    child: Text(
                      'Kayıt ol',
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
                    onPressed: ()async {
                        try {
                         await auth.signInWithEmailAndPassword(email: textEditingControllerEmail.text, password: textEditingControllerPassword.text);
                      Navigator.pushNamed(context, "/categories");

                        } catch (e) {
                          showDialog(context: context, builder: (BuildContext context ) {
                            return AlertDialog( title: Text("hatalı işlem"),
                           content: SizedBox(height: ekranYuksekligi/35,child: Text("bilgilerinizi kontrol ediniz!"),),

                             );
                          
                            });
                        }
                     /*   FirebaseService firebaseService = FirebaseService();
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
                        showDialog(context: context, builder: (BuildContext context ) {
                            return AlertDialog( title: Text("hatalı işlem"),
                           content: SizedBox(height: ekranYuksekligi/35,child:const  Text("kayıtlı kullanıcı!"),),
                             );                          
                            });
                      }
                      if (FirebaseAuth.instance.currentUser != null) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/categories",
                          (route) => false,
                        );
                      }
                      */
                    },
                    child: Text(
                      'giriş yap ',
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
