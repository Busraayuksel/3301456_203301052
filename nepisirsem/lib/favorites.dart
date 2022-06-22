import 'package:flutter/material.dart';

import 'kategoriler.dart';


class favorites extends StatefulWidget {
  const favorites({Key? key, required this.adi}) : super(key: key);
  final String adi;

  @override
  State<favorites> createState() => _favoritesState();
}

class _favoritesState extends State<favorites> with TickerProviderStateMixin {
  late AnimationController animasyonKontrol;
  late Animation<double> alphaAnimasyonDegerleri;

  @override //animasyon kontrolü için
  void initState() {
    super.initState();
    animasyonKontrol = AnimationController(
        duration: const Duration(milliseconds: 3000),
        vsync: this); //animasyonun ne kadar süreceğini belirledik
    alphaAnimasyonDegerleri =
        Tween(begin: 0.0, end: 1.0).animate(animasyonKontrol)
          ..addListener(() {
            setState(() {});
          });
  }

  @override //sayfa arka plana gittiyse animasyonu durduracak
  void dispose() {
    animasyonKontrol.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranGenisligi = ekranBilgisi.size.width;
    animasyonKontrol.forward();
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Opacity(
              opacity: alphaAnimasyonDegerleri.value,
              child: const Icon(
                Icons.favorite_rounded,
                color: Colors.red,
                size: 200,
              )),
          Text(
            widget.adi,
            style: const TextStyle(
              color: Colors.white30,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Favorilere eklendi",
            style: TextStyle(
              color: Colors.white30,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onHorizontalDragStart: (DragStartDetails dragStartDetails) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Kategoriler()),
                (route) => false,
              );
            },
            child: Text(
              "Anasayfa için yana kaydırın",
              style: TextStyle(
                fontSize: ekranGenisligi / 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
