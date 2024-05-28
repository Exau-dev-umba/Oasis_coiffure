import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oasis_coiffure/utils/VerificationConnexion.dart';
import 'package:oasis_coiffure/widgets/ToastWidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/pages/demarrage/IntroPage.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';

// import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    setState(() {
      _initializeData();
    });
  }

  Future<void> _initializeData() async {
    // bool isOnline = await VerificationConnexion.hasNetwork();
    Future.delayed(Duration(seconds: 4)).then((_) async {
      VerificationConnexion.checkConnectionPeriodically(() {
        Navigator.pushNamedAndRemoveUntil(context, Routes.IntroPage, (route) => false);
        print("CONNEXION RETABLI");
        // ToastWidget.showToast('Connexion établie !');
      });
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
                width: Adaptive.w(70),
                height: 25.h,
              ),
              SizedBox(
                height: 30.h,
              ),
              LoadingAnimationWidget.inkDrop(
                color: ColorPages.COLOR_DORE_FONCE,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
