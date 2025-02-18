import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quran_mazid_app/core/di/service_locator.dart';
import 'package:quran_mazid_app/presentation/quran_mazid_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.setUp();
  await dotenv.load(fileName: '.env');
  runApp(const QuranMazidApp());
}
