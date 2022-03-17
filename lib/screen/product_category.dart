// ignore_for_file: prefer_const_constructors

import 'package:api_facke_store/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/product_category.dart';

class ProductCategory extends StatefulWidget {
  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {


  
  List<String> productCategoryuctList = [];

  @override
  initState() {
    super.initState();
    onPressed();
  }

  Future<void> onPressed() async {
    var response = await http
        .get(
      Uri.parse('https://fakestoreapi.com/products/categories'),
    )
        .then((value) {
      setState(() {
        if (value.statusCode == 200) {
           productCategoryuctList = productCategoryFromJson(value.body);


        } else {
          'vul hoise ${value.statusCode}';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: productCategoryuctList.length,
                itemBuilder:  (context, index) {

                return Card(
                  elevation: 2,
                  child: ListTile(
                    
                    title: Text(productCategoryuctList[index]),
                
                    
                  ),
                );
                
              })),
          ],
        ),
      ),
    );
  }
}
