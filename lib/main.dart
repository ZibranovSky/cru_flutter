import 'package:flutter_application_1/halaman_produk.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      title : 'Aplikasi Produk',
      home: HalamanProduk(),
    );
  }
}