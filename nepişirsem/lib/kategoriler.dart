import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Kategoriler extends StatelessWidget {
  const Kategoriler({Key? key}) : super(key: key);

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
        series: <LineSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              // Bind data source
              dataSource: <SalesData>[
                SalesData('Jan', 35),
                SalesData('Feb', 28),
                SalesData('Mar', 34),
                SalesData('Apr', 32),
                SalesData('May', 40)
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales)
        ]);
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
