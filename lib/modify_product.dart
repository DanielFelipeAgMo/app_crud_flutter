import 'package:app_crud_flutter/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_crud_flutter/text_box.dart';

class ModifyProduct extends StatefulWidget {
  final Product _product;
  ModifyProduct(this._product);
  @override
  State<StatefulWidget> createState() => _ModifyProduct();
}

class _ModifyProduct extends State<ModifyProduct> {
  late TextEditingController controllerName;
  late TextEditingController controllerDescription;
  late TextEditingController controllerPrice;

  @override
  void initState() {
    Product c = widget._product;
    controllerName = new TextEditingController(text: c.name);
    controllerDescription = new TextEditingController(text: c.description);
    controllerPrice = new TextEditingController(text: c.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar producto"),
      ),
      body: ListView(
        children: [
          TextBox(controllerName, "Name"),
          TextBox(controllerDescription, "Description"),
          TextBox(controllerPrice, "Price"),
          ElevatedButton(
              onPressed: () {
                String name = controllerName.text;
                String description = controllerDescription.text;
                String price = controllerPrice.text;

                if (name.isNotEmpty &&
                    description.isNotEmpty &&
                    price.isNotEmpty) {
                  Navigator.pop(
                      context,
                      new Product(
                          name: name, description: description, price: price));
                }
              },
              child: Text("Guardar cambios")),
        ],
      ),
    );
  }
}
