import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import '/styles.dart';
import '/app.exports.widgets.dart';

/// TODO:: REFACTOR THIS CODE WITH CONTROLLER
/// this page will be a stateless widget.
/// defaultController is used to provide the tiker and other needed components.
/// currently statefull for [index] only.
class UnitDetails extends StatefulWidget {
  const UnitDetails({super.key});

  @override
  State<UnitDetails> createState() => _UnitDetailsState();
}

class _UnitDetailsState extends State<UnitDetails> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SeparatedChip(
                      icon: Icons.house_outlined,
                      label: 'Faculty : Rasheda Begom',
                    ),
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.person),
                      tooltip: 'Call Faculty',
                    )
                  ],
                ),
                const SeparatedChip(
                    icon: Icons.location_on_outlined,
                    label: 'Permanent Campus'),
                const SeparatedChip(icon: Icons.present_to_all_rounded, label: '70% Attendance'),
                const SeparatedChip(
                    icon: Icons.tab_rounded, label: 'total class members : 7'),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: .6,
            minChildSize: .6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).dialogBackgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  controller: scrollController,
                  children: [
                    DefaultTabController(
                      length: 3,
                      child: Builder(builder: (context) {
                        TabController tabController =
                            DefaultTabController.of(context);
                        tabController.addListener(() {
                          setState(() {
                            index = tabController.index;
                          });
                        });
                        return Column(
                          children: [
                            const TabBar(
                              tabs: [
                                Tab(
                                  icon: Icon(Icons.notes_sharp),
                                  text: "Notes",
                                ),
                                Tab(
                                  icon: Icon(Icons.doorbell_rounded),
                                  text: "Lecture",
                                ),
                                Tab(
                                  icon: Icon(Icons.more_horiz),
                                  text: "Other info",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: TabBarView(
                                children: [
                                  // member
                                  ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    itemCount: 4,
                                    primary: false,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        const UnitMemberTile(),
                                  ),
                                  // sublets
                                  ListView.builder(
                                    itemCount: 1,
                                    primary: false,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    itemBuilder: (context, index) =>
                                        const UnitMemberTile(),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Class Objective',
                                          style: AppStyle.headingTextStyle,
                                        ),
                                      ),
                                      const ListTile(
                                        title: Text(
                                          'Objective Title',
                                        ),
                                        subtitle: Text('To know how software...'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'References',
                                          style: AppStyle.headingTextStyle,
                                        ),
                                      ),
                                      const ListTile(
                                        title: Text('Object Oriented Programming in CPP'),
                                        subtitle: Text('Robert Lafore'),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }),
                    ),

                    // const SliverToBoxAdapter(
                    //   child:
                    // ),
                    // SliverAppBar(
                    //   automaticallyImplyLeading: false,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   // floating: true,
                    //   pinned: true,
                    //   expandedHeight: 280,
                    //   stretch: true,
                    // bottom: AddressBar(),
                    //   flexibleSpace: FlexibleSpaceBar(
                    //     stretchModes: const [
                    //       StretchMode.blurBackground,
                    //       // StretchMode.zoomBackground,
                    //       // StretchMode.fadeTitle,
                    //     ],
                    //     title: Text(
                    //       'E-14',
                    //       style: AppStyle.headingTextStyle,
                    //     ),
                    //     background: ,
                    //   ),
                    // ),

                    // SliverToBoxAdapter(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Text(
                    //       'List of Members',
                    //       style: AppStyle.headingTextStyle,
                    //     ),
                    //   ),
                    // ),

                    //prev code
                    // SliverList(
                    //   delegate: SliverChildBuilderDelegate(
                    //     (context, index) => Card(
                    //       child: ListTile(
                    //         leading: const Text('Father'),
                    //         title: Text('Md Al momin mostafa $index'),
                    //         subtitle: const Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Divider(),
                    //             Text('Age : 21'),
                    //             Divider(),
                    //             Text('Software Engineer'),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     childCount: 3,
                    //   ),
                    // ),
                    // SliverToBoxAdapter(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Text(
                    //       'Driver',
                    //       style: AppStyle.headingTextStyle,
                    //     ),
                    //   ),
                    // ),
                    // SliverList(
                    //   delegate: SliverChildBuilderDelegate(
                    //     (context, index) => ListTile(
                    //       title: Text(
                    //         'Driver name $index',
                    //       ),
                    //       subtitle: const Text('+880 171 823 113'),
                    //     ),
                    //     childCount: 1,
                    //   ),
                    // ),
                    // SliverToBoxAdapter(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Text(
                    //       'Helping Hand',
                    //       style: AppStyle.headingTextStyle,
                    //     ),
                    //   ),
                    // ),
                    // SliverList(
                    //   delegate: SliverChildBuilderDelegate(
                    //     (context, index) => ListTile(
                    //       title: Text('Helping Hand name $index'),
                    //       subtitle: const Text('+880 171 823 113'),
                    //     ),
                    //     childCount: 1,
                    //   ),
                    // ),
                    // const SliverToBoxAdapter(
                    //   child: Padding(
                    //     padding: EdgeInsets.all(20.0),
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton.filled(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
          )
        ],
      ),
      // bottomSheet: BottomSheet(
      //   onClosing: () {},
      //   builder: (context) {
      //     return ;
      //   },
      // ),
      floatingActionButton: ExpandableFab(
        distance: 80,
        pos: ExpandableFabPos.right,
        type: ExpandableFabType.up,
        children: [
          FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: () {},
            heroTag: null,
            label: const Text('Add Notes'),
            icon: const Icon(Icons.note_add),

          ),
          FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: () {},
            heroTag: null,
            label: const Text('Add PDF'),
            icon: const Icon(Icons.picture_as_pdf),
          ),
          FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: () {},
            heroTag: null,
            icon: const Icon(Icons.edit_attributes_rounded),
            label: const Text('Edit Info'),
          )
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      // FloatingActionButton(
      //   onPressed: () {
      //     switch (index) {
      //       case 0:
      //         print(index);
      //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //           content: Text("Members will be added"),
      //         ));
      //         break;
      //       case 1:
      //         print(index);
      //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //           content: Text("sublets will be added"),
      //         ));
      //         break;
      //       case 2:
      //         print(index);
      //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //           content: Text("Other info will be edited"),
      //         ));
      //         break;
      //     }
      //   },
      //   tooltip: "Add Member",
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.ri,
    );
  }
}

// class AddressBar extends StatelessWidget implements PreferredSizeWidget {
//   const AddressBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const
//     Chip(
//       avatar: Icon(Icons.location_on_outlined),
//       label: Text('data'),
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size(double.infinity, 80);
// }

// SizedBox(
// height: MediaQuery.of(context).size.height * 0.55,
// child: ListView.builder(
// itemCount: 10,
// itemBuilder: (context, index) => const ListTile(
// title: Text('member name'),
// subtitle: Text('member profile ID'),
// ),
// ),
// ),

class UnitMemberTile extends StatelessWidget {
  const UnitMemberTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        visualDensity: VisualDensity.compact,
        title: const Text('Software Design'),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Text('Lecture 1'),
            // Divider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [Text('Age : 21'), Text('relation : Father')],
            // ),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
