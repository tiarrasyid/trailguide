import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  // Sample data for history items
  static const List<Map<String, dynamic>> searchHistory = [
    {
      'name': 'Mt. Lawu',
      'type': 'mountain',
      'date': '2024-03-15',
      'coordinates': '-7.6275, 111.1913'
    },
    {
      'name': 'Mt. Semeru',
      'type': 'mountain',
      'date': '2024-03-14',
      'coordinates': '-8.1080, 112.9220'
    },
    {
      'name': 'Mt. Rinjani',
      'type': 'mountain',
      'date': '2024-03-13',
      'coordinates': '-8.4145, 116.4577'
    },
    {
      'name': 'Mt. Merbabu',
      'type': 'mountain',
      'date': '2024-03-12',
      'coordinates': '-7.4556, 110.4351'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F1EF),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Image.asset('assets/logo.png', height: 48),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment:
                  Alignment.centerLeft, // Mengatur teks agar rata ke kiri
              child: Text(
                'Your Recent Searches',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: searchHistory.length,
              itemBuilder: (context, index) {
                final searchItem = searchHistory[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF508D7C).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Icon(
                        searchItem['type'] == 'mountain'
                            ? Icons.terrain
                            : Icons.pin_drop,
                        color: const Color(0xFF508D7C),
                      ),
                    ),
                    title: Text(
                      searchItem['name'],
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          'Searched on ${searchItem['date']}',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          'Coordinates: ${searchItem['coordinates']}',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xFF508D7C),
                      ),
                      onPressed: () {
                        // Handle navigation to detail page
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
