import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';

class BoutonWidget extends StatefulWidget {
  final Function onPressed;
  final String text;

  BoutonWidget({required this.text, required this.onPressed});

  @override
  State<BoutonWidget> createState() => _BoutonWidgetState();
}

class _BoutonWidgetState extends State<BoutonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPages.COLOR_DORE_FONCE,
      width: Adaptive.w(87),
      height: 6.h,
      child: ElevatedButton(
        onPressed: widget.onPressed as void Function()?,
        child: Text(
          widget.text,
          style: TextStyle(
              color: ColorPages.COLOR_BLANC, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPages.COLOR_DORE_FONCE,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.sp),
              side: BorderSide(color: ColorPages.COLOR_DORE_FONCE)
            )),
      ),
    );
  }
}
