import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'PredictionPage.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _formKey = GlobalKey<FormState>();
  final _totalDistanceController = TextEditingController();
  final _totalElevationGainController = TextEditingController();
  final _averageSpeedController = TextEditingController();
  final _averageGradientController = TextEditingController();

  void _navigateToPredictionPage() {
    // Gunakan validate() dan periksa hasilnya
    if (_formKey.currentState!.validate()) {
      // Buat map dari data form
      final formData = {
        'distance': _totalDistanceController.text,
        'elevation': _totalElevationGainController.text,
        'speed': _averageSpeedController.text,
        'gradient': _averageGradientController.text,
      };

      // Navigasi ke halaman prediksi
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PredictionPage(formData: formData),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F1EF),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Image.asset('assets/logo.png', height: 48),
            ),
          ),
          Container(
            width: 332,
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/mount.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Input total distance*',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _totalDistanceController,
                        decoration: InputDecoration(
                          hintText: 'Total distance',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter total distance';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Input total elevation gain*',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _totalElevationGainController,
                        decoration: InputDecoration(
                          hintText: 'Total elevation gain',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter total elevation gain';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Input average speed*',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _averageSpeedController,
                        decoration: InputDecoration(
                          hintText: 'Average speed',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter average speed';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Input average gradient*',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _averageGradientController,
                        decoration: InputDecoration(
                          hintText: 'Average gradient',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter average gradient';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: _navigateToPredictionPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF508D7C),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Prediction',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward,
                                size: 18,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _totalDistanceController.dispose();
    _totalElevationGainController.dispose();
    _averageSpeedController.dispose();
    _averageGradientController.dispose();
    super.dispose();
  }
}
