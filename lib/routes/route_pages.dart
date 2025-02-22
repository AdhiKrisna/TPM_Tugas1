
import 'package:flutter/material.dart';
import 'package:tugas_1/routes/route_names.dart';
import 'package:tugas_1/views/biodata.dart';
import 'package:tugas_1/views/ganjil_genap.dart';
import 'package:tugas_1/views/hitung_karakter.dart';
import 'package:tugas_1/views/kalkulator.dart';
import 'package:tugas_1/views/login.dart';
import 'package:tugas_1/views/menu.dart';

class   RoutePages {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case RouteName.menu:
        return MaterialPageRoute(builder: (_) =>  MenuPage(), settings: settings);
      case RouteName.kalkulator:
        return MaterialPageRoute(builder: (_) => const KalkulatorPage());
      case RouteName.ganjilGenap:
        return MaterialPageRoute(builder: (_) => const GanjilGenapPage());
      case RouteName.biodata:
        return MaterialPageRoute(builder: (_) => const BiodataPage());
      case RouteName.hitungKarakter:
        return MaterialPageRoute(builder: (_) => const HitungKarakterPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}
