import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/build_drawer_list.dart';
import '../utils/app_constant.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(
      maxHeight: 1000,
      minHeight: 1000,
    ));
    ScreenUtil screenUtil = ScreenUtil();
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return CustomPaint(
      painter: MyCustomePainter(),
      child: ClipPath(
        clipper: MyCustomeClipper(),
        child: Drawer(
          child: Scaffold(
            backgroundColor: Colors.black87,
            body: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  height: isLandScape
                      ? screenUtil.setHeight(600)
                      : screenUtil.setHeight(400),
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // if (authData.imageUrl != null)
                        Container(
                          height: 80,
                          width: 80,
                          padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "http//:",
                                // authData.imageUrl,
                              ),
                            ),
                            shape: BoxShape.circle,
                            color: Colors.white12,
                            // borderRadius: BorderRadius.circular(55),
                            border: Border.all(
                              width: 2,
                              color: AppColors.secondaryColors,
                            ),
                          ),

                          // child: ClipRRect(
                          //   borderRadius: BorderRadius.circular(55),
                          //   child: authData.imageUrl == null
                          //       ? Container()
                          //       : Image.network(
                          //           authData.imageUrl,
                          //           fit: BoxFit.cover,
                          //         ),
                          // ),
                        ),
                        // if (authData.imageUrl == null)
                        // CircleAvatar(
                        //   backgroundColor: AppColors.secondaryColors,
                        //   maxRadius: 37,
                        //   minRadius: 22,
                        //   child: CircleAvatar(
                        //     // foregroundColor: Colors.grey,
                        //     backgroundColor: Colors.white38,

                        //     backgroundImage: AssetImage(
                        //       'assets/icons/user.png',
                        //     ),
                        //     maxRadius: 35,
                        //     minRadius: 20,
                        //   ),
                        // ),
                        Container(
                          height: 80,
                          width: 80,
                          padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/icons/user.png',
                              fit: BoxFit.contain,
                              color: Colors.white38,
                            ),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white12,
                            border: Border.all(
                              width: 2,
                              color: AppColors.secondaryColors,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Transform.translate(
                            offset: Offset(0, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "User Name ",
                                  // authData.userName == null
                                  //     ? "user"
                                  //     : authData.userName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isLandScape
                                        ? screenUtil.setSp(20)
                                        : screenUtil.setSp(40),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 1),
                                Text(
                                  "user@example.com",
                                  // authData.userEmail == null
                                  //     ? "user@example.com"
                                  //     : authData.userEmail,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isLandScape
                                        ? screenUtil.setSp(20)
                                        : screenUtil.setSp(35),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 6,
                  thickness: 1,
                  color: Colors.black12,
                  // color: Colors.blue[600],
                ),
                SizedBox(height: 20),
                BuildDrawerList(
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                  ),
                  title: translate("drawerHome", context),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  height: screenUtil.setHeight(5),
                ),
                BuildDrawerList(
                  leading: Icon(
                    CupertinoIcons.tray_arrow_down,
                    color: Colors.white,
                  ),
                  title: translate("order", context),
                  onTap: () {
                    // Navigator.of(context).pushNamed(OrderScreen.routeName);
                  },
                ),
                SizedBox(
                  height: screenUtil.setHeight(5),
                ),
                BuildDrawerList(
                  leading: Icon(
                    CupertinoIcons.phone_arrow_up_right,
                    color: Colors.white,
                  ),
                  title: translate("contactUs", context),
                  onTap: () =>
                      showContactUsDailog(isLandScape, screenUtil, context),
                ),
                SizedBox(
                  height: screenUtil.setHeight(5),
                ),
                BuildDrawerList(
                  leading: Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                  title: translate("language", context),
                  onTap: () {
                    // Navigator.of(context).pushNamed(LanguageScreen.routeName);
                  },
                ),
                SizedBox(
                  height: screenUtil.setHeight(5),
                ),
                BuildDrawerList(
                  leading: Icon(
                    CupertinoIcons.info_circle,
                    color: Colors.white,
                  ),
                  title: translate("aboutUs", context),
                  onTap: () =>
                      showAboutDailog(isLandScape, screenUtil, context),
                ),
                SizedBox(
                  height: screenUtil.setHeight(5),
                ),
                BuildDrawerList(
                  leading: Icon(
                    CupertinoIcons.wrench,
                    color: Colors.white,
                  ),
                  title: translate("aboutDeveloper", context),
                  onTap: () => showAboutDeveloperDailog(
                      isLandScape, screenUtil, context),
                ),
                Divider(
                  height: 6,
                  thickness: 1,
                  color: Colors.black12,
                  // color: Colors.blue[600],
                ),
                SizedBox(
                  height: screenUtil.setHeight(300),
                ),
                // if (authData.isAuth)
                // BuildDrawerList(
                //   leading: Icon(
                //     CupertinoIcons.power,
                //     color: AppColors.secondaryColors,
                //   ),
                //   color: AppColors.secondaryColors,
                //   title: translate("logOut", context),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //     Navigator.of(context)
                //         .pushReplacementNamed(LoginScreen.routeName);
                //     authData.logOut();
                //   },
                // ),
                // if (!authData.isAuth)
                BuildDrawerList(
                  leading: Icon(
                    CupertinoIcons.square_arrow_right,
                    color: AppColors.secondaryColors,
                  ),
                  color: AppColors.secondaryColors,
                  title: translate("login", context),
                  onTap: () {
                    // Navigator.of(context).pop();
                    // Navigator.of(context)
                    //     .pushReplacementNamed(LoginScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Future<void> _launchEaseGroup(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     print("Can't launch");
//   }
// }

Future<void> _launchUrls(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print("Can't launch");
  }
}

Future<void> _launchPhone(String phone) async {
  var url = "tel:${phone.toString()}";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print("Can't launch");
  }
}

Future<void> _launchMail(String mail) async {
  var url = "mailto:${mail.toString()}?subject=hello";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print("Can't launch");
  }
}

Future<void> showAboutDailog(
    bool isLandScape, ScreenUtil screenUtil, BuildContext context) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: Colors.grey.shade800,
      scrollable: true,
      elevation: 0.0,
      title: Column(
        children: [
          Image.asset(
            'assets/icons/TopazLogo.png',
            height: isLandScape
                ? screenUtil.setHeight(200)
                : screenUtil.setHeight(300),
            width: isLandScape
                ? screenUtil.setWidth(200)
                : screenUtil.setWidth(300),
          ),
          Transform.translate(
            offset: Offset(0, 0),
            child: Text(
              "Topaz",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:
                    isLandScape ? screenUtil.setSp(35) : screenUtil.setSp(35),
                color: AppColors.secondaryColors,
                letterSpacing: 3,
              ),
            ),
          ),
        ],
      ),
      content: Container(
        height:
            isLandScape ? screenUtil.setHeight(800) : screenUtil.setHeight(600),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 220,
              child: Text(
                "Topaz Topajahjh jkjhgh ggghjeu nyuty hbgso oeu k hdueappq gnahh ub ing gooogning jdaww kie b",
                style: TextStyle(
                  fontSize:
                      isLandScape ? screenUtil.setSp(20) : screenUtil.setSp(35),
                  color: Colors.white60,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  translate("poweredBy", context),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isLandScape
                        ? screenUtil.setSp(18)
                        : screenUtil.setSp(30),
                    color: AppColors.secondaryColors,
                  ),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () => _launchUrls('https://ease-group.com/'),
                  child: Text(
                    'Ease-group',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: isLandScape
                          ? screenUtil.setSp(15)
                          : screenUtil.setSp(30),
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Future<void> showAboutDeveloperDailog(
    bool isLandScape, ScreenUtil screenUtil, BuildContext context) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: Colors.grey.shade800,
      scrollable: true,
      elevation: 0.0,
      title: Column(
        children: [
          Image.asset(
            'assets/images/ease.png',
            height: isLandScape
                ? screenUtil.setHeight(200)
                : screenUtil.setHeight(300),
            width: isLandScape
                ? screenUtil.setWidth(200)
                : screenUtil.setWidth(300),
          ),
          // Transform.translate(
          //   offset: Offset(0, -20),
          //   child: Text(
          //     "EAES-GROUP",
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize:
          //           isLandScape ? screenUtil.setSp(20) : screenUtil.setSp(35),
          //       color: AppColors.secondaryColors,
          //     ),
          //   ),
          // ),
        ],
      ),
      content: Container(
        height:
            isLandScape ? screenUtil.setHeight(800) : screenUtil.setHeight(600),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 220,
              child: Text(
                "Topaz Topajahjh jkjhgh ggghjeu nyuty hbgso oeu k hdueappq gnahh ub ing gooogning jdaww kie b",
                style: TextStyle(
                  fontSize:
                      isLandScape ? screenUtil.setSp(20) : screenUtil.setSp(35),
                  color: Colors.white60,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  translate("visit", context),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isLandScape
                        ? screenUtil.setSp(18)
                        : screenUtil.setSp(30),
                    color: AppColors.secondaryColors,
                  ),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () => _launchUrls('https://ease-group.com/'),
                  child: Text(
                    translate("ourWebSide", context),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: isLandScape
                          ? screenUtil.setSp(15)
                          : screenUtil.setSp(30),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Future<void> showContactUsDailog(
    bool isLandScape, ScreenUtil screenUtil, BuildContext context) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: Colors.grey.shade800,
      scrollable: true,
      elevation: 0.0,
      title: Column(
        children: [
          Image.asset(
            'assets/icons/TopazLogo.png',
            height: isLandScape
                ? screenUtil.setHeight(200)
                : screenUtil.setHeight(300),
            width: isLandScape
                ? screenUtil.setWidth(200)
                : screenUtil.setWidth(300),
          ),
          Transform.translate(
            offset: Offset(0, 0),
            child: Text(
              "Topaz ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:
                    isLandScape ? screenUtil.setSp(20) : screenUtil.setSp(35),
                color: AppColors.secondaryColors,
                letterSpacing: 3,
              ),
            ),
          ),
        ],
      ),
      content: Container(
        height:
            isLandScape ? screenUtil.setHeight(800) : screenUtil.setHeight(600),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => _launchUrls(
                      "https://www.linkedin.com/in/ayman-abdulrahman-4aa89b195/"),
                  child: Container(
                    height: screenUtil.setHeight(200),
                    width: screenUtil.setWidth(200),
                    child: Image.asset(
                      "assets/icons/facebook1.png",
                      fit: BoxFit.contain,
                      color: Colors.blue,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _launchPhone("+249911098045"),
                  child: Container(
                    height: screenUtil.setHeight(200),
                    width: screenUtil.setWidth(200),
                    child: Image.asset(
                      "assets/icons/phone-call.png",
                      fit: BoxFit.contain,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => _launchMail("aymansainshy@gmail.com"),
                  child: Container(
                    height: screenUtil.setHeight(200),
                    width: screenUtil.setWidth(200),
                    child: Image.asset(
                      "assets/icons/email.png",
                      fit: BoxFit.contain,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _launchUrls("https://twitter.com/aymansainshy1"),
                  child: Container(
                    height: screenUtil.setHeight(200),
                    width: screenUtil.setWidth(200),
                    child: Image.asset(
                      "assets/icons/twitter.png",
                      fit: BoxFit.contain,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class MyCustomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(size.width - 60, 0);

    path.quadraticBezierTo(
        size.width + 60, size.height / 2, size.width - 60, size.height);

    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class MyArCustomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(60, 0);

    path.quadraticBezierTo(-60, size.height / 2, 60, size.height);

    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class MyCustomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

    path.lineTo(size.width - 60, 0);

    path.quadraticBezierTo(
        size.width + 60, size.height / 2, size.width - 60, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyArCustomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2.2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path()
      ..lineTo(64, -15)
      ..quadraticBezierTo(-64, size.height / 2, 60, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
