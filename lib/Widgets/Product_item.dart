import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_recorded_video_practice/Screens/add_new_product_screen.dart';
import 'package:ostad_recorded_video_practice/Screens/productList_Screen.dart';


class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.Product});
  final products Product;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Product_Action_Dialogue(context);
            });
      },
      leading: Image.network(
        Product.imag,
        width: 100,
      ),
      title: Text(Product.productname),
      trailing: Text("\$${Product.unitprice}"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( "Product Code: "+Product.productCode),
          // Text("Unit Price: ${Product.unitprice}"),
          Text("Total Price: ${Product.totalPrice} "),
        ],
      ),
    );
  }
  AlertDialog Product_Action_Dialogue(BuildContext context) {
    return AlertDialog(
      title: Text("Actions"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context) => AddNewProductScreen()));

            },
            title: Text("Update"),
            leading: Icon(Icons.edit),
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            onTap: (){
              Navigator.pop(context);
            },
            title: Text("Delete"),
            leading: Icon(CupertinoIcons.delete_simple),
          ),
        ],
      ),
    );
  }
}

