import 'package:flutter/material.dart';
import 'unit_details.dart';
import '/app.exports.widgets.dart';

class UnitList extends StatefulWidget {
  const UnitList({super.key, this.title = ''});

  final String title;

  @override
  State<UnitList> createState() => _GrowableListTileViewState();
}

class _GrowableListTileViewState extends State<UnitList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.add),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
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
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                  child: UnitTile(),
                ),
                childCount: 10,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class UnitTile extends StatelessWidget {
  const UnitTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UnitDetails(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          // Colors.green.shade200,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 8.0, top: 8.0),
                      child: Stack(
                        children: [
                          // Container(
                          //   width: 50,
                          //   height: 50,
                          //   decoration: BoxDecoration(
                          //     color: Theme.of(context).primaryColor,
                          //     shape: BoxShape.circle,
                          //   ),
                          //   child: const Center(
                          //     child: Text(
                          //       "IMG",
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   ),
                          // ),
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.only(top: 10.0, left: 60),
                                child: Text(
                                  'Class 1',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w200),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: const Text(
                                              'Material Name',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const Text('Material Type'),
                                          // const Text('Attendance : '),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Card(
                                    child: SizedBox(
                                      height: 75,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Total Classes : 1'),
                                            Text('Attended : 1'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            right: -15,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 2,
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        topLeft: Radius.circular(12),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () => customPop(context),
                                      child: const Text('Review'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: IconButton.outlined(
                              tooltip: 'Remove This Class Material',
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Contact CR"),
                  ),
                ),
                Row(
                  children: [
                    // Divider(),
                    Container(
                      height: 2,
                      color: Theme.of(context).primaryColor,
                      width: MediaQuery.of(context).size.width * 0.52,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.call,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ListTileWithImage extends StatelessWidget {
  const ListTileWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        subtitle: TextField(
          controller: TextEditingController(text: "1234"),
        ),
        title: const Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Unit 1',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        //const Text('9158'),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          child: const Center(
            child: Text(
              "IMG",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        trailing: TextButton(
          onPressed: () {},
          child: const Text('Release'),
        )
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.remove),
        //   style: OutlinedButton.styleFrom(
        //     side: BorderSide(
        //         width: 1.0,
        //         color: Theme.of(context).primaryColor,
        //         style: BorderStyle.solid),
        //   ),
        // ),
        );
  }
}
