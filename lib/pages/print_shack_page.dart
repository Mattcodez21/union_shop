import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';

class PrintShackPage extends StatefulWidget {
  const PrintShackPage({Key? key}) : super(key: key);

  @override
  State<PrintShackPage> createState() => _PrintShackPageState();
}

class _PrintShackPageState extends State<PrintShackPage> {
  String customText = '';
  String selectedFont = 'Arial';
  Color selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: 'The Print Shack'),
      endDrawer: const MobileNavDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.print, size: 64, color: Color(0xFF4d2963)),
              const SizedBox(height: 24),
              const Text(
                'The Print Shack',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d2963),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Coming soon: Custom printing services for your society, club, or event!',
                style: TextStyle(fontSize: 18, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Text input field for custom text
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter your custom text',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    customText = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
