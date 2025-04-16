import '../aktivitas_parent/isi_aktivitas.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../parent_halaman/homeparent.dart';
import '../parent_halaman/profile_parent.dart';

 // Pastikan file ini ada untuk navigasi

class AktivitasDiRumah extends StatefulWidget {
  const AktivitasDiRumah({super.key});

  @override
  _AktivitasDiRumahState createState() => _AktivitasDiRumahState();
}

class _AktivitasDiRumahState extends State<AktivitasDiRumah> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Aktivitas Di Rumah',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
            const Text("Pilih Tanggal", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.blue),
                    const SizedBox(width: 10),
                    Text(DateFormat.yMMMEd().format(_selectedDate)),
                  ], 
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          IsiAktivitas(selectedDate: _selectedDate),
                    ), 
                  ); 
                },
                child: const Text('Masukan Aktivitas'),
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
              color: Colors.black, // Halaman aktif
              onTap: () {},
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
              color: const Color(0xFF9C9C9C),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfilParent()),
                );
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