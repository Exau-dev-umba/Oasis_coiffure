import 'package:flutter/material.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:oasis_coiffure/widgets/ChampSaisieWidget.dart';
import 'package:oasis_coiffure/widgets/BoutonWidget.dart';

class ChangerMotDePassePage extends StatefulWidget {
  const ChangerMotDePassePage({super.key});

  @override
  State<ChangerMotDePassePage> createState() => _ChangerMotDePassePageState();
}

class _ChangerMotDePassePageState extends State<ChangerMotDePassePage> {
  TextEditingController _ancien = TextEditingController();
  TextEditingController _nouveau = TextEditingController();
  TextEditingController _confirmer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPages.COLOR_NOIR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorPages.COLOR_NOIR,
        title: Text(
          "Changer mot de passe",
          style: TextStyle(
              color: ColorPages.COLOR_DORE_FONCE, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [_body()],
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _champ(),
        SizedBox(
          height: 20,
        ),
        _bouton()
      ],
    );
  }

  Widget _champ() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          ChampSaisieWidget(
            prefixIcon: Icons.lock,
            label: 'ancien mot de passe',
            hintext: "ancien mot de passe",
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Champs obligatoire*";
              }
              return null;
            },
            ctrl: _ancien,
          ),
          SizedBox(height: 20,),
          ChampSaisieWidget(
            prefixIcon: Icons.lock,
            label: 'nouveau mot de passe',
            hintext: "nouveau mot de passe",
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Champs obligatoire*";
              }
              return null;
            },
            ctrl: _nouveau,
          ),
          SizedBox(height: 20,),

          ChampSaisieWidget(
            prefixIcon: Icons.lock,
            label: 'confirmer le mot de passe',
            hintext: "confirmer le mot de passe",
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Champs obligatoire*";
              }
              return null;
            },
            ctrl: _confirmer,
          ),
        ],
      ),
    );
  }


  Widget _bouton() {
    return Container(
      child: BoutonWidget(
        onPressed: () {},
        text: "Changer le mot de passe",
      ),
    );
  }
}
