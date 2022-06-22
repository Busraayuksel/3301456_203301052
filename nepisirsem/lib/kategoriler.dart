
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Kategoriler extends StatefulWidget {
  const Kategoriler({Key? key}) : super(key: key);

  @override
  State<Kategoriler> createState() => _KategorilerState();
}

class _KategorilerState extends State<Kategoriler> {
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: ekranYuksekligi / 20),
                child: SizedBox(
                  width: ekranGenisligi / 2,
                  height: ekranYuksekligi / 2,
                  child: Image.asset('resimler/nepisirsem.png'),
                ),
              ),
            ],
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
    
  } 
}

class MonthUser {
  MonthUser(this.month, this.userCount);
  final String month;
  final double userCount;
}


