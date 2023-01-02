import 'package:app_crud_flutter/add_product.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  final String _title;
  Home_page(this._title);
  @override
  State<StatefulWidget> createState() => _Home_page();
}

class _Home_page extends State<Home_page> {

  List<Product> products = [
    Product(name: 'Cuaderno', description: 'Rayado 100 hojas, cocido', price: '3000'),
    Product(name: 'Cuaderno', description: 'Cuadriculado 100 hojas, cocido', price: '3000'),
    Product(name: 'Cuaderno', description: 'Doblelínea 100 hojas, cocido', price: '3000')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(widget._title),
   ),
   body: ListView.builder(
    itemCount: products.length,
    itemBuilder:(context, index){
      return ListTile(
        onTap: (){},
        onLongPress: (){},
        title: Text(products[index].name),
        subtitle: Text(products[index].description + " COP "+ products[index].price),
        leading: Card(
          child: Text(products[index].name.substring(0,1)),
        ),
        trailing: Icon(
          Icons.emoji_objects,
          color: Colors.green,
        ),
      );
    },
   ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (_) => AddProduct()))
          .then((newProduct){
            if(newProduct !=null){
              setState(() {
                products.add(newProduct);
                messageResponse(context, newProduct.name + "a sido creado con exito!...");
              });
            }
          })
      },
      tooltip: "Add new product",
      child: Icon(Icons.add),
      
    )
    );
  }
}

class Product {
  var name;
  var description;
  var price;

  Product({this.name, this.description, this.price})
}
