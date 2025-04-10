import 'package:flutter/material.dart';

class DashboardParent extends StatelessWidget {
  const DashboardParent({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              const SizedBox(height: 48),
              const Text(
                'Selamat Datang di Dashboard Orang Tua',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Image.network(
                          'https://cdn.builder.io/api/v1/image/assets/TEMP/86fde5df339af6f7e43b9b67151e439e8cc64148',
                          width: MediaQuery.of(context).size.width > 991
                              ? 315
                              : MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.width > 991 ? 315 : null,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 40),
                        _buildActionButton('lihat aktifitas di sekolah'),
                        const SizedBox(height: 24),
                        _buildActionButton('lihat aktifitas di rumah'),
                        const SizedBox(height: 24),
                        _buildActionButton('lihat nilai'),
                        const SizedBox(height: 24), // agar tidak mentok
                      ],
                    ),
                  ),
                ),
              ),
              _buildBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD8D8D8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            // aksi tombol di sini kalau mau ditambah
          },
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 21,
                letterSpacing: 0.199,
                height: 1.5,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 88,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F2F2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 15,
            offset: const Offset(1, 1),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavIcon(Icons.description, color: const Color(0xFF9C9C9C)),
          _buildNavIcon(Icons.home, color: Colors.black),
          _buildNavIcon(Icons.person, color: const Color(0xFFDBDADA)),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, {required Color color}) {
    return SizedBox(
      width: 28,
      height: 28,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: color),
        onPressed: () {},
      ),
    );
  }
}
