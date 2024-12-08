import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trailguide/main.dart';

class PredictionPage extends StatelessWidget {
  final Map<String, dynamic> formData;

  const PredictionPage({
    Key? key,
    required this.formData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F1EF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF508D7C)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Image.asset('assets/logo.png', height: 32),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(), // Tidak scrollable
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHikingStatsCard(), // Scrollable
                    _buildEquipmentCard(), // Scrollable
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the main.dart file
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF508D7C),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Back to Home ',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.home,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Prediction for ${formData['mountain']}',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF508D7C),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Starting point: ${formData['latitude']}, ${formData['longitude']}',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHikingStatsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 1.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estimated Hiking Details',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              _buildStatRow(
                  Icons.timer_outlined, 'Duration', '4 hours 30 minutes'),
              _buildStatRow(Icons.trending_up, 'Distance', '5 kilometers'),
              _buildStatRow(Icons.height, 'Elevation Gain', '300 meters'),
              _buildStatRow(Icons.speed, 'Avg. Speed', '2.5 km/h'),
              _buildStatRow(Icons.show_chart, 'Difficulty', 'Moderate'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF508D7C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF508D7C), size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
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
      'Water Bottle',
      'Hiking Poles',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 28.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recommended Equipment',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
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
            ],
          ),
        ),
      ),
    );
  }
}
