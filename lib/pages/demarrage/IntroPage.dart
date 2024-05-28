import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:oasis_coiffure/utils/Routes.dart';
import 'package:oasis_coiffure/widgets/BoutonWidget.dart';
import 'package:oasis_coiffure/widgets/BoutonWidgetNoColor.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(3.sp), // status bar color
    ));
    return Scaffold(
      backgroundColor: ColorPages.COLOR_NOIR,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Container(
                height: 65.h,
                width: Adaptive.w(double.infinity),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/african-american-hairdresser-cuts-african-american-man-s-hair-with-clipper-clipper-haircut.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 35.sp, left: 20.sp),
                  color: ColorPages.COLOR_NOIR.withOpacity(3.5.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                  width:Adaptive.w(80),
                            child: RichText(
                              text: TextSpan(
                                text:
                                    "Nous vous proposons les meilleurs de nos services.",
                                style: TextStyle(
                                  color: ColorPages.COLOR_GRIS,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: Adaptive.w(double.infinity),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      ColorPages.COLOR_NOIR,
                      ColorPages.COLOR_TRANSPARENT,
                    ],
                    stops: [
                      2.5.sp,5.sp
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )
            ),
          ),
          Positioned(
            bottom: 55.sp,
            left: 24.sp,
            child: Container(
              width: Adaptive.w(40),
              child: Text(
                "Reservez votre place pour une coiffure moderne.",
                style: TextStyle(
                  color: ColorPages.COLOR_GRIS,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 2.sp,
            left: 24.sp,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BoutonWidget(
                      text: "Se connecter",
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, Routes.ConnexionPage, (route) => false,);
                      }),
                  SizedBox(height: 20),
                  BoutonWidgetNoColor(
                      text: "Créer mon compte",
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, Routes.ConnexionPage, (route) => false,);
                      }),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
