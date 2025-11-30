import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In / Register'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Union logo at the top center
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Image.asset(
                      'assets/images/upsu_logo.png',
                      height: 80,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign in',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Choose how you'd like to sign in",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Sign in with shop button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: null, // Non-functional
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963), // Purple
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text('Sign in with shop'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // "or" divider text
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                          endIndent: 12,
                        ),
                      ),
                      const Text(
                        'or',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                          indent: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Email TextFormField with border styling
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Continue button (grey, non-functional)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: null, // Non-functional
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black54,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 0,
                      ),
                      child: const Text('Continue'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
