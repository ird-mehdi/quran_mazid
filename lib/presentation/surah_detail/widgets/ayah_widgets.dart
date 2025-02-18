import 'package:flutter/material.dart';

class AyahHeader extends StatelessWidget {
  final int index;

  const AyahHeader({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${index + 1}',
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.right,
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
      ],
    );
  }
}

class ArabicText extends StatelessWidget {
  final String text;

  const ArabicText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
        textAlign: TextAlign.right,
      ),
    );
  }
}

class TranslationText extends StatelessWidget {
  const TranslationText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'All praise is for Allah—Lord of all worlds,Lord of everything in existence including angels, humans, and animals,',
      style: TextStyle(fontSize: 12),
      textAlign: TextAlign.left,
    );
  }
}
