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

  final List<String> fontOptions = ['Arial', 'Roboto', 'Courier'];
  final Map<String, Color> colorOptions = {
    'Black': Colors.black,
    'Red': Colors.red,
    'Blue': Colors.blue,
    'Purple': Colors.purple,
  };

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
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/print-shack-about');
                },
                icon: const Icon(Icons.info_outline),
                label: const Text('About Print Shack'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4d2963),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
              const SizedBox(height: 32),
              // Preview widget
              Container(
                width: 320,
                height: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  customText.isEmpty
                      ? 'Your custom text will appear here'
                      : customText,
                  style: TextStyle(
                    fontSize: 28,
                    color: selectedColor,
                    fontFamily: selectedFont == 'Roboto'
                        ? 'Roboto'
                        : selectedFont == 'Courier'
                            ? 'monospace'
                            : null, // Default for Arial
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              // Text input field for custom text
              TextField(
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Enter your custom text',
                  border: OutlineInputBorder(),
                  counterText: '', // Hide default counter
                ),
                onChanged: (value) {
                  setState(() {
                    customText = value;
                  });
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${customText.length}/20',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 24),
              // Font dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Font:',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 16),
                  DropdownButton<String>(
                    value: selectedFont,
                    items: fontOptions
                        .map((font) => DropdownMenuItem(
                              value: font,
                              child: Text(font),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFont = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Color dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Color:',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 16),
                  DropdownButton<Color>(
                    value: selectedColor,
                    items: colorOptions.entries
                        .map((entry) => DropdownMenuItem<Color>(
                              value: entry.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      color: entry.value,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey),
                                    ),
                                  ),
                                  Text(entry.key),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: (color) {
                      setState(() {
                        selectedColor = color!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
