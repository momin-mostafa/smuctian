import 'package:flutter/material.dart';
import '/styles.dart';
import 'unit_list.dart';
import '/app.exports.widgets.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                expandedHeight: 330,
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
                    'Jahanara Manjil',
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
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60),
                        SeparatedChip(
                          icon: Icons.turn_right_outlined,
                          label: '1-C',
                        ),
                        SeparatedChip(
                            icon: Icons.location_on_outlined, label: 'Gulshan'),
                        SeparatedChip(
                            icon: Icons.local_post_office_outlined,
                            label: '1100'),
                        // SeparatedChip(icon: Icons.money, label: '15,000'),
                        SeparatedChip(
                          icon: Icons.tab_rounded,
                          label: 'total unit number : 2',
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
                  'List of Units',
                  style: AppStyle.headingTextStyle,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UnitTile(),
                  ),
                  childCount: 2,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 300)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add Units",
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}