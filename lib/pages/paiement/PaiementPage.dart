import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:oasis_coiffure/widgets/BoutonWidget.dart';

class PaiementPage extends StatefulWidget {
  const PaiementPage({super.key});

  @override
  State<PaiementPage> createState() => _PaiementPageState();
}

class _PaiementPageState extends State<PaiementPage> {
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
            "Détails du paiement",
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

  Widget _body(){
    return Column(
      children: [_detail(),_text_paiement()],
    );
  }

  Widget _detail(){
    return Container(

      margin: EdgeInsets.all(20.sp),
      child: Column(
        children: [
          Row(
            children: [
              Text("Nom : ", style: TextStyle(color: ColorPages.COLOR_BLANC),),
              Text("Arnold Client",style: TextStyle(color: ColorPages.COLOR_BLANC)),

            ],
          ),
          Divider(height:2.h,color: ColorPages.COLOR_GRIS,),
          Row(
            children: [
              Text("Date : ",style: TextStyle(color: ColorPages.COLOR_BLANC)),
              Text("02/02/2024",style: TextStyle(color: ColorPages.COLOR_BLANC)),
            ],
          ),
          Divider(height:2.h,color: ColorPages.COLOR_GRIS,),
          Row(
            children: [
              Text("Heure : ",style: TextStyle(color: ColorPages.COLOR_BLANC)),
              Text("08:00-09:00",style: TextStyle(color: ColorPages.COLOR_BLANC)),
            ],
          ),
          Divider(height:2.h,color: ColorPages.COLOR_GRIS,),
          Row(
            children: [
              Text("Prix : ",style: TextStyle(color: ColorPages.COLOR_BLANC)),
              Text("\$10",style: TextStyle(color: ColorPages.COLOR_BLANC)),
            ],
          ),
          Divider(height:2.h,color: ColorPages.COLOR_GRIS,),
          Row(
            children: [
              Text("Service : ",style: TextStyle(color: ColorPages.COLOR_BLANC)),
              Text("Couffure",style: TextStyle(color: ColorPages.COLOR_BLANC)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _text_paiement(){
    return Container(
      child: Column(
        children: [
          Text(
            "Selectionner un moyen de paiement",
            style: TextStyle(
                color:ColorPages.COLOR_BLANC,
                fontWeight: FontWeight.bold),),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
              child: Image.asset(
                  "images/card_payement.jpg",
              )),
          BoutonWidget(
              text: "Confirmer",
              onPressed: (){

              }
          )
        ],
      ),
    );
  }
}
