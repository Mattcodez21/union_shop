import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';

class PrintShackPage extends StatefulWidget {
  const PrintShackPage({Key? key}) : super(key: key);

  @override
  State<PrintShackPage> createState() => _PrintShackPageState();
}

class _PrintShackPageState extends State<PrintShackPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(title: 'The Print Shack'),
      endDrawer: MobileNavDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.print, size: 64, color: Color(0xFF4d2963)),
              SizedBox(height: 24),
              Text(
                'The Print Shack',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d2963),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Coming soon: Custom printing services for your society, club, or event!',
                style: TextStyle(fontSize: 18, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
