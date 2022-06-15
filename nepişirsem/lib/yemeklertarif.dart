import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class tarif extends StatefulWidget {
  const tarif(
      {Key? key,
      required this.yemekAdi,
      required this.yemekTuru,
      required this.tarih,
      required this.aciklama,
      required this.resimYolu})
      : super(key: key);

  final String yemekAdi;
  final String yemekTuru;
  final String tarih;
  final String aciklama;
  final String resimYolu;

  @override
  State<tarif> createState() => _tarifState();
}

class _tarifState extends State<tarif> {
  String? _content;

  Future<String> _getDirPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  // This function is triggered when the "Read" button is pressed
  Future<void> _readData() async {
    final dirPath = await _getDirPath();
    final myFile = File('$dirPath/favoriYemek.txt');
    final data = await myFile.readAsString();
    setState(() {
      _content = data;
    });
    print("Favori Yemek : " + _content.toString());
  }

  Future<void> _writeData() async {
    final _dirPath = await _getDirPath();

    final _myFile = File('$_dirPath/favoriYemek.txt');
    // If data.txt doesn't exist, it will be created automatically

    await _myFile.writeAsString(widget.yemekAdi);
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tarif'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                  width: ekranGenisligi, child: Image.asset(widget.resimYolu)),
              GestureDetector(
                onDoubleTap: () => {
                  _writeData(),
                  _readData(),
                  Navigator.pushNamed(context, "/favorites",
                      arguments: widget.yemekAdi),
                },
                child: TextButton(
                  child: Yazi("Beğen", ekranGenisligi / 20),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.blueAccent,
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    widget.yemekTuru,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight
                          .bold, // makarna yazısının kalın olması için
                      fontSize: ekranGenisligi / 20,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Row(
                children: [
                  Yazi(widget.yemekAdi, ekranGenisligi / 25),
                  const Spacer(),
                  Yazi(widget.tarih, ekranGenisligi / 25),
                ],
              ),
              SizedBox(
                height: ekranYuksekligi * 0.5,
                child: SingleChildScrollView(
                  // widgetin alta doğru genişlemesini sağladık.
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.all(ekranYuksekligi / 200),
                    child: Yazi(widget.aciklama, ekranGenisligi / 25),
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

class Yazi extends StatelessWidget {
  String icerik;
  double yaziBoyutu;
  Yazi(this.icerik, this.yaziBoyutu, {Key? key})
      : super(key: key); // consturctor

  @override
  Widget build(BuildContext context) {
    return Text(
      icerik,
      style: TextStyle(fontSize: yaziBoyutu),
    );
  }
}
