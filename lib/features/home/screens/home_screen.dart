import 'package:flutter/material.dart';
import 'package:nectar_store/core/routes/app_routes.dart';
import 'package:nectar_store/features/auth/data/auth_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthService _authService = AuthService();

  Future<void> _logout(BuildContext context) async {
    await _authService.signOut();

    if (!context.mounted) return;

    Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final user = _authService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nectar Store'),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        spacing: 100,
        children: [
          InkWell(
            onTap: () => AppRoutes.search,
            child: Container(
              height: 50,
              width: 345,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              // child: TextField(
              //   decoration: InputDecoration(
              //     icon: Icon(Icons.search, color: Colors.grey),
              //     hintText: 'Search Store',
              //     border: InputBorder.none,
              //   ),
              // ),
            ),
          ),
          Center(
            child: Text(
              'Welcome ${user?.displayName ?? user?.email ?? 'User'}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
