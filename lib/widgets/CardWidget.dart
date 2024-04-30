import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';

class CardWidget extends StatefulWidget {
  final String imagePath;
  final String text;
  final String text_coif;
  final String text_annee;
  final String buttonText;
  final VoidCallback onPressed;

  CardWidget(
      {required this.imagePath,
      required this.buttonText,
      required this.text,
      required this.text_coif,
      required this.text_annee,
      required this.onPressed});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Adaptive.w(90) ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        color: Colors.grey.withOpacity(2.sp),
      ),
      margin: EdgeInsets.all(20.sp),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.sp),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.sp),
              child: Image.asset(
                widget.imagePath,
                width: Adaptive.w(35),
                height: 20.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    widget.text,
                    style: TextStyle(
                        color: ColorPages.COLOR_BLANC,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp
                    )),
                Text(
                  widget.text_coif,
                  style: TextStyle(
                      color: ColorPages.COLOR_DORE_FONCE,
                      fontWeight: FontWeight.bold
                  ),),
                Text(
                    widget.text_annee,
                    style: TextStyle(
                        color: ColorPages.COLOR_BLANC,
                        fontWeight: FontWeight.bold
                    )),
                Container(
                  child: ElevatedButton(
                    onPressed: widget.onPressed as void Function()?,
                    child: Text(
                      widget.buttonText,
                      style: TextStyle(
                          color: ColorPages.COLOR_BLANC,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPages.COLOR_DORE_FONCE,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.sp),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
