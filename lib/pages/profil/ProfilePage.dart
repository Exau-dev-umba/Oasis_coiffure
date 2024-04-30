import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';
import 'package:oasis_coiffure/utils/Routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker picker = ImagePicker();
  XFile? imageSelectione;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPages.COLOR_NOIR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Text(
            "Mon Profil",
            style: TextStyle(color: ColorPages.COLOR_DORE_FONCE),
          ),
        ),
        backgroundColor: ColorPages.COLOR_NOIR,
      ),
      body: _body(context),

    );
  }

  Widget _body(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Container(
            child: InkWell(
              onTap: () async {},
              child: imageSelectione == null
                  ? CircleAvatar(
                      radius: 35.sp,
                      backgroundImage: AssetImage(
                        'images/image5.jpg',
                      ),
                    )
                  : CircleAvatar(
                      radius: 35.sp,
                      backgroundImage: FileImage(File(imageSelectione!.path)),
                    ),
            ),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Container(
            child: Text(
              'Guest_user0001',
              style: TextStyle(
                  height: 6.sp,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.sp,
                  color: ColorPages.COLOR_DORE_FONCE,
                  ),
            ),
          ),
          Container(
            child: Text(
              'guestuser0001@gmail.com',
              style: TextStyle(
                height: 5.sp,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: ColorPages.COLOR_BLANC,
              ),
            ),
          ),
          SizedBox(height: 5.sp),
          Expanded(
            child: ListView(
                padding: EdgeInsets.all(20.sp),
                shrinkWrap: true,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.sp),
                      //color: Utils.COLOR_BLEU_CIEL,
                    ),
                    child: ListTile(
                        title: Text(
                          'Editer Profile',
                          style: TextStyle(
                              fontSize: 16.sp, color: ColorPages.COLOR_BLANC),
                        ),
                        leading: Icon(
                          Icons.person,
                          color: ColorPages.COLOR_BLANC,
                          size: 20.sp,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorPages.COLOR_BLANC,
                          size: 18.sp,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.EditerProfilPage);
                        }),
                  ),
                  Divider(
                    height: 2.h,
                    color: ColorPages.COLOR_GRIS,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.sp),
                      //color: Utils.COLOR_BLEU_CIEL,
                    ),
                    child: ListTile(
                        title: Text(
                          'Changer le mot de passe',
                          style: TextStyle(
                              fontSize: 16.sp, color: ColorPages.COLOR_BLANC),
                        ),
                        leading: Icon(
                          Icons.password,
                          color: ColorPages.COLOR_BLANC,
                          size: 20.sp,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorPages.COLOR_BLANC,
                          size: 18.sp,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.ChangerMotDePassePage);
                        }),
                  ),
                  Divider(
                    height: 2.h,
                    color: ColorPages.COLOR_GRIS,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      //color: Utils.COLOR_BLEU_CIEL,
                    ),
                    child: ListTile(
                        title: Text(
                          'A propos',
                          style: TextStyle(
                              fontSize: 16.sp, color: ColorPages.COLOR_BLANC),
                        ),
                        leading: Icon(
                          Icons.info,
                          color: ColorPages.COLOR_BLANC,
                          size: 20.sp,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorPages.COLOR_BLANC,
                          size: 18.sp,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.AproposPage);
                        }),
                  ),
                  Divider(
                    height: 2.h,
                    color: ColorPages.COLOR_GRIS,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.sp),
                      //color: Utils.COLOR_BLEU_CIEL,
                    ),
                    child: ListTile(
                        title: Text(
                          'FeedBack',
                          style: TextStyle(
                              fontSize: 16.sp, color: ColorPages.COLOR_BLANC),
                        ),
                        leading: Icon(
                          Icons.bookmark,
                          color: ColorPages.COLOR_BLANC,
                          size: 20.sp,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorPages.COLOR_BLANC,
                          size: 18.sp,
                        ),
                        onTap: () {}),
                  ),
                  Divider(
                    height: 2.h,
                    color: ColorPages.COLOR_GRIS,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.sp),
                      //color: Utils.COLOR_BLEU_CIEL,
                    ),
                    child: ListTile(
                        title: Text(
                          'Deconnexion',
                          style: TextStyle(
                              fontSize: 16.sp, color: ColorPages.COLOR_DORE_FONCE),
                        ),
                        leading: Icon(
                          Icons.login,
                          color: ColorPages.COLOR_DORE_FONCE,
                          size: 20.sp,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorPages.COLOR_DORE_FONCE,
                          size: 18.sp,
                        ),
                        onTap: () {}),
                  ),
                ]),
          ),
        ],

    );
  }

  getApplicationDocumentsDirectory() {}
}
