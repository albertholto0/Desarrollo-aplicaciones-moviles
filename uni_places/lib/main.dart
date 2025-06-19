import 'package:flutter/material.dart';
import 'package:uni_places/configurations/app_theme.dart';
//import 'package:uni_places/domain/place.dart';
import 'package:uni_places/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:uni_places/screens/place_info_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: HomeScreen(),
      //home: PlaceInfoScreen(place: Place(name: "Redes")),
      debugShowCheckedModeBanner: false,
    );
  }
}
