import 'dart:convert';

import 'package:flutter/material.dart ';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {


  final TextEditingController _titleTEcontroller = TextEditingController();
  final TextEditingController _ProductCodeTEcontroller = TextEditingController();
  final TextEditingController _imageTEcontroller = TextEditingController();
  final TextEditingController _QuantityTEcontroller = TextEditingController();
  final TextEditingController _PriceTEcontroller = TextEditingController();
  final TextEditingController _TotalPriceTEcontroller = TextEditingController();
  final TextEditingController _DescriptionTEcontroller =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool addnewProgress = false;
  Future<void> addNewProduct() async {
    addnewProgress = true;
    setState(() {

    });
    Map <String, dynamic> inputMap = {
      "Img": _imageTEcontroller.text.trim(),
      "ProductCode": _ProductCodeTEcontroller.text.trim(),
      "ProductName": _titleTEcontroller.text.trim(),
      "Qty":_QuantityTEcontroller.text.trim(),
      "TotalPrice":_TotalPriceTEcontroller.text.trim(),
      "UnitPrice":_PriceTEcontroller.text.trim()
    };
    print(inputMap);
    final response = await post(
        Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct"),
        headers: {
          'Content-Type' : 'application/json',
        },
        body: jsonEncode(inputMap));

    print(response.statusCode);
    if(response.statusCode == 200) {
      _titleTEcontroller.clear();
      _ProductCodeTEcontroller.clear();
    _imageTEcontroller.clear();
    _QuantityTEcontroller.clear();
    _PriceTEcontroller.clear();
    _TotalPriceTEcontroller.clear();
    _DescriptionTEcontroller.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product has been added")));
    }
    else if (response.statusCode == 400) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product Code should be Unique")));
    }
    addnewProgress = false;
    setState(() {
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  validator: isvalidate,
                  controller: _titleTEcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Title"),
                    hintText: "Enter Product Title",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: isvalidate,
                  controller: _ProductCodeTEcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Product Code"),
                    hintText: "Enter Product Code",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: isvalidate,
                  controller: _imageTEcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Image"),
                    hintText: "Enter Product Image",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: isvalidate,
                  controller: _QuantityTEcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Quantity"),
                    hintText: "Enter Product Quantity",
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: isvalidate,
                  controller: _PriceTEcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Price"),
                    hintText: "Enter Product Price",
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: isvalidate,
                  controller: _TotalPriceTEcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Total Price"),
                    hintText: "Enter Product Total Price",
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: isvalidate,
                  controller: _DescriptionTEcontroller,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Description"),
                    hintText: "Enter Product Description",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                addnewProgress ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : ElevatedButton(onPressed: () {
                  if(_formkey.currentState!.validate()) {
                    addNewProduct();
                  }
                }, child: Text("Add")),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
    );
  }
  String? isvalidate (String? value) {
    if(value?.trim().isNotEmpty ?? false){
      return null;
    }
    return 'Enter Valid Value';
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _titleTEcontroller.dispose();
    _ProductCodeTEcontroller.dispose();
    _QuantityTEcontroller.dispose();
    _PriceTEcontroller.dispose();
    _TotalPriceTEcontroller.dispose();
    _DescriptionTEcontroller.dispose();

    super.dispose();
  }
}
