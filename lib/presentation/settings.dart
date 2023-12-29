import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smuctian/presentation/alumni.view.dart';
import 'package:smuctian/presentation/cg_calc.view.dart';
import 'package:smuctian/presentation/payment.v.dart';
import 'package:smuctian/routing/routings.dart';
import 'profile.dart';
import 'registration.dart';
import '/app.exports.widgets.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // padding: const EdgeInsets.only(left: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              expandedHeight: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                  // topRight:  Radius.circular(14),
                ),
              ),
              automaticallyImplyLeading: false,
              title: Text('Menu'),
              leadingWidth: 0,
              centerTitle: false,
              pinned: true,
            ),
            SliverList.list(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      CustomTile(
                        title: 'Name',
                        leadingIcon: Icons.add,
                        subTitle: "Profile ID",
                        // svgUrl: 'profile.svg',
                        profileURL: 'img_avatar.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Profile(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20.0),
                      const CustomTile(
                        title: 'My Classmates',
                        leadingIcon: Icons.add,
                        svgUrl: 'members.svg',
                      ),
                      CustomTile(
                        title: 'Course Enrollment',
                        leadingIcon: Icons.add,
                        svgUrl: 'properties.svg',
                        onTap: () {
                          Navigator.pushNamed(context, Routes.instance.classList);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Navigator.pushNamed(context, Routes),
                          //   ),
                          // );
                        },
                      ),
                      CustomTile(
                        title: 'Alumni',
                        leadingIcon: Icons.add,
                        svgUrl: 'tenant.svg',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AlumniView(),
                            ),
                          );
                        },
                      ),
                      CustomTile(
                        title: 'CG Calculator',
                        leadingIcon: Icons.add,
                        svgUrl: 'cgCalc.svg',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CGCalcView(),
                            ),
                          );
                        },
                      ),
                      CustomTile(
                        title: 'Payment Calculator',
                        leadingIcon: Icons.add,
                        svgUrl: 'cgCalc.svg',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentCalcView(),
                            ),
                          );
                        },
                      ),
                      const CustomTile(
                        title: 'Bus Tracker',
                        leadingIcon: Icons.add,
                        svgUrl: 'cgCalc.svg',
                      ),
                      const CustomTile(
                        title: 'Activity',
                        leadingIcon: Icons.add,
                        svgUrl: 'activity.svg',
                      ),
                      CustomTile(
                        title: 'History',
                        leadingIcon: Icons.add,
                        svgUrl: 'history.svg',
                        onTap: () => customPop(context),
                      ),
                      const CustomTile(
                        title: 'App Settings',
                        leadingIcon: Icons.add,
                        svgUrl: 'settings.svg',
                      ),
                      CustomTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Registration(),
                            ),
                          );
                        },
                        title: 'Logout',
                        leadingIcon: Icons.add,
                        svgUrl: 'logout.svg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.trailingIcon = Icons.arrow_forward,
    this.onTap,
    this.subTitle,
    this.svgUrl,
    this.profileURL,
  });

  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final void Function()? onTap;
  final String? subTitle;
  final String? svgUrl;
  final String? profileURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Card(
        elevation: 1,
        // margin: const EdgeInsets.only(top: 3),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        child: ListTile(
          shape: const RoundedRectangleBorder(),
          onTap: onTap,
          leading: Card(
            elevation: 0,
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            child: Padding(
              padding: profileURL == null
                  ? const EdgeInsets.all(5.0)
                  : EdgeInsets.zero,
              child: profileURL == null
                  ? SvgPicture.asset(
                      'assets/svg/$svgUrl',
                      height: 40,
                      width: 40,
                    )
                  : Image.asset(
                      'assets/images/$profileURL',
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0),
          //   child: Icon(leadingIcon),
          // ),
          // isThreeLine: subTitle != null,
          subtitle: subTitle != null
              ? Text(
                  '$subTitle',
                  // style: TextStyle(
                  //   // fontSize: MediaQuery.of(context).textScaleFactor * 13,
                  // ),
                )
              : null,
          title: Text(
            title,
            // style: TextStyle(
            //   // fontSize: MediaQuery.of(context).textScaleFactor * 15,
            // ),
          ),
          trailing: IconButton.filledTonal(
            onPressed: () {},
            icon: Icon(trailingIcon),
          ),
        ),
      ),
    );
  }
}
