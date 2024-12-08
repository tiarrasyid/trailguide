import 'package:flutter/material.dart';
import 'package:trailguide/main.dart';

class RegulationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF4F4), // Warna latar belakang yang lembut
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo di bagian atas
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 60,
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              // Kotak konten dengan border melingkar
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Warna latar konten
                    borderRadius:
                        BorderRadius.circular(16.0), // Sudut melingkar
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'regulation',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem ipsum passages, and more recently with desktop publishing software like aldus pagemaker including versions of lorem ipsum.',
                          style: TextStyle(
                            fontSize: 14.0,
                            height: 1.6,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              // Navigasi bawah
              Align(
                alignment: Alignment.bottomRight, // Mengatur posisi tombol
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 100.0,
                      right: 16.0), // Jarak dari tepi bawah dan kanan
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context); // Fungsi untuk kembali ke halaman sebelumnya
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF508D7C), // Warna tombol
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Sudut melingkar
                      ),
                    ),
                    child: Row(
                      mainAxisSize:
                          MainAxisSize.min, // Menyesuaikan ukuran tombol
                      children: [
                        Icon(
                          Icons.arrow_back, // Ikon panah
                          color: Colors.white,
                          size: 18.0,
                        ),
                        SizedBox(width: 8.0), // Jarak antara ikon dan teks
                        Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
