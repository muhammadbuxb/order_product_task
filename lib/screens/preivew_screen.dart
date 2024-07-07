import 'package:edit_note_book/screens/invoice.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class PreviewScreen extends StatefulWidget {
  final List<ProductRow> productRows;
  final void Function(int) removeRow;

  PreviewScreen({required this.productRows, required this.removeRow});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    int totalProductQuantity = widget.productRows
        .map((row) => int.tryParse(row.quantityController.text) ?? 0)
        .reduce((a, b) => a + b);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Preview',
          style: TextStyle(color: Color(0xff006B83)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              'Order Number: #${DateTime.now().millisecondsSinceEpoch}',
              style: const TextStyle(fontSize: 18, color: Color(0xff006B83)),
            )),
            const SizedBox(height: 20),
            const Text('Products:',
                style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff006B83),
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.productRows.length,
                itemBuilder: (context, index) {
                  final row = widget.productRows[index];
                  return Card(
                    child: ListTile(
                      title: Text(row.nameController.text,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      subtitle: Text('Quantity: ${row.quantityController.text}',
                          style: const TextStyle(
                            fontSize: 16,
                          )),
                      trailing: IconButton(
                        onPressed: () {
                          widget.removeRow(index);
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InvoicePage(
                      orderId:
                          'Order #${DateTime.now().millisecondsSinceEpoch}',
                      orderName: 'Example Name',
                      orderDate: '${DateTime.now().day}/'
                          '${DateTime.now().month}/'
                          '${DateTime.now().year}',
                      totalProductQuantity: totalProductQuantity,
                      location:
                          'Sample Location', // You can update this as needed
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff006B83),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              child: const Text(
                'Invoice',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
