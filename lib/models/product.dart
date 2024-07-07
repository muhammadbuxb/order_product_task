import 'package:flutter/material.dart';

class Product {
  String name;
  int quantity;

  Product({required this.name, required this.quantity});
}

class ProductRow {
  var nameController = TextEditingController();
  var quantityController = TextEditingController();
}
