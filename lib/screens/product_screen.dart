import 'package:edit_note_book/screens/preivew_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';
import '../widgets/product_row_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductRow> productRows = [ProductRow()];

  Future<List<String>> fetchProducts(String pattern) async {
    final response =
        await http.get(Uri.parse('https://app.giotheapp.com/api-sample/'));
    if (response.statusCode == 200) {
      Map<String, dynamic> productMap = json.decode(response.body);
      List<String> productList = productMap.values.cast<String>().toList();
      return productList
          .where((item) => item.toLowerCase().contains(pattern.toLowerCase()))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  void addRow() {
    setState(() {
      productRows.add(ProductRow());
    });
  }

  void removeRow(int index) {
    if (productRows.length > 1) {
      setState(() {
        productRows.removeAt(index);
      });
    }
  }

  void submit() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              PreviewScreen(productRows: productRows, removeRow: removeRow)),
    );
  }

  void clearRows() {
    setState(() {
      productRows = [ProductRow()];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Order',
          style: TextStyle(color: Color(0xff006B83)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(-1, -2),
                    ),
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(1, 2),
                    ),
                  ]),
              child: Text(
                'Order Number: #${DateTime.now().millisecondsSinceEpoch}',
                style: TextStyle(fontSize: 16, color: Color(0xff006B83)),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 260,
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: Colors.grey,width: 1.5),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(-1, -2),
                    ),
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(1, 2),
                    ),
                  ]),
              child: ListView.builder(
                itemCount: productRows.length,
                itemBuilder: (context, index) {
                  return ProductRowWidget(
                    index: index,
                    productRow: productRows[index],
                    fetchProducts: fetchProducts,
                    removeRow: removeRow,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(-1, -2),
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: productRows.isNotEmpty ? submit : null,
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff006B83),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              child:
                  const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: addRow,
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff006B83),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              child:
                  const Text('Add Row', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
