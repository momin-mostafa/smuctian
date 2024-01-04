import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smuctian/application/classroom.p.dart';
import '/styles.dart';
import 'unit_list.dart';
import '/app.exports.widgets.dart';

class ClassDetails extends StatelessWidget {
  const ClassDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedClass = context.read<ClassroomProvider>().selectedClassRoom;
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                // floating: true,
                pinned: true,
                expandedHeight: 360,
                stretch: true,
                // bottom: AddressBar(),
                leading: IconButton.filled(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),

                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.blurBackground,
                    // StretchMode.fadeTitle,
                  ],
                  title: Text(
                    selectedClass?.classTitle ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),
                        SeparatedChip(
                          icon: Icons.calendar_month,
                          label: selectedClass
                                  ?.classCreationDateTime?.dateString ??
                              '',
                        ),
                        SeparatedChip(
                          icon: Icons.location_on_outlined,
                          label:
                              'Permanent Campus: ${selectedClass?.classRoomNumber}'
                              '',
                        ),
                        SeparatedChip(
                          icon: Icons.person_2_outlined,
                          label: "Faculty: ${selectedClass?.teacherName}",
                        ),
                        // SeparatedChip(icon: Icons.money, label: '15,000'),
                        SeparatedChip(
                          icon: Icons.code,
                          label: 'Course Code: ${selectedClass?.classJoinCode}',
                        ),

                        // SeparatedChip(
                        //     icon: Icons.tab_unselected_rounded,
                        //     label: 'To-Let unit : 1'),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.76,
                        child: const Card(
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                      IconButton.filled(
                        padding: const EdgeInsets.all(12),
                        color: Theme.of(context).primaryColor,
                        style: ButtonStyle(
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'List of Classes',
                  style: AppStyle.headingTextStyle,
                ),
              ),
              Consumer<ClassroomProvider>(builder: (context, vm, _) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: UnitTile(),
                    ),
                    childCount: 2,
                  ),
                );
              }),
              const SliverToBoxAdapter(child: SizedBox(height: 300)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add Classes",
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
