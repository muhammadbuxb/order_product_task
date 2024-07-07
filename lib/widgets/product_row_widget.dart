import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../models/product.dart';

class ProductRowWidget extends StatelessWidget {
  final int index;
  final ProductRow productRow;
  final Future<List<String>> Function(String) fetchProducts;
  final void Function(int) removeRow;

  ProductRowWidget({
    required this.index,
    required this.productRow,
    required this.fetchProducts,
    required this.removeRow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: productRow.nameController,
                decoration: InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              suggestionsCallback: fetchProducts,
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (suggestion) {
                productRow.nameController.text = suggestion;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 120,
            child: Center(
              child: TextField(
                controller: productRow.quantityController,
                decoration: InputDecoration(
                    labelText: 'Quantity',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => removeRow(index),
          ),
        ],
      ),
    );
  }
}
