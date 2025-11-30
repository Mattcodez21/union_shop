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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Union logo at the top center
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Image.asset(
                'assets/images/upsu_logo.png',
                height: 80,
              ),
            ),
            const Text(
              'Sign in',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Choose how you'd like to sign in",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            // Sign in with shop button
            SizedBox(
              width: 260,
              child: ElevatedButton(
                onPressed: null, // Non-functional
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4d2963), // Purple
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Sign in with shop'),
              ),
            ),
            const SizedBox(height: 24),
            // "or" divider text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    indent: 40,
                    endIndent: 12,
                    color: Colors.grey[300],
                  ),
                ),
                const Text(
                  'or',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    indent: 12,
                    endIndent: 40,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Authentication Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sign in or create an account to continue.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
