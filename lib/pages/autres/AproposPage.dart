import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:oasis_coiffure/utils/ColorsPage.dart';

class AproposPage extends StatefulWidget {
  const AproposPage({super.key});

  @override
  State<AproposPage> createState() => _AproposPageState();
}

class _AproposPageState extends State<AproposPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPages.COLOR_NOIR,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Text(
              "A propos",
              style: TextStyle(color: ColorPages.COLOR_DORE_FONCE, ),
            ),
          ),
          backgroundColor: ColorPages.COLOR_NOIR,
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(
                    height: 5.h,
                  ),
/*                Container(
                    child: Text(
                      "Version 1.0.0",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: ColorPages.COLOR_BLANC,
                          fontFamily: 'Schyler'),
                    ),
                  ),
                   SizedBox(height: 5.h),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse(
                        'https://hena-ndombele.github.io/Hena-Ndombele/')),
                    child:  Text('Termes & Conditions d\'utilisation',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21.sp,
                            color: ColorPages.COLOR_BLANC,
                            )),
                  ),
                  SizedBox(height: 5.h),
                  InkWell(
                    onTap: () => contactThankfulPerson(),
                    child: Text('Contactez le développeur',
                        style: TextStyle(
                          color: ColorPages.COLOR_BLANC,
                            fontWeight: FontWeight.bold,
                            fontSize: 21.sp,
                            )),
                  ),*/
                Text("Termes et conditions",
                  style: TextStyle(
                  color: ColorPages.COLOR_BLANC,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.sp,),),
                SizedBox(height: 2.h,),
                Text(
                    """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo dolor, dapibus facilisis risus vel, interdum finibus nunc. Maecenas iaculis id lorem a ultrices. Vestibulum feugiat porta felis, id vulputate eros aliquam nec. In maximus ut mi ut accumsan. Vivamus lobortis interdum ipsum, ut tempus purus sollicitudin sit amet. Sed sollicitudin varius ipsum a tristique. Curabitur in diam viverra, euismod dolor eget, tempor velit. Proin velit ex, dignissim nec felis et, fringilla facilisis libero. Pellentesque mattis, augue quis luctus fermentum, sem ligula ultricies neque, in pretium odio ipsum eu ante. Curabitur ac tempus eros. In tortor sapien, convallis sit amet nisi ac, congue scelerisque tortor. Maecenas pharetra tellus in quam rutrum, sed auctor enim maximus.

                    Fusce efficitur, lorem sit amet suscipit ullamcorper, diam leo consectetur quam, nec condimentum leo est nec dolor. Duis sem magna, pretium in nisl quis, iaculis varius dolor. Suspendisse semper odio leo, at gravida urna ultrices ut. Vestibulum a nisl vehicula, tincidunt mauris non, accumsan leo. Proin urna ante, tempor eget eleifend a, ultricies at mauris. Proin rhoncus dictum purus, at blandit purus accumsan ac. Aliquam erat volutpat. Vestibulum dolor massa, vehicula eu bibendum ut, consequat id nulla. Curabitur id neque ornare, lacinia sem sit amet, imperdiet lectus. Cras placerat sed nulla ut egestas. Donec scelerisque, diam vel dignissim consectetur, felis libero condimentum metus, quis porttitor risus neque a mauris. Nullam volutpat interdum erat, in placerat justo accumsan non. Proin nec mi nec eros vestibulum bibendum et ac dolor.

                Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean libero nibh, cursus sit amet efficitur et, cursus sit amet magna. Curabitur scelerisque eu urna sed eleifend. Duis faucibus, odio pulvinar elementum gravida, neque ipsum dictum tortor, ut hendrerit mi leo a tortor. Mauris at consequat magna. Donec at commodo mi, et ullamcorper massa. Phasellus consectetur ultrices turpis, hendrerit rhoncus quam convallis id. Donec vel nisl turpis.""",
                  style: TextStyle(color: ColorPages.COLOR_BLANC),
                ),
                ],
              ),
            ),
          );
        }));
  }

  Future contactThankfulPerson() async {
    showModalBottomSheet<String?>(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      builder: (context) {
        return Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset('images/wat.jpeg', width: 30),
                    title: Text('Whastapp'),
                    onTap: () =>
                        launchUrl(Uri.parse('https://wa.me/+243830376004')),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'images/link.png',
                      width: 30,
                    ),
                    title: Text('Linkedin'),
                    onTap: () => launchUrl(
                        Uri.parse('https://www.linkedin.com/in/hena-ndombele')),
                  ),
                  ListTile(
                    leading: Image.asset('images/mail.png', width: 30),
                    title: Text('Email'),
                    onTap: () => launch(
                      'mai lto:henandombele2021@gmail.com',
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
