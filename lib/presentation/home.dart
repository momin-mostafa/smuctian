import 'package:flutter/material.dart';
import '/app.exports.widgets.dart';
import '/routing/routings.dart';
import '/styles.dart';

import 'unit_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar.medium(
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            title:Text(
              'Tamim Mostafa',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            background: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          pinned: true,
          actions: const [
            CircleAvatar(
              // child: Placeholder(),
              backgroundImage: AssetImage('assets/images/img_avatar.png'),
            ),
            SizedBox(width: 10),
          ],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.76,
                  child: Card(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search)),
                      ),
                    ),
                  ),
                ),
                IconButton.filled(
                    padding: const EdgeInsets.all(12),
                    color: Theme.of(context).primaryColor,
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.edit_road))
              ],
            ),
          ),
        ),
        SliverList.list(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/house1.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      // height: 30,
                      // width: 70,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Announcement',
                          style: AppStyle.featuredTextStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SectionHeader(
                label: 'My Courses',
                onTap: () {
                  Navigator.pushNamed(context, Routes.instance.propertyList);
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashBoardPropertiesCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          // Routes.instance.unitDetails
                          MaterialPageRoute(
                            builder: (context) => const UnitList(
                                title: 'Units under a specific Property'),
                          ),
                        );
                      },
                    ),
                    const DashBoardPropertiesCard(),
                    const DashBoardPropertiesCard(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SectionHeader(
                label: 'TO LET',
                onTap: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DashBoardPropertiesCard(),
                    DashBoardPropertiesCard(),
                    DashBoardPropertiesCard(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}
