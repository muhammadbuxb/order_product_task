import 'package:flutter/material.dart';

class InvoicePage extends StatelessWidget {

  final String orderName;
  final String orderId;
  final String orderDate;
  final int totalProductQuantity;
  final String location;

  InvoicePage({
    required this.orderName,
    required this.orderDate,
    required this.totalProductQuantity,
    required this.location, required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice', style: TextStyle(color: Color(0xff006B83)),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        margin:  const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 2,
                blurRadius: 3,
                offset:  const Offset(-1, -2),
              ),
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 2,
                blurRadius: 3,
                offset:  const Offset(1, 2),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Order ID: $orderId', style:  const TextStyle(fontSize: 18,fontWeight: FontWeight.bold ))),
             const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 const Text('Order Name: ', style: TextStyle(fontSize: 18)),
                Text(orderName, style:  const TextStyle(fontSize: 18)),
              ],
            ),
             const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 const Text('Order Date:', style: TextStyle(fontSize: 18)),
                Text(orderDate, style: const  TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 const Text('Total Quantity: ', style: TextStyle(fontSize: 18)),
                Text('$totalProductQuantity', style: const  TextStyle(fontSize: 18)),
              ],
            ),
             const SizedBox(height: 20),
             const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Location: ', style: TextStyle(fontSize: 18)),
                ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Text(location, style: const  TextStyle(fontSize: 18), textAlign: TextAlign.end, )),
              ],
            ),
             const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  primary: const  Color(0xff006B83),
                  padding: const  EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  textStyle: const  TextStyle(fontSize: 18, color: Colors.white),
                ),
                child:  const Text('Print Invoice', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
