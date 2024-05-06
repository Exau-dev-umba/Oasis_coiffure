import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oasis_coiffure/controllers/ReservationController.dart';
import 'package:oasis_coiffure/controllers/SpecialisationController.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/controllers/CoiffureController.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:oasis_coiffure/utils/Routes.dart';
import 'package:oasis_coiffure/utils/RoutesManager.dart';

class MonApplication extends StatelessWidget {
  GetStorage stockage =GetStorage();
  MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=> CoiffureController(stockage:stockage)),
            ChangeNotifierProvider(create: (_)=> ReservationController(stockage:stockage)),
            ChangeNotifierProvider(create: (_)=> SpecialisationController(stockage:stockage)),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.SplashPage,
              onGenerateRoute: RoutesManager.route,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: ColorPages.COLOR_DORE_FONCE)
                )
              ),
            ),
        );
      }
    );

  }
}
