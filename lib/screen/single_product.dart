
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../model/single_product.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({ Key? key }) : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {

 late SingleProductModel singleProductList;

  @override
  initState() {
    super.initState();
    onPressed();
  }

  Future<void> onPressed() async {
    var response = await http
        .get(
      Uri.parse('https://fakestoreapi.com/products/1'),
    )
        .then((value) {
      setState(() {
        if (value.statusCode == 200) {
          SingleProductModel pl = SingleProductModelFromJson(value.body);

           singleProductList = pl;

        } else {
          'vul hoise ${value.statusCode}';
        }
      });
    });
    print(singleProductList);
  }

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 300,
               
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Card(
                elevation: 5,
                
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
              
                        Container(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                            singleProductList.image,
                                            fit: BoxFit.fill,
                                          )),
                                      Text(
                                        singleProductList.title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 14),
                                      ),



                                          Text(
                                "Category: ${singleProductList.category}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black87,
                                    fontSize: 12),
                              ),
                                   Text(
                                "Description: ${singleProductList.description}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                    fontSize: 11),
                              ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              flex: 5,
                                              child: Text(
                                                "Taka. ${singleProductList.price}",
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
                                                    height: 20,
                                                  )))
                                        ],
                                      )
                       
                       ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  
  }
}