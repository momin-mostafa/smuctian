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
            title: Text(
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
                    child: Card(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "SMUCT_Labyrinth_Leets",
                              style:
                                  Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            Text(
                              "The team will participate in ICPC the event tomorrow (November 3, 2023)",
                              style:
                                  Theme.of(context).textTheme.titleSmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ],
                        ),
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
                    const DashBoardPropertiesCard(
                      cardType: CardType.courses,
                    ),
                    const DashBoardPropertiesCard(
                      cardType: CardType.courses,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SectionHeader(
                label: 'My Exams',
                onTap: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DashBoardPropertiesCard(
                      cardType: CardType.exams,
                    ),
                    DashBoardPropertiesCard(
                      cardType: CardType.exams,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SectionHeader(
                label: 'Assignments',
                onTap: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DashBoardPropertiesCard(
                      cardType: CardType.assignments,
                    ),
                    DashBoardPropertiesCard(
                      cardType: CardType.assignments,
                    ),
                    DashBoardPropertiesCard(
                      cardType: CardType.assignments,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SectionHeader(
                label: 'Notices',
                onTap: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DashBoardPropertiesCard(
                      cardType: CardType.notices,
                    ),
                    DashBoardPropertiesCard(
                      cardType: CardType.notices,
                    ),
                    DashBoardPropertiesCard(
                      cardType: CardType.notices,
                    ),
                    DashBoardPropertiesCard(
                      cardType: CardType.notices,
                    ),
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
