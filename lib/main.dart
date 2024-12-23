import 'package:flutter/material.dart';
import 'package:hi_gas/providers/FuelRequestProvider.dart';
import 'package:hi_gas/providers/LanguageProvider.dart';
import 'package:hi_gas/providers/LocationProvider.dart';
import 'package:hi_gas/screens/MainScreen/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => FuelRequestProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hi-Gas',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const MainScreen(isDriver: true),
      ),
    );
  }
}
