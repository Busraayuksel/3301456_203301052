import 'package:flutter/material.dart';
import 'package:yemek_tarifleri/favorites.dart';
import 'package:yemek_tarifleri/kategoriler.dart';
import 'package:yemek_tarifleri/login.dart';
import 'package:yemek_tarifleri/tatlianasayfa.dart';
import 'package:yemek_tarifleri/tatlitarif.dart';
import 'package:yemek_tarifleri/yemeklerAnasayfa.dart';
import 'package:yemek_tarifleri/yemeklertarif.dart';

import '../main.dart';

class Routerr {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const MyApp());
      case '/categories':
        return MaterialPageRoute(builder: (_) => const Kategoriler());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/sweetMainPage':
        return MaterialPageRoute(builder: (_) => const tatlianasayfa());
      case '/mainPage':
        return MaterialPageRoute(builder: (_) => const anasayfa());
      case '/sweetSpecification':
        var data = settings.arguments as List<String>;
        return MaterialPageRoute(
            builder: (_) => tatlitarif(
                tatliAdi: data[0],
                tatliTuru: data[1],
                tarih: data[2],
                tatliaciklama: data[3],
                resimYolu: data[4]));
      case '/foodSpecification':
        var data = settings.arguments as List<String>;
        return MaterialPageRoute(
            builder: (_) => tarif(
                yemekAdi: data[0],
                yemekTuru: data[1],
                tarih: data[2],
                aciklama: data[3],
                resimYolu: data[4]));
      case '/favorites':
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => favorites(adi: data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
