import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greggs_booking/homepage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        colorScheme: ColorScheme.fromSeed(
            background: Color.fromARGB(255, 241, 250, 255),
            seedColor: const Color.fromARGB(255, 0, 110, 176)),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 239, 139, 3),
          side: const BorderSide(color: Color.fromARGB(255, 239, 139, 3)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        )),
        filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
          disabledBackgroundColor: const Color.fromARGB(255, 239, 139, 3),
          disabledForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        )),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
