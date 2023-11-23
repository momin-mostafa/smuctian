import 'package:flutter/material.dart';
import 'package:smuctian/styles.dart';

class ProfileScaffold extends StatelessWidget {
  const ProfileScaffold({
    super.key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.radius,
    required this.child,
    required this.imageUrl,
    this.name = 'Some Name',
    this.profileID = '123123',
  });

  final String imageUrl;
  final Widget child;
  final Color primaryColor;
  final Color secondaryColor;
  final double radius;
  final String name;
  final String profileID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: secondaryColor,
      // Theme.of(context).primaryColorLight.withOpacity(0.1),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(radius),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(250),
                      ),
                      child: CircleAvatar(
                        radius: 90,
                        backgroundImage: NetworkImage(imageUrl),
                        onBackgroundImageError: (object, stackTrace) {},
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          name,
                          style: AppStyle.headingTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        // const SizedBox(height: 5),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: radius,
                  decoration: BoxDecoration(
                    color: primaryColor,
                  ),
                ),
                Container(
                  height: radius,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                    ),
                    color: secondaryColor,
                  ),
                ),
                // Align(
                //   // width: MediaQuery.of(context).size.width * 0.4,
                //   alignment: Alignment.bottomCenter,
                //   child: Card(
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text(
                //         'Profile ID : $profileID',
                //         style: AppStyle.headingTextStyle.copyWith(
                //           color: Theme.of(context).primaryColor.withOpacity(.7),
                //           fontSize: 22,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: child,
          )
        ],
      ),
    );
  }
}
