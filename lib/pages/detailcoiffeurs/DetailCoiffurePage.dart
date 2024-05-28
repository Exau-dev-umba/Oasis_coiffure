import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oasis_coiffure/models/CoiffureModel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:oasis_coiffure/utils/Routes.dart';
import 'package:oasis_coiffure/widgets/BoutonWidget.dart';

class DetailCoiffurePage extends StatefulWidget {
  final CoiffureModel coiffure;

  const DetailCoiffurePage({Key? key, required this.coiffure})
      : super(key: key);

  @override
  State<DetailCoiffurePage> createState() => _DetailCoiffurePageState();
}

class _DetailCoiffurePageState extends State<DetailCoiffurePage> {
  late DateTime selectedDateFinal = DateTime.now();
  late String selectedDate= selectedDateFinal.toString();
  String? currentHeure;
  bool isValidated = true;
  List<String> options = ['10:00-11:00', '11:00-12:00', '12:00-13:00'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateFinal,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDateFinal) {
      setState(() {
        selectedDateFinal = picked;
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
                color: ColorPages.COLOR_DORE_FONCE,
                fontWeight: FontWeight.bold),
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
            SizedBox(
              height: 3.h,
            ),
            _text('Selectionner une date de reservation'),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectDate(context);
                  selectedDate = '${selectedDateFinal.day}-${selectedDateFinal.month}-${selectedDateFinal.year}';

                });
              },
              child: AbsorbPointer(
                child: TextFormField(
                  style: const TextStyle(color: ColorPages.COLOR_DORE_FONCE),
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    labelStyle: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      color: ColorPages.COLOR_DORE_FONCE,
                    ),
                  ),
                  controller: TextEditingController(
                    text: selectedDateFinal != null
                        ? '${selectedDateFinal.day}-${selectedDateFinal.month}-${selectedDateFinal.year}'
                        : '',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            _text("Choisissez l'interval d'heure"),
            Container(
              width: Adaptive.w(double.infinity),
              child: DropdownButtonFormField(
                  value: currentHeure,
                  hint: Text("Selectioner", style: TextStyle(color: ColorPages.COLOR_BLANC),),
                  dropdownColor: ColorPages.COLOR_NOIR,
                  style: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
                  items: options.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: isValidated? null:const InputDecoration(
                    errorText:  "Veuillez choisir une interval d'heure",
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  onChanged: (String? value){
                    setState(() {
                      currentHeure = value;
                      isValidated = true;
                    });
                  }
              ),
            ),
            _message(),
            BoutonWidget(
              onPressed: () {
                setState(() {
                  if(currentHeure == null){
                    isValidated = false;
                  } else{
                    Navigator.pushNamed(
                        context,
                        Routes.PaiementPage,
                        arguments: {
                          "coiffure": widget.coiffure.toJson(),
                          "heure": currentHeure,
                          "date": selectedDateFinal,
                          "specialisation": widget.coiffure.specialisation,
                        }
                    );
                  }
                });
              },
              text: "Prendre rendez-vous",
            )
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
              'Nom du coiffure: ',
              style: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
            ),
            Text(widget.coiffure.name ?? "",
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
              'Specialisation : ',
              style: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
            ),
            Text("${widget.coiffure.specialisation}",
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
              'Prix: ',
              style: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
            ),
            GestureDetector(
              onTap: () {},
              child: Text("\$${widget.coiffure.price}",
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
        setState(() {
          _selectDate(context);
          selectedDate = '${selectedDateFinal.day}-${selectedDateFinal.month}-${selectedDateFinal.year}';

        });
      },
      child: AbsorbPointer(
        child: TextFormField(
          style: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
          decoration: InputDecoration(
            labelText: 'Date',
            labelStyle: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
            suffixIcon: Icon(
              Icons.calendar_today,
              color: ColorPages.COLOR_DORE_FONCE,
            ),
          ),
          controller: TextEditingController(
            text: selectedDateFinal != null
                ? '${selectedDateFinal.day}-${selectedDateFinal.month}-${selectedDateFinal.year}'
                : '',
          ),
        ),
      ),
    );
  }

  Widget _text(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
            color: ColorPages.COLOR_BLANC, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget heure_select() {
    List<String> options = ['10:00-11:00', '11:00-12:00', '12:00-13:00'];
    String? currentValue;
    // int selectedIndex = 0;
    return Container(
      width: Adaptive.w(double.infinity),
      child: DropdownButton(
        value: currentValue,
          hint: Text("Selectioner", style: TextStyle(color: ColorPages.COLOR_BLANC),),
          dropdownColor: ColorPages.COLOR_NOIR,
          style: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
          items: options.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value){
          setState(() {
            currentValue = value;
            print("object : $currentValue");
          });
          }
      ),
    );
  }

  Widget _select_heure() {
    bool statut = false;
    List<String> options = ['10:00-11:00', '11:00-12:00', '12:00-13:00'];
    String currentValue = options[0];
    int selectedIndex = 0;
    return Column(
      children: [
/*        RadioListTile(
            value: options[0],
            groupValue: currentValue,
            onChanged: (value) {
              setState(() {
                currentValue = value.toString();
              });
            }
        )*/
/*        Row(
          children: [
            Container(
              width: Adaptive.w(35),
              height: 10.h,
              margin: EdgeInsets.only(right: 20.sp),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    spacing: 10,
                    children: [
                      for (int i = 0; i < options.length; i++)
                        ChoiceChip(
                          padding: EdgeInsets.all(12.sp),
                          color:
                              MaterialStatePropertyAll(ColorPages.COLOR_NOIR),
                          label: Text(options[i]),
                          selected: selectedIndex == i,
                          labelStyle: statut == true
                              ? TextStyle(
                                  color: ColorPages.COLOR_NOIR,
                                  fontSize: 14,
                                )
                              : TextStyle(
                                  color: ColorPages.COLOR_BLANC,
                                  fontSize: 14,
                                ),
                          selectedColor: ColorPages.COLOR_DORE_FONCE,
                          disabledColor: ColorPages.COLOR_NOIR,
                          onSelected: (bool value) {
                            setState(() {
                              selectedIndex = value ? i : -1;
                            });
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: Adaptive.w(35),
              height: 10.h,
              margin: EdgeInsets.only(right: 20.sp),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "08:00-09:00",
                      style: TextStyle(color: ColorPages.COLOR_BLANC),
                    ),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: ColorPages.COLOR_DORE_FONCE,
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: ColorPages.COLOR_DORE_FONCE),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: Adaptive.w(35),
              height: 10.h,
              margin: EdgeInsets.only(right: 20.sp),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "10:00-11:00",
                      style: TextStyle(color: ColorPages.COLOR_BLANC),
                    ),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: ColorPages.COLOR_DORE_FONCE,
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: ColorPages.COLOR_DORE_FONCE),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        )),
                  )
                ],
              ),
            ),
            Container(
              width: Adaptive.w(35),
              height: 10.h,
              margin: EdgeInsets.only(right: 20.sp),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "10:00-11:00",
                      style: TextStyle(color: ColorPages.COLOR_BLANC),
                    ),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: ColorPages.COLOR_DORE_FONCE,
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: ColorPages.COLOR_DORE_FONCE),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),*/
      ],
    );
  }

  Widget _message() {
    return Container(
      child: TextFormField(
        style: TextStyle(
          color:
              ColorPages.COLOR_DORE_FONCE, // Couleur du texte lorsqu'on saisit
        ),
        maxLength: 6,
        decoration: InputDecoration(
          fillColor: ColorPages.COLOR_NOIR.withOpacity(4.sp),
          hintText: "Message",
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
      ),
    );
  }

  Widget _bouton() {
    return Container(
      child: BoutonWidget(
        onPressed: () {
          Navigator.pushNamed(
              context,
              Routes.PaiementPage,
          );
        },
        text: "Prendre rendez-vous",
      ),
    );
  }
}
