import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Widgets/Product_item.dart';
import 'add_new_product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool inProgress = false;
  int  size = 0;
  List<products> Productlist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductList();
    size = Productlist.length;
  }

  void getProductList() async {
    Productlist.clear();
    inProgress = true;
    setState(() {});
    Response response =
        await get(Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success' ) {
        for (Map<String, dynamic> productJson in responseData['data']) {
          Productlist.add(products(
              productJson['_id'],
              productJson['ProductName'] ?? '',
              productJson['ProductCode'] ?? '',
              productJson['Img'] ?? "",
              productJson['UnitPrice'] ?? '',
              productJson['Qty']?? "",
              productJson['TotalPrice'] ?? ''
          )
          );
        }
      }

    }
    inProgress = false;
    print(Productlist.length);
    setState(() {});
  }

  // void getProductListRefress() async {
  //   inProgress = true;
  //   setState(() {});
  //   Response response =
  //       await get(Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"));
  //   // print(response.body);
  //   // print(response.statusCode);
  //   // if (response.statusCode == 200) {
  //     final Map<String, dynamic> responseData = jsonDecode(response.body);
  //     if (responseData['status'] == 'success' && size < Productlist.length ) {
  //       for (Map<String, dynamic> productJson in responseData['data']) {
  //         Productlist.add(products(
  //             productJson['_id'],
  //             productJson['ProductName'],
  //             productJson['ProductCode'],
  //             productJson['Img'] ?? "",
  //             productJson['UnitPrice'],
  //             productJson['Qty']?? "",
  //             productJson['TotalPrice']));
  //       }
  //     }
  //   inProgress = false;
  //   print(Productlist.length);
  //   setState(() {});
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product List"),
          actions: [
            IconButton(onPressed: (){
              getProductList();
            }, icon: Icon(Icons.refresh)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewProductScreen(),
                ));
          },
          child: const Icon(Icons.add),
        ),
        body: inProgress ? Center(child: CircularProgressIndicator(),) : ListView.separated(
                itemCount: Productlist.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    Product: Productlist[index],
                  );
                },
                separatorBuilder: (_, __) => Divider(),
              ));
  }
}

class products {
  final String id;
  final String productname;
  final String productCode;
  final String imag;
  final String unitprice;
  final String quantity;
  final String totalPrice;
  products(this.id, this.productname, this.productCode, this.imag,
      this.unitprice, this.quantity, this.totalPrice);
}
