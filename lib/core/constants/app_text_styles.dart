import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoboshu_mock_ui/core/constants/app_colors.dart';

final kStyleTextMain = GoogleFonts.raleway(
  color: Colors.white,
);

final kStyleTextNumeric = GoogleFonts.lato(
  color: Colors.white,
);

final kStyleBodyMain = kStyleTextMain.copyWith(
    fontSize: 16, fontWeight: FontWeight.w600);

final kStyleTextSubtitle = GoogleFonts.raleway(
  color: kGrayBright,
);

final kStyleHeading = kStyleTextMain.copyWith(
    fontSize: 24, fontWeight: FontWeight.w600);