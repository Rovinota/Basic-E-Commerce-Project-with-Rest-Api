import 'package:flutter/material.dart ';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  @override
  final TextEditingController _titleTEcontroller = TextEditingController();
  final TextEditingController _ProductCodeTEcontroller = TextEditingController();
  final TextEditingController _QuantityTEcontroller = TextEditingController();
  final TextEditingController _PriceTEcontroller = TextEditingController();
  final TextEditingController _TotalPriceTEcontroller = TextEditingController();
  final TextEditingController _DescriptionTEcontroller = TextEditingController();
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Title"),
                  hintText: "Enter Product Title",

                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _ProductCodeTEcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Product Code"),
                  hintText: "Enter Product Code",

                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _QuantityTEcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Quantity"),
                  hintText: "Enter Product Quantity",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _PriceTEcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Price"),
                  hintText: "Enter Product Price",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _TotalPriceTEcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Total Price"),
                  hintText: "Enter Product Total Price",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _DescriptionTEcontroller,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Description"),
                  hintText: "Enter Product Description",

                ),
              ),

              SizedBox(height: 16,),
              ElevatedButton(onPressed: (){}, child: Text("Add") ),


            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
    );
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
