import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

_messageResponse(BuildContext context, String name) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Mensaje de prueba"),
            content: Text("El contacto " + name),
          ));
}
