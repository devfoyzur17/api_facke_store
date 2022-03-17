// ignore_for_file: avoid_print

import 'package:api_facke_store/screen/all_product.dart';
import 'package:api_facke_store/screen/jeyelary.dart';
import 'package:api_facke_store/screen/limit_product.dart';

import 'package:flutter/material.dart';

import 'screen/product_category.dart';
import 'screen/single_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: Container(
        child: ListView(
          children: [
            // ignore: prefer_const_constructors

            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllProduct()));
                },
                child: Text("All Product")),

                ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SingleProduct()));
                },
                child: Text("Single Product")),


                 ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductCategory()));
                },
                child: Text("Product Category")),

                ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Juyelery()));
                },
                child: Text("Juyelery")),

                ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LimitProduct()));
                },
                child: Text("Limit Product")),
          ],
        ),
      ),
    );
  }
}
