import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';

class BoutonWidgetNoColor extends StatefulWidget {
  final Function onPressed;
  final String text;

  BoutonWidgetNoColor({required this.text, required this.onPressed});

  @override
  State<BoutonWidgetNoColor> createState() => _BoutonWidgetNoColorState();
}

class _BoutonWidgetNoColorState extends State<BoutonWidgetNoColor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: widget.onPressed as void Function()?,
        child: Text(
          widget.text,
           style: TextStyle(
              color: ColorPages.COLOR_DORE_FONCE, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            foregroundColor: ColorPages.COLOR_DORE_FONCE, backgroundColor: Colors.transparent,
            side: BorderSide(color: ColorPages.COLOR_DORE_FONCE),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.sp),
            )),
      ),
    );
  }
}
