
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nepisirsem/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Kategoriler extends StatefulWidget {
  const Kategoriler({Key? key}) : super(key: key);

  @override
  State<Kategoriler> createState() => _KategorilerState();
}

class _KategorilerState extends State<Kategoriler> {
  TextEditingController changePassword = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

    @override
    void initState() {
      super.initState();
      auth = FirebaseAuth.instance;
    }
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    
    

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('KATEGORİLER'),
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: [
          const SizedBox(
            width: 15,
            height: 15,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: ListTile(
                leading: SizedBox(
                    width: ekranGenisligi / 4,
                    height: ekranYuksekligi / 6,
                    child: Image.asset("resimler/foodIcon.png")),
                title: const Text(
                  "YEMEKLER",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, "/mainPage");
                },
              ),
            ),
          ),
          const SizedBox(
            width: 15,
            height: 15,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: ListTile(
                leading: SizedBox(
                    width: ekranGenisligi / 3.5,
                    height: ekranYuksekligi / 6,
                    child: Image.asset("resimler/sweetIcon.png")),
                title: const Text(
                  "TATLILAR",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, "/sweetMainPage");
                },
              ),
            ),
          ),
          movieChart(),
          Padding(padding: EdgeInsets.all(ekranYuksekligi / 25),
                child: SizedBox(
                  width: ekranGenisligi / 60,
                  height: ekranYuksekligi / 30,
                  child: ElevatedButton(onPressed: () async {
                    deleteUser();
                  }, child: Text("kullancıyı sil"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.pink,                      
                    ),),
                ),
              ),
              Padding(padding: EdgeInsets.all(ekranYuksekligi / 25),
                child:  TextField(
                  controller: changePassword,
                  decoration: const InputDecoration(
                      hintText: "changepassword", 
                      filled: true, 
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)) 
                              )
                          ),
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
                      await auth.currentUser!.updatePassword(changePassword.text);
                      await auth.signOut();
                      showDialog(context: context, builder: (BuildContext context ) {
                            return AlertDialog( title: Text("şifre değişti"),
                           content: SizedBox(height: ekranYuksekligi/35,child: Text("işlem başarılı!"),),
                             );                          
                            });        
                            Future.delayed(Duration(seconds: 2));
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  MyApp()),
                          );

                    },
                    child: Text(
                      'şifreyi değiştir',
                      style: TextStyle(fontSize: ekranGenisligi / 25),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
    
  }

  Widget movieChart() {
    return SfCartesianChart(
        // Initialize category axis
        primaryXAxis: CategoryAxis(),
        series: <LineSeries<MonthUser, String>>[
          LineSeries<MonthUser, String>(
              // Bind data source
              dataSource: <MonthUser>[
                MonthUser('Jan', 20),
                MonthUser('Feb', 20),
                MonthUser('Mar', 30),
                MonthUser('Apr', 50),
                MonthUser('May', 10)
              ],
              xValueMapper: (MonthUser sales, _) => sales.month,
              yValueMapper: (MonthUser sales, _) => sales.userCount)
        ]);
  }

deleteUser() async{
  
      await auth.currentUser!.delete();
      await auth.signOut();
      Navigator.push(

        context,
        MaterialPageRoute(
          builder: (context) =>  MyApp()),
          );
  }

}

class MonthUser {
  MonthUser(this.month, this.userCount);
  final String month;
  final double userCount;
}


