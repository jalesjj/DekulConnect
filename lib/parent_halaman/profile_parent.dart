import 'package:flutter/material.dart';

import '../parent_halaman/homeparent.dart';
import '../parent_halaman/aktivitas_di_rumah.dart';

class ProfilParent extends StatelessWidget {
  const ProfilParent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text('Profil Orang Tua'),
        backgroundColor: Colors.lightBlue[100],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/foto_guru.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ibu Aminah',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              'Guru Bahasa Indonesia',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 30),
            const Card(
              child: ListTile(
                leading: Icon(Icons.badge),
                title: Text('NIP'),
                subtitle: Text('123456789'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.book),
                title: Text('Mata Pelajaran'),
                subtitle: Text('Bahasa Indonesia'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text('No. HP'),
                subtitle: Text('0812-3456-7890'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('aminah@sekolah.id'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
                  MaterialPageRoute(builder: (_) => const AktivitasDiRumah()),
                );
              },
            ),
            _buildNavIcon(
              icon: Icons.home_rounded,
              color: const Color(0xFF9C9C9C),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const DashboardParent()),
                );
              },
            ),
            _buildNavIcon(
              icon: Icons.person_rounded,
              color: Colors.black, // Halaman aktif
              onTap: () {
                // Sudah di halaman Profil
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, size: 30, color: color),
    );
  }
}