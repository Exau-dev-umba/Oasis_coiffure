import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';

class CalendrierPage extends StatefulWidget {
  const CalendrierPage({super.key});

  @override
  State<CalendrierPage> createState() => _CalendrierPageState();
}

class _CalendrierPageState extends State<CalendrierPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPages.COLOR_NOIR,
      appBar: AppBar(

        automaticallyImplyLeading: false,
        backgroundColor: ColorPages.COLOR_NOIR,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Text(
            "Mon Agenda",
            style: TextStyle(
                color: ColorPages.COLOR_DORE_FONCE, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
