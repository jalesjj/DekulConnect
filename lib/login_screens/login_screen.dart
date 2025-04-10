import 'package:flutter/material.dart';
import 'parent_login_screen.dart';
import 'teacher_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFA1E3F9), Color(0xFFD1F8EF)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width > 640 ? 63 : 30,
              horizontal: MediaQuery.of(context).size.width > 991 ? 0 : 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width > 991
                      ? 294
                      : MediaQuery.of(context).size.width > 640
                          ? 260
                          : 220,
                  height: MediaQuery.of(context).size.width > 991
                      ? 102
                      : MediaQuery.of(context).size.width > 640
                          ? 90
                          : 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF578FCA),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Selamat Datang Kembali !',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width > 991
                            ? 24
                            : MediaQuery.of(context).size.width > 640
                                ? 22
                                : 20,
                        fontFamily: 'Biryani',
                        fontWeight: FontWeight.w800,
                        shadows: const [
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 10,
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 129),
                Container(
                  width: MediaQuery.of(context).size.width > 991 ? 325 : double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width > 991 ? double.infinity : 325,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF73D2F7),
                        Color(0xFF6DB1CC),
                        Color(0xFF528599),
                      ],
                      stops: [0.51, 0.905, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width > 640 ? 22 : 15,
                  ),
                  child: Column(
                    children: [
                      _buildLoginOption(
                        context: context,
                        imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/144aeb0a9b681d924faac73a7476808a1190605d',
                        text: 'Login Sebagai Orang Tua',
                        altText: 'Parent icon',
                      ),
                      const SizedBox(height: 41),
                      _buildLoginOption(
                        context: context,
                        imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/825a5cbb6fd186319388c10251049207fbd6be19',
                        text: 'Login Sebagai Guru',
                        altText: 'Teacher icon',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginOption({
    required BuildContext context,
    required String imageUrl,
    required String text,
    required String altText,
  }) {
    final double containerSize = MediaQuery.of(context).size.width > 640 ? 169 : 140;
    final double imageSize = MediaQuery.of(context).size.width > 640 ? 68 : 55;

    return GestureDetector(
      onTap: () {
        if (text == 'Login Sebagai Orang Tua') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ParentLoginScreen()),
          );
        } else if (text == 'Login Sebagai Guru') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TeacherLoginScreen()),
          );
        }
      },
      child: Center(
        child: Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: const Color(0xFF578FCA),
            border: Border.all(color: Colors.white),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                imageUrl,
                width: imageSize,
                height: imageSize,
                semanticLabel: altText,
              ),
              const SizedBox(height: 12),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: MediaQuery.of(context).size.width > 640 ? 12 : 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
