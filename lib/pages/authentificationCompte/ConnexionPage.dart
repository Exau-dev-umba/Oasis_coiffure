import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:oasis_coiffure/utils/Routes.dart';
import 'package:oasis_coiffure/widgets/BoutonWidget.dart';
import 'package:oasis_coiffure/widgets/ChampSaisieWidget.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPages.COLOR_NOIR,
      body: Stack(
        children: [_body(context)],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Center(
            child: Container(
                child: Column(children: [
          SizedBox(
            height: 5.h,
          ),
          _logo(),
          _text(),
          _text_connexion(),
          SizedBox(
            height: 2.h,
          ),
          _form(),
          text_password_oublie(),
          SizedBox(
            height: 3.h,
          ),
          _bouton_connexion(),
          SizedBox(
            height: 1.5.h,
          ),
          _compte_text()
        ]))),
      ),
    );
  }

  Widget _logo() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "images/logo.png",
            width: Adaptive.w(50),
          ),
        ]);
  }

  Widget _text() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(
            "Se connecter",
            style: TextStyle(
                color: ColorPages.COLOR_DORE_FONCE,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
        ),
      ],
    );
  }

  Widget _text_connexion() {
    return Container(
      child: Text(
        "Connectez-vous pour utiliser l'application.",
        style: TextStyle(
          color: ColorPages.COLOR_GRIS,
          fontSize: 13.sp,
        ),
      ),
    );
  }

  Widget _form() {
    return Container(
      margin: EdgeInsets.all(20.sp),
      child: Column(
        children: [
          ChampSaisieWidget(
            prefixIcon: Icons.email,
            ctrl: _email,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Champs obligatoire*";
              }
              return null;
            },
            label: 'email',
            hintext: 'email',
          ),
          SizedBox(
            height: 3.h,
          ),
          ChampSaisieWidget(
            prefixIcon: Icons.lock,
            ctrl: _password,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Champs obligatoire*";
              }
              return null;
            },
            label: 'password',
            hintext: 'password',
          )
        ],
      ),
    );
  }

  Widget _bouton_connexion() {
    return Container(
      child: BoutonWidget(
          text: "Se connecter",
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.BottomNavBarWidget,
              (route) => false,
            );
          }),
    );
  }

  Widget _compte_text() {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          children: [
            Text(
              "Vous avez n'avez pas de compte?",
              style: TextStyle(
                color: ColorPages.COLOR_BLANC,
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.CreationComptePage);
                },
                child: Text(
                  "Créer un compte",
                  style: TextStyle(
                      color: ColorPages.COLOR_DORE_FONCE,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorPages.COLOR_DORE_FONCE),
                ))
          ],
        ),
      ),
    );
  }

  Widget text_password_oublie() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.sp),
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.MotDePasseOubliePage);
            },
            child: Text(
              "Mot de passe oublié?",
              style: TextStyle(
                  color: ColorPages.COLOR_BLANC,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorPages.COLOR_BLANC),
            ),
          ),
        ),
      ],
    );
  }
}
