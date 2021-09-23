import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l2t_beta/location_flow/location_flow.dart';

import 'home/view/home.dart';

void main() => runApp(MyApp(locationRepository: LocationRepository()));

class MyApp extends StatelessWidget {
  MyApp({Key? key, required LocationRepository locationRepository})
      : _locationRepository = locationRepository,
        super(key: key);

  final LocationRepository _locationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _locationRepository,
      child: MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryTextTheme: TextTheme(
            headline1: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: Colors.black),
          ),
          accentColor: const Color(0xFF13B9FF),
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        ),
      ),
    );
  }
}
