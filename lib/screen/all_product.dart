// ignore_for_file: prefer_const_constructors

import 'package:api_facke_store/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllProduct extends StatefulWidget {
  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {


  
  List<Welcome> allProductList = [];

  @override
  initState() {
    super.initState();
    onPressed();
  }

  Future<void> onPressed() async {
    var response = await http
        .get(
      Uri.parse('https://fakestoreapi.com/products'),
    )
        .then((value) {
      setState(() {
        if (value.statusCode == 200) {
           allProductList = welcomeFromJson(value.body);

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
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 6.0,
                  childAspectRatio: 2 / 2.7,
                  mainAxisSpacing: 8.0,
                  children: List.generate(allProductList.length, (index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                  allProductList[index].image,
                                  fit: BoxFit.fill,
                                )),
                            Text(
                              allProductList[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),


                            Text(
                              "Category: ${allProductList[index].category.name}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.grey,
                                  fontSize: 11),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Taka. ${allProductList[index].price}",
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_outline_outlined,
                                          size: 20,
                                          color: Colors.red,
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          "assets/cart.png",
                                          height: 35,
                                        )))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
