import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:oasis_coiffure/widgets/ChampSaisieWidget.dart';
import 'package:oasis_coiffure/widgets/BoutonWidget.dart';

class MotDePasseOubliePage extends StatefulWidget {
  const MotDePasseOubliePage({super.key});

  @override
  State<MotDePasseOubliePage> createState() => _MotDePasseOubliePageState();
}

class _MotDePasseOubliePageState extends State<MotDePasseOubliePage> {
  TextEditingController _email = TextEditingController();

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
            "Mot de passe oublié?",
            style: TextStyle(
                color: ColorPages.COLOR_DORE_FONCE, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Stack(
        children: [_body()],
      ),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _text(),
        _champ(),
        SizedBox(
          height: 3.h,
        ),
        _bouton()
      ],
    );
  }

  Widget _champ() {
    return Container(
        margin: EdgeInsets.all(20.sp),
        child: ChampSaisieWidget(
          prefixIcon: Icons.email,
          label: 'email',
          hintext: "email",
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "Champs obligatoire*";
            }
            return null;
          },
          ctrl: _email,
        ));
  }

  Widget _text() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20.sp),
          child: Text(
            "veuillez entrez votre adresse email pour réinitialiser votre mot de passe.",
            style: TextStyle(color: ColorPages.COLOR_GRIS),
          ),
        ),
      ],
    );
  }

  Widget _bouton() {
    return Container(
      child: BoutonWidget(
        onPressed: () {},
        text: "Réinitialiser votre mot de passe",
      ),
    );
  }
}
