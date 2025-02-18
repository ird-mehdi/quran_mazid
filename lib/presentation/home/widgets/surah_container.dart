import 'package:flutter/material.dart';
import 'package:quran_mazid_app/domain/entities/surha_name_entity.dart';
import 'package:quran_mazid_app/presentation/home/ui/home_page.dart';
import 'package:quran_mazid_app/presentation/surah_detail/ui/surah_detail_page.dart';

class Sura {
  final int number;
  final String name;
  final String location;
  final int verses;
  final String arabicName;

  Sura({
    required this.number,
    required this.name,
    required this.location,
    required this.verses,
    required this.arabicName,
  });
}

class SuraListScreen extends StatelessWidget {
  final List<SurhaNameEntity> surahs;

  const SuraListScreen({super.key, required this.surahs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFAF3),
      body: ListView.builder(
        itemCount: surahs.length,
        itemBuilder: (context, index) {
          final surah = surahs[index];
          return SuraListItem(
            surah: Sura(
              number: surah.number,
              name: surah.name,
              location: surah.location,
              verses: surah.verses,
              arabicName: surah.arabicName,
            ),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ),
          );
        },
      ),
    );
  }
}

class SuraListItem extends StatelessWidget {
  final Sura surah;
  final VoidCallback onTap;

  const SuraListItem({super.key, required this.surah, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurahDetailPage(surahNumber: surah.number),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200, width: 1.0),
          ),
        ),
        child: Row(
          children: [
            // Left - Surah Number
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1.0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  surah.number.toString().padLeft(2, '0'),
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Center - Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${surah.location} • ${surah.verses} Verses',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            // Right - Arabic Name
            Text(
              surah.arabicName,
              style: const TextStyle(
                fontSize: 20,
                fontFamily:
                    'Arabic', // Make sure to add Arabic font to pubspec.yaml
              ),
            ),
          ],
        ),
      ),
    );
  }
}
