import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/pages/demarrage/IntroPage.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oasis_coiffure/utils/Routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IntroPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPages.COLOR_NOIR,
      body: SizedBox(
        width: Adaptive.w(double.infinity),
        child: Container(
          margin: EdgeInsets.only(top: 70.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo.png",
                width: Adaptive.w(80) ,
                height: 25.h,
              ),
              SpinKitHourGlass(
                color: ColorPages.COLOR_DORE_FONCE,
                size: 25.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
