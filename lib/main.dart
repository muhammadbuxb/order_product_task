import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Order',
      theme: ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
       colorScheme: ColorScheme.fromSeed(seedColor: const  Color(0xff006B83)),
      ),
      home:  const ProductScreen(),
    );
  }
}
