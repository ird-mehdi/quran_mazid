import 'package:flutter/material.dart';
import 'package:quran_mazid_app/domain/entities/surha_entity.dart';
import 'package:quran_mazid_app/presentation/surah_detail/widgets/ayah_widgets.dart';

class AyahItem extends StatelessWidget {
  final SurhaEntity ayah;
  final int index;

  const AyahItem({super.key, required this.ayah, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      color: index % 2 == 0 ? const Color(0xFFF4EDE3) : const Color(0xFFFDFAF3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AyahHeader(index: index),
          ArabicText(text: ayah.ayah),
          const SizedBox(height: 16),
          const TranslationText(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
