import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:oasis_coiffure/utils/Routes.dart';
import 'package:oasis_coiffure/widgets/BoutonWidget.dart';

class DetailCoiffurePage extends StatefulWidget {
  const DetailCoiffurePage({Key? key}) : super(key: key);

  @override
  State<DetailCoiffurePage> createState() => _DetailCoiffurePageState();
}

class _DetailCoiffurePageState extends State<DetailCoiffurePage> {
  late DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
            "Reservation coiffure",
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
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          children: [
            _details(),
            SizedBox(height: 3.h,),
            _text(),
            _select_date(),
            _select_heure(),
            _message(),
            _bouton()
          ],
        ),
      ),
    );
  }

  Widget _details() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Nom du coiffeur: ',
              style: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
            ),
            Text("Jessy F.",
                style: TextStyle(color: ColorPages.COLOR_BLANC))
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Divider(
          height: 2.h,
          color: ColorPages.COLOR_GRIS,
        ),
        Row(
          children: [
            Text(
              'Experience : ',
              style: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
            ),
            Text("2 ans", style: TextStyle(color: ColorPages.COLOR_BLANC))
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Divider(
          height: 2.h,
          color: ColorPages.COLOR_GRIS,
        ),
        Row(
          children: [
            Text(
              'Téléphone Oasis: ',
              style: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Text("0899999999",
                  style: TextStyle(color: ColorPages.COLOR_BLANC)),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Divider(
          height: 2.h,
          color: ColorPages.COLOR_GRIS,
        ),
      ],
    );
  }

  Widget _select_date() {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: AbsorbPointer(
        child: TextFormField(
          style: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
          decoration: InputDecoration(
            labelText: 'Date',labelStyle: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
            suffixIcon: Icon(Icons.calendar_today,color: ColorPages.COLOR_DORE_FONCE,),
          ),
          controller: TextEditingController(
            text: selectedDate != null
                ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
                : '',
          ),
        ),
      ),
    );
  }

  Widget _text(){
    return Container(
      alignment: Alignment.centerLeft,
      child:Text('Selectionner une date de reservation',style: TextStyle(color: ColorPages.COLOR_BLANC,fontWeight: FontWeight.bold),) ,
    );
  }

  Widget _select_heure() {
    bool statut = false;
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: Adaptive.w(30),
              height: 10.h,
              margin: EdgeInsets.only(right: 20.sp),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      statut = true;
                    });
                  },
                    child: Text("10:00-11:00",
                      style: TextStyle(color: ColorPages.COLOR_BLANC),), style: ElevatedButton.styleFrom(
                        foregroundColor: ColorPages.COLOR_DORE_FONCE, backgroundColor: Colors.transparent,
                        side: BorderSide(color: ColorPages.COLOR_DORE_FONCE),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        )),)

                ],
              ),
            ),
            Container(
              width: Adaptive.w(30),
              height: 10.h,
              margin: EdgeInsets.only(right: 20.sp),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){},
                    child: Text("08:00-09:00",
                      style: TextStyle(color: ColorPages.COLOR_BLANC),), style: ElevatedButton.styleFrom(
                        foregroundColor: ColorPages.COLOR_DORE_FONCE, backgroundColor: Colors.transparent,
                        side: BorderSide(color: ColorPages.COLOR_DORE_FONCE),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        )),)

                ],
              ),
            ),
          ],
        ),  Row(
          children: [
            Container(
              width: Adaptive.w(30),
              height: 10.h,
              margin: EdgeInsets.only(right: 20.sp),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){},
                      child: Text("13:00-14:00",
                        style: TextStyle(color: ColorPages.COLOR_BLANC),), style: ElevatedButton.styleFrom(
                        foregroundColor: ColorPages.COLOR_DORE_FONCE, backgroundColor: Colors.transparent,
                        side: BorderSide(color: ColorPages.COLOR_DORE_FONCE),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        )),)

                ],
              ),
            ),
            Container(
              width: Adaptive.w(30),
              height: 10.h,
              margin: EdgeInsets.only(right: 20.sp),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){},
                    child: Text("15:00-16:00",
                      style: TextStyle(color: ColorPages.COLOR_BLANC),), style: ElevatedButton.styleFrom(
                        foregroundColor: ColorPages.COLOR_DORE_FONCE, backgroundColor: Colors.transparent,
                        side: BorderSide(color: ColorPages.COLOR_DORE_FONCE),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        )),)

                ],
              ),
            ),
          ],
        ),

      ],
    );
  }

  Widget _message() {
    return Container(
      child: TextFormField(
        style: TextStyle(
          color: ColorPages
              .COLOR_DORE_FONCE, // Couleur du texte lorsqu'on saisit
        ),
        maxLength: 6,
        decoration: InputDecoration(
          fillColor: ColorPages.COLOR_NOIR.withOpacity(4.sp),
          hintText: "Message",
          hintStyle: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorPages.COLOR_DORE_FONCE)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: Adaptive.w(0.3), color: ColorPages.COLOR_DORE_FONCE),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: Adaptive.w(0.3) , color: ColorPages.COLOR_DORE_FONCE),
            borderRadius: BorderRadius.all(Radius.circular(12.sp)),
          ),
        ),
      ),
    );
  }

  Widget _bouton() {
    return Container(
      child: BoutonWidget(
        onPressed: () {
          Navigator.pushNamed(context, Routes.PaiementPage);
        },
        text: "Prendre rendez-vous",
      ),
    );
  }
}