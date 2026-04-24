import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // ADD THIS IMPORT
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  // Logic to save data so it appears in Chrome's "Application" tab
  void _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Encrypt the password first
    String encryptedPassword = AuthService.encryptPassword(_passwordController.text);

    // Save values to Local Storage
    // We use the 'flutter.' prefix to match the standard shared_preferences output
    await prefs.setString('flutter.registered_name', _nameController.text);
    await prefs.setString('flutter.registered_email', _emailController.text);
    await prefs.setString('flutter.registered_password', encryptedPassword);
    
    // Optional: set a login flag
    await prefs.setBool('flutter.is_logged_in', true);

    print("Data Saved to Local Storage: $encryptedPassword");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              width: 350,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: "Name", prefixIcon: Icon(Icons.person, color: Colors.orange)),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: "Email", prefixIcon: Icon(Icons.email, color: Colors.orange)),
                      validator: (val) => AuthService.isValidEmail(val ?? "") ? null : "Invalid Email",
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password", prefixIcon: Icon(Icons.lock, color: Colors.orange)),
                      validator: (val) => (val != null && val.length >= 6) ? null : "Min 6 characters required",
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _confirmController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Confirm Password", prefixIcon: Icon(Icons.lock_clock, color: Colors.orange)),
                      validator: (val) => val == _passwordController.text ? null : "Passwords do not match",
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // EXECUTE THE SAVE LOGIC HERE
                            _saveUserData(); 
                            
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Registration Successful!")),
                            );
                            
                            Navigator.pop(context); 
                          }
                        },
                        child: const Text("Register"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}