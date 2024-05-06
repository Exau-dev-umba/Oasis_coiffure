import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/controllers/CoiffureController.dart';
import 'package:oasis_coiffure/models/CoiffureModel.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:oasis_coiffure/utils/Routes.dart';
import 'package:oasis_coiffure/widgets/CardWidget.dart';

class CoiffurePage extends StatefulWidget {
  CoiffurePage({super.key});

  @override
  State<CoiffurePage> createState() => _CoiffurePageState();
}

class _CoiffurePageState extends State<CoiffurePage>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 1))
        ..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
      parent: _controller, curve: Curves.easeInOutCubicEmphasized);

  List<CoiffureModel> _foundCoiffures = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var coiffureCtrl = context.read<CoiffureController>();
      coiffureCtrl.getCoiffures();
    });
    super.initState();
  }

  TextEditingController searchEdit = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    var coiffureCtrl = context.watch<CoiffureController>();
    List<CoiffureModel> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = coiffureCtrl.coiffures;
    } else {
      results = coiffureCtrl.coiffures
          .where((coiffure) => coiffure.name!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  @override
  Widget build(BuildContext context) {
    var coiffureCtrl = context.watch<CoiffureController>();
    _foundCoiffures = coiffureCtrl.coiffures;

    print("COIFFURES PAGE : ${_foundCoiffures}");

    return Scaffold(
      backgroundColor: ColorPages.COLOR_NOIR,
      body: SingleChildScrollView(
        child: Column(
          children: [_body()],
        ),
      ),
    );
  }

  Widget _body() {
    var coiffureCtrl = context.watch<CoiffureController>();
    return Container(
      child: Column(
        children: [
          _logo(),
          _recherche(),
          RefreshIndicator(
            color: ColorPages.COLOR_DORE_FONCE,
            onRefresh: ()async{
               coiffureCtrl.getCoiffures();
            },
              child: coiffeur_liste()
          )
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: Image.asset(
        "images/logo.png",
        width: Adaptive.w(50),
      ),
    );
  }

  Widget _recherche() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.sp),
        width: Adaptive.w(double.infinity),
        child: TextFormField(
          style: TextStyle(
            color: ColorPages
                .COLOR_DORE_FONCE, // Couleur du texte lorsqu'on saisit
          ),
          onChanged: (value) => _runFilter(value),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: ColorPages.COLOR_DORE_FONCE,
            ),
            fillColor: ColorPages.COLOR_NOIR.withOpacity(4.sp),
            hintText: "Recherche",
            hintStyle: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPages.COLOR_DORE_FONCE)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: Adaptive.w(0.3), color: ColorPages.COLOR_DORE_FONCE),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: Adaptive.w(0.3), color: ColorPages.COLOR_DORE_FONCE),
              borderRadius: BorderRadius.all(Radius.circular(12.sp)),
            ),
          ),
        ));
  }

  Widget _bouton_search() {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Rechecrhe",
          style: TextStyle(color: ColorPages.COLOR_BLANC),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorPages.COLOR_DORE_FONCE,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            )),
      ),
    );
  }

  Widget coiffeur_liste() {
    var coiff = context.watch<CoiffureController>();
    return SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        child: _foundCoiffures.isNotEmpty
            ? ListView.builder(
                itemCount: _foundCoiffures.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var coiffure = _foundCoiffures[index];
                  // CoiffureModel coiffureFilter = coiffure.isActive!=0;
                  if(coiffure.isActive==1)
                  return CardWidget(
                      imagePath: "images/image4.jpg",
                      buttonText: "choisir",
                      text: coiffure.name ?? "",
                      price_coif: "\$${coiffure.price}",
                      text_annee: "2 ans",
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.DetailsPage,
                            arguments: coiffure.toJson());
                      });
                })
            : Column(
                children: [
                  noData(),
                  noData(),
                ],
              ));
  }

  noData() {
    return Container(
      width: Adaptive.w(90),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        color: Colors.grey.withOpacity(2.sp),
      ),
      margin: EdgeInsets.all(20.sp),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FadeTransition(
            opacity: _animation,
            child: Placeholder(
              color: ColorPages.COLOR_TRANSPARENT,
              child: Container(
                padding: EdgeInsets.all(10.sp),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.sp),
                    child: Container(
                      width: Adaptive.w(35),
                      height: 20.h,
                      color: ColorPages.COLOR_GRIS,
                    )),
              ),
            ),
          ),
          FadeTransition(
            opacity: _animation,
            child: Container(
              padding: EdgeInsets.only(left: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Adaptive.w(45),
                    height: 1.5.h,
                    decoration: BoxDecoration(
                        color: ColorPages.COLOR_GRIS,
                        borderRadius: BorderRadius.circular(50.dp)),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    width: Adaptive.w(35),
                    height: 1.5.h,
                    decoration: BoxDecoration(
                        color: ColorPages.COLOR_GRIS,
                        borderRadius: BorderRadius.circular(50.dp)),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    width: Adaptive.w(25),
                    height: 1.5.h,
                    decoration: BoxDecoration(
                        color: ColorPages.COLOR_GRIS,
                        borderRadius: BorderRadius.circular(50.dp)),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    width: Adaptive.w(40),
                    height: 1.5.h,
                    decoration: BoxDecoration(
                        color: ColorPages.COLOR_GRIS,
                        borderRadius: BorderRadius.circular(50.dp)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _coiffeur_liste() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          CardWidget(
              imagePath: "images/image4.jpg",
              buttonText: "choisir",
              text: "Hena Ndombele",
              price_coif: "coiffeuse",
              text_annee: "2 ans",
              onPressed: () {
                Navigator.pushNamed(context, Routes.DetailsPage);
              }),
          CardWidget(
              imagePath: "images/image4.jpg",
              buttonText: "choisir",
              text: "Hena Ndombele",
              price_coif: "coiffeuse",
              text_annee: "2 ans",
              onPressed: () {}),
          CardWidget(
              imagePath: "images/image4.jpg",
              buttonText: "choisir",
              text: "Hena Ndombele",
              price_coif: "coiffeuse",
              text_annee: "2 ans",
              onPressed: () {}),
          CardWidget(
              imagePath: "images/image4.jpg",
              buttonText: "choisir",
              text: "Hena Ndombele",
              price_coif: "coiffeuse",
              text_annee: "2 ans",
              onPressed: () {}),
          CardWidget(
              imagePath: "images/image4.jpg",
              buttonText: "choisir",
              text: "Hena Ndombele",
              price_coif: "coiffeuse",
              text_annee: "2 ans",
              onPressed: () {}),
          CardWidget(
              imagePath: "images/image4.jpg",
              buttonText: "choisir",
              text: "Hena Ndombele",
              price_coif: "coiffeuse",
              text_annee: "2 ans",
              onPressed: () {}),
          CardWidget(
              imagePath: "images/image4.jpg",
              buttonText: "choisir",
              text: "Hena Ndombele",
              price_coif: "coiffeuse",
              text_annee: "2 ans",
              onPressed: () {})
        ],
      ),
    );
  }
}
