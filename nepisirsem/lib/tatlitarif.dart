import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class tatlitarif extends StatefulWidget {
  const tatlitarif({
    Key? key,
    required this.tatliAdi,
    required this.tatliTuru,
    required this.tarih,
    required this.tatliaciklama,
    required this.resimYolu,
  }) : super(key: key);

  final String tatliAdi;
  final String tatliTuru;
  final String tarih;
  final String tatliaciklama;
  final String resimYolu;

  @override
  State<tatlitarif> createState() => _tatlitarifState();
}

class _tatlitarifState extends State<tatlitarif> {
  String? _content;

  Future<String> _getDirPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  // This function is triggered when the "Read" button is pressed
  Future<void> _readData() async {
    final dirPath = await _getDirPath();
    final myFile = File('$dirPath/favoriTatli.txt');
    final data = await myFile.readAsString();
    setState(() {
      _content = data;
    });
    print("Favori Tatlı : " + _content.toString());
  }

  Future<void> _writeData() async {
    final _dirPath = await _getDirPath();

    final _myFile = File('$_dirPath/favoriTatli.txt');
    // dosya yoksa otamatik oluşturulur.

    await _myFile.writeAsString(widget.tatliAdi);
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
                      arguments: widget.tatliAdi),
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
                    widget.tatliTuru,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: ekranGenisligi / 20,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Row(
                children: [
                  Yazi(widget.tatliAdi, ekranGenisligi / 25),
                  const Spacer(),
                  Yazi(widget.tarih, ekranGenisligi / 25),
                ],
              ),
              SizedBox(
                height: ekranYuksekligi * 0.5,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.all(ekranYuksekligi / 200),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Yazi(widget.tatliaciklama, ekranGenisligi / 25),
                    ),
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
