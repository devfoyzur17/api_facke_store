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
        backgroundColor: Color(0xff009900),
        
        title: Center(child: Text("Enjoy your shopping")),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: [
            // ignore: prefer_const_constructors

            Image.asset("assets/img.png"),

            RaisedButton(
              color: Color(0xff4dff4d),
              textColor: Color(0xff001a00),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllProduct()));
                },
                child: Text("All Products")),

                RaisedButton(
                   color: Color(0xff1aff1a),
                   textColor: Color(0xff001a00),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SingleProduct()));
                },
                child: Text("Single Product")),


                 RaisedButton(
                    color: Color(0xff00e600),
                   textColor: Color(0xff001a00),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductCategory()));
                },
                child: Text("Product Category")),

                RaisedButton(
                  color: Color(0xff00cc00),
                   textColor: Color(0xff001a00),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Juyelery()));
                },
                child: Text("Juyelery")),

                RaisedButton(
                  color: Color(0xff00b300),
              textColor: Color(0xff001a00),
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
