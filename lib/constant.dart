import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kTextformFieldDecoration = InputDecoration(
  hintText: 'Enter your new task name',
  hintStyle: GoogleFonts.mcLaren(
    textStyle: TextStyle(
      color: Colors.grey,
    ),
  ),
);

const kTextFormFeildstyel = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.w500,
  fontSize: 16,
);
const kTasksubtitlestyle = TextStyle(
  fontWeight: FontWeight.w500,
  color: Colors.grey,
  fontSize: 14,
);

const kDateTimeStyele = TextStyle(
  fontSize: 11,
  color: Colors.blueGrey,
);

const kAlertTitleStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontSize: 25,
  fontWeight: FontWeight.w600,
);
const kAlertDescStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
  color: Colors.blueGrey,
);
const kAlertButtonstyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
