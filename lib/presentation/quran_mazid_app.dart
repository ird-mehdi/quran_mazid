import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mazid_app/presentation/audio/ui/audio_player_page.dart';

class QuranMazidApp extends StatelessWidget {
  const QuranMazidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      home: AudioPlayerScreen(),
    );
  }
}
