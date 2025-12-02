import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/widgets/cart_item_card.dart';

class AccountManager extends StatefulWidget {
  const AccountManager({Key? key}) : super(key: key);

  @override
  State<AccountManager> createState() => _AccountManagerState();
}

class _AccountManagerState extends State<AccountManager> {
  final _displayNameController = TextEditingController();
  String? _statusMessage;
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    _displayNameController.text = user?.displayName ?? '';
  }

  Future<void> _updateProfile() async {
    setState(() {
      _isUpdating = true;
      _statusMessage = null;
    });
    try {
      await FirebaseAuth.instance.currentUser
          ?.updateDisplayName(_displayNameController.text.trim());
      await FirebaseAuth.instance.currentUser?.reload();
      setState(() {
        _statusMessage = "Profile updated!";
      });
    } catch (e) {
      setState(() {
        _statusMessage = "Failed to update profile.";
      });
    } finally {
      setState(() {
        _isUpdating = false;
      });
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final cartService = CartService();

    if (user == null) {
      // Not signed in, redirect to auth page
      Future.microtask(() {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/auth');
        }
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: const Navbar(title: "Account Manager"),
      endDrawer: const MobileNavDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account Management",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Text("Email:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      Text(user.email ?? "No email",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          )),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _displayNameController,
                    decoration: const InputDecoration(
                      labelText: "Display Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_statusMessage != null)
                    Text(
                      _statusMessage!,
                      style: TextStyle(
                        color: _statusMessage == "Profile updated!"
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isUpdating ? null : _updateProfile,
                    child: _isUpdating
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text("Update Profile"),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _signOut,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Sign Out"),
                  ),
                  const SizedBox(height: 40),
                  const Divider(),
                  const SizedBox(height: 16),
                  const Text(
                    "Your Cart",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  AnimatedBuilder(
                    animation: cartService,
                    builder: (context, _) {
                      final items = cartService.items;
                      if (items.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text('Your cart is empty'),
                        );
                      }
                      return Column(
                        children: [
                          ...items.map((item) => CartItemCard(item: item)),
                          const SizedBox(height: 12),
                          Text(
                            'Total: £${cartService.totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    },
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
