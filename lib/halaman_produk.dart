 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit_produk.dart';
 import 'package:http/http.dart' as http;
 
import 'package:flutter_application_1/tambah_produk.dart';

class HalamanProduk extends StatefulWidget {
  const HalamanProduk({super.key});

  @override
  State<HalamanProduk> createState() => _HalamanProdukState();
}

class _HalamanProdukState extends State<HalamanProduk> {
  List _listdata = [];
  bool _loading = true;
  
  Future _getdata()async{
    try {
      final respon = await http.get(Uri.parse('http://192.168.1.6/api/read.php'));
      if (respon.statusCode==200) {
        final data = jsonDecode(respon.body);
        setState(() {
          _listdata = data;
          _loading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    _getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Halaman Produk'),backgroundColor: Colors.blue  ,),body: _loading ? Center(child: CircularProgressIndicator(),) :ListView.builder(itemCount: _listdata.length,  itemBuilder: ((context, index) {
      return Card(
        child: InkWell(
            child: ListTile(
          title: Text(_listdata[index]['nama_produk']),
          subtitle: Text(_listdata[index]['harga_produk']),
          trailing: IconButton(onPressed: () {
            Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>UbahProduk(ListData: {
                'id_produk': _listdata[index]['id_produk'],
                'nama_produk': _listdata[index]['nama_produk'],
                'harga_produk': _listdata[index]['harga_produk'],
              })));
          }, icon: Icon(Icons.edit),
        ) 
         
        ), 
       
      ), );
    }),),
      floatingActionButton: FloatingActionButton(
        child: Text('+',
        style: TextStyle(fontSize: 24),),
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> TambahProduk()));
      }),
    ); 
  }
}