import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../parent_halaman/homeparent.dart'; 

class ParentLoginScreen extends StatefulWidget {
  const ParentLoginScreen({Key? key}) : super(key: key);

  @override
  State<ParentLoginScreen> createState() => _ParentLoginScreenState();
}

class _ParentLoginScreenState extends State<ParentLoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String useremail = "j";
  String pass = "123";
  String notif = "";

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login(String username, String password) {
    if (username == useremail && password == pass) {
      setState(() {
        notif = "";
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardParent()),
      );
    } else {
      setState(() {
        notif = "Username atau password salah";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFA1E3F9), Color(0xFFD1F8EF)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              constraints: const BoxConstraints(maxWidth: 480),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.network(
                    'https://cdn.builder.io/api/v1/image/assets/2520c6a0470e4350bca31012fe1eddac/e10d6df4e49b5826141bfaecefedacf112000e1e?placeholderIfAbsent=true',
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 100),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(87, 143, 202, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTextField(
                          icon: Icons.person,
                          hintText: 'Username',
                          controller: _usernameController,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          icon: Icons.lock_rounded,
                          hintText: 'Password',
                          controller: _passwordController,
                          isPassword: true,
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            login(_usernameController.text, _passwordController.text);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(54, 116, 181, 1),
                              borderRadius: BorderRadius.circular(70),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: const Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          notif,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            'kembali ke opsi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hintText,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(70),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
