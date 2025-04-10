import 'package:flutter/material.dart';
import 'aktivitas_di_sekolah.dart';
import 'profil_guru.dart';

class DashboardGuru extends StatelessWidget {
  const DashboardGuru({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFA1E3F9), Color(0xFFD1F8EF)],
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 88.0),
                  child: Column(
                    children: [
                      _buildWelcomeCard(),
                      _buildVisionSection(),
                      _buildMissionSection(),
                      _buildActivityButtons(context),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildNavigationBar(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 75, 24, 0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              'di Dashboard Guru',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisionSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Visi',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '''1. Membangun generasi cerdas, aktif dan berprestasi.
2. Membentuk generasi bangsa yang berbudi luhur.
3. Membangun pendidikan yang maju dan berkelas Internasional.
4. Menjadi panutan dalam prestasi, pendidikan dan moral.
5. Menjadi pelopor sekolah berkonsep lingkungan yang mendukung adiwiyata.
6. Menjadi lembaga pendidikan yang berdedikasi dalam mendidik generasi bangsa agar tumbuh berkualitas, bertakwa dan menjunjung tinggi adab.
7. Mewujudkan individu berkelas yang bebas narkoba, berorientasi dan cerdas.''',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 13,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Misi',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '''1. Memasukkan mata pelajaran pendidikan lingkungan hidup di sekolah dan membangun sarana dan prasarana kebersihan yang memadai.
2. Menyediakan beragam ekstrakurikuler untuk mengembangkan bakat dan prestasi siswa-siswi.
3. Menyiapkan tenaga pendidik yang profesional dan berkualitas untuk proses belajar mengajar di sekolah.''',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 13,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 59, vertical: 16),
      child: Column(
        children: [
          _buildActivityButton(context, 'lihat aktifitas di sekolah', () {
            // tambahkan navigasi jika sudah ada halaman sekolah
          }),
          const SizedBox(height: 16),
          _buildActivityButton(context, 'lihat aktifitas di rumah', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AktivitasDiSekolah()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildActivityButton(BuildContext context, String text, VoidCallback onPressed) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFFD8D8D8)),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return Container(
      height: 88,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F2F2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavIcon(
            icon: Icons.description_rounded,
            color: const Color(0xFF9C9C9C),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AktivitasDiSekolah()),
              );
            },
          ),
          _buildNavIcon(
            icon: Icons.home_rounded,
            color: Colors.black,
            onTap: () {
               // Sudah di halaman dashboard
            },
          ),
          _buildNavIcon(
            icon: Icons.person_rounded,
            color: const Color(0xFFDBDADA),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ProfilGuru()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon({required IconData icon, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, size: 30, color: color),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DashboardGuru(),
  ));
}
