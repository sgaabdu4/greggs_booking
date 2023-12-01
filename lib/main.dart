import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greggs_booking/api_classes.dart';
import 'package:greggs_booking/homepage.dart';
import 'package:greggs_booking/providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<GreggsAPI> greggsAPI = ref.watch(greggsAPIProvider);
    return MaterialApp(
        title: 'Flutter Demo',

        //set themes for the app
        theme: ThemeData(
          dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          colorScheme: ColorScheme.fromSeed(
              background: const Color.fromARGB(255, 241, 250, 255),
              seedColor: const Color.fromARGB(255, 0, 110, 176)),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 239, 139, 3),
            side: const BorderSide(color: Color.fromARGB(255, 239, 139, 3)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          )),
          filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
            disabledBackgroundColor: const Color.fromARGB(255, 239, 139, 3),
            disabledForegroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          )),
        ),
        
        //futureprovider that fetches the json
        home: greggsAPI.when(
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          error: (err, stack) => Text('Error: $err'),
          data: (data) => const MyHomePage(),
        ));
  }
}
