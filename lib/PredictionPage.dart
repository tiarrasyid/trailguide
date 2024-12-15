import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trailguide/main.dart';

class PredictionPage extends StatelessWidget {
  final Map<String, dynamic> formData;

  const PredictionPage({
    Key? key,
    required this.formData,
  }) : super(key: key);

  int get durationInMinutes => formData['duration'] ?? 0;

  String get preparationGuide {
    if (durationInMinutes < 360) return 'Short Hike (< 6 Hours)';
    if (durationInMinutes <= 720) return 'Moderate Hike (6–12 Hours)';
    return 'Long Hike (> 12 Hours)';
  }

  List<String> get preparationDetails {
    if (durationInMinutes < 360) {
      return [
        'Drinking Water: Minimum 1–2 liters to maintain hydration.',
        'Light Snacks: Bring snacks such as bread, biscuits, or fruit.',
        'Comfortable Clothing: Wear quick-drying clothing and trekking shoes.',
      ];
    } else if (durationInMinutes <= 720) {
      return [
        'More Drinking Water: Minimum 3–4 liters or bring a portable water filter.',
        'Ready-to-Eat Food: Rice packets, instant noodles, or canned food.',
        'Raincoat or Poncho: Just in case it rains.',
      ];
    } else {
      return [
        'Camping Equipment: Light tent, sleeping bag, and mattress.',
        'Layers of Clothing: Thick jacket, gloves, and scarf.',
        'Adequate Food: Calculate energy snacks and daily supplements.',
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F1EF),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 0.0),
              child: Image.asset('assets/logo.png', height: 48),
            ),
          ),
          Expanded(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildHikingStatsCard(),
                          _buildEquipmentCard(),
                          _buildPreparationCard(),
                        ],
                      ),
                    ),
                  ),
                  _buildBackToHomeButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 24.0, right: 24.0, top: 5.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Here is an estimate of your hiking trip based on the data entered',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF508D7C),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHikingStatsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Duration Prediction',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F5F4),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.timer_outlined,
                      size: 28,
                      color: Color(0xFF508D7C),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Duration',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${(durationInMinutes ~/ 60)} hours ${(durationInMinutes % 60)} minutes',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEquipmentCard() {
    final equipment = [
      'Hiking Boots',
      'Tent',
      'Gloves',
      'Jacket',
      'First Aid Kit',
      'Headlamp',
    ];

    return _buildCard(
      title: 'Recommended Equipment',
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4,
        ),
        itemCount: equipment.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              const Icon(Icons.check_circle,
                  color: Color(0xFF508D7C), size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  equipment[index],
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPreparationCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Preparation Guide',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                preparationGuide,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: preparationDetails
                    .map(
                      (detail) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 10,
                              color: Color(0xFF508D7C),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                detail,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF508D7C), size: 24),
          const SizedBox(width: 12),
          Text(
            '$label: $value',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackToHomeButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF508D7C), // Warna tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
          label: const Text(
            'Back to Home',
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(Icons.home, color: Colors.white), // Ikon Home
        ),
      ),
    );
  }
}
