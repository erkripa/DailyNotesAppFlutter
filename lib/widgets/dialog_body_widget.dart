
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DialogBodyWidget extends StatelessWidget {
  const DialogBodyWidget({
    Key? key, this.dialogTitle, this.dialogDesc,
  }) : super(key: key);

  final String? dialogTitle;
  final String? dialogDesc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dialogTitle!,
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          dialogDesc!,
          textAlign: TextAlign.center,
          style: GoogleFonts.mcLaren(
            textStyle: TextStyle(
              color: Colors.blueGrey,
              fontSize: 13,
              fontWeight: FontWeight.w600,
          ),
        ),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
