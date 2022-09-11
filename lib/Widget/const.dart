import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

myStyle(double? size, Color? clr, [FontWeight? fw]) {
  return GoogleFonts.dmSans(
    fontSize: size,
    color: clr,
    fontWeight: fw,
  );
}

String apikey = "28c995b3691342a082357ec3e9a68055";

String baseUrl = "https://newsapi.org/";
