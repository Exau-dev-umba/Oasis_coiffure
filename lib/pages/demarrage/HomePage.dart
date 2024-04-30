import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:oasis_coiffure/utils/Routes.dart';
import 'package:oasis_coiffure/widgets/CardWidget.dart';
import 'package:oasis_coiffure/widgets/BottomNavBarWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPages.COLOR_NOIR,
      body: SizedBox(
        child: _body(),
      ),


    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 30.h,
              width: Adaptive.w(double.infinity) ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.sp),
                  bottomRight: Radius.circular(30.sp),
                ),
                image: DecorationImage(
                  image: AssetImage("images/image3.jpg"),
                  fit: BoxFit.fill,
                ),
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
            Center(
              child: Container(
                //padding: EdgeInsets.only(top: 25.sp, left: 5.sp),
                color: ColorPages.COLOR_NOIR.withOpacity(3.5.sp),
                child: Column(
                  children: [
                    Image.asset(
                      "images/logo.png",
                      width: Adaptive.w(40) ,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Bienvenu(e), ",
                        style: TextStyle(
                          color: ColorPages.COLOR_BLANC,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.8.h,),
                    RichText(
                      text: TextSpan(
                        text: "Guest_user0001",
                        style: TextStyle(
                          color: ColorPages.COLOR_DORE_FONCE,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        _text_categorie(),
        Flexible(
          child: _cardModel2(),
        ),
        _text_service(),
        _coiffure_liste(),
      ],
    );
  }

  Widget _titre_widget() {
    return Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.sp),
                  bottomRight: Radius.circular(30.sp)),
              image: DecorationImage(
                image: AssetImage("images/image3.jpg"),
                fit: BoxFit.fill,
              )),
          child: Container(
            padding: EdgeInsets.only(top: 60.sp, left: 20.sp),
            color: ColorPages.COLOR_NOIR.withOpacity(4.sp),
            child: Column(
              children: [
                Column(
                  children: [
                    Image.asset(
                      "images/logo.png",
                      width: Adaptive.w(50) ,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Bienvenu(e), ",
                        style: TextStyle(
                            color: ColorPages.COLOR_BLANC,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Schyler',
                            fontSize: 15.sp),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "exau_umba",
                        style: TextStyle(
                            color: ColorPages.COLOR_DORE_FONCE,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Schyler',
                            fontSize: 15.sp),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget _text_categorie() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Text(
            "Spécialisation",
            style: TextStyle(
                color: ColorPages.COLOR_DORE_FONCE,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
        ),
      ],
    );
  }

  Widget _cardModel2() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Row(
          children: [
            Container(
              width: Adaptive.w(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/coiffure_model/Nuque arrondie.webp"),
                  SizedBox(height: 2.h,),
                  Text("Nuque arrondie", style: TextStyle(color: ColorPages.COLOR_BLANC, fontSize: 14.sp),)
                ],
              ),
            ),
            SizedBox(width: Adaptive.w(5),),
            Container(
              width: Adaptive.w(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/coiffure_model/Nuque droite.webp"),
                  SizedBox(height: 2.h,),
                  Text("Nuque droite", style: TextStyle(color: ColorPages.COLOR_BLANC, fontSize: 14.sp),)
                ],
              ),
            ),
            SizedBox(width: Adaptive.w(5),),
            Container(
              width: Adaptive.w(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/coiffure_model/Tour d’oreille.webp"),
                  SizedBox(height: 2.h,),
                  Text("Tour d’oreille", style: TextStyle(color: ColorPages.COLOR_BLANC, fontSize: 14.sp),)
                ],
              ),
            ),
            SizedBox(width: Adaptive.w(5),),
            Container(
              width: Adaptive.w(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/coiffure_model/Désépaissir les cheveux.webp"),
                  SizedBox(height: 2.h,),
                  Text("Désépaissir les cheveux", style: TextStyle(color: ColorPages.COLOR_BLANC, fontSize: 14.sp),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardModel() {
    return Row(
      children: [
        Flexible(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Container(
              width: Adaptive.w(50) ,
              height: 40.h,
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 0,
                  color: ColorPages.COLOR_BLANC,
                  child: Column(
                    children: [
                      Container(
                        color: ColorPages.COLOR_BLANC,
                        margin: EdgeInsets.only(top: 20.0.sp),
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              color: ColorPages.COLOR_NOIR,
                              size: 30.sp,
                            ),
                            Text(
                              "Homme",
                              style: TextStyle(
                                color: ColorPages.COLOR_NOIR,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            width: 150,
            height: 100,
            child: GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 0,
                color: ColorPages.COLOR_BLANC,
                child: Column(
                  children: [
                    Container(
                      color: ColorPages.COLOR_BLANC,
                      margin: EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person,
                            color: ColorPages.COLOR_NOIR,
                            size: 40.0,
                          ),
                          Text(
                            "Femme",
                            style: TextStyle(
                              color: ColorPages.COLOR_NOIR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _text_service() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Text(
            "Nos services",
            style: TextStyle(
                color: ColorPages.COLOR_DORE_FONCE,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
        ),
      ],
    );
  }

  Widget _coiffure_liste(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CardWidget(
              imagePath: "images/image3.jpg",
              buttonText: "Choisir",
              text: "Coiffeur Laurent",
              text_coif: "Coiffeure",
              text_annee: "2 ans",
              onPressed: (){
                Navigator.pushNamed(context, Routes.DetailsPage);
              }),
          CardWidget(
              imagePath: "images/image4.jpg",
              buttonText: "Choisir",
              text: "Coiffeur Besty",
              text_coif: "Coiffeuse",
              text_annee: "1 ans",
              onPressed: (){}),
          CardWidget(
              imagePath: "images/image5.jpg",
              buttonText: "Choisir",
              text: "Coiffeur Jessy",
              text_coif: "Coiffeur",
              text_annee: "5 ans d'expérience",
              onPressed: (){})
        ],
      ),
    );
  }
}
