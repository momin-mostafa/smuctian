import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'house_intake.dart';
import 'property_details.dart';
import 'unit_list.dart';

class AssetList extends StatelessWidget {
  const AssetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classrooms'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HouseIntake()));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemCount: demoPropertyList.length,
        itemBuilder: (BuildContext context, int index) => AssetListWidget(
          name: demoPropertyList[index]['name'],
          location: demoPropertyList[index]['loc'],
          logoUrl: demoPropertyList[index]['img'],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PropertyDetails(),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> demoPropertyList = [
  {
    'name': 'System Design',
    'img': 'apartment-svgrepo-com.svg',
    'loc': '1405'
  },
  {
    'name': 'Software Architecture',
    'img': 'building-2-svgrepo-com.svg',
    'loc': '1607'
  },
  {
    'name': 'Software Engineering Lab',
    'img': 'shop-svgrepo-com.svg',
    'loc': 'Online'
  },
];

class AssetListWidget extends StatelessWidget {
  const AssetListWidget(
      {super.key,
      required this.logoUrl,
      required this.name,
      required this.location,
      this.onTap});

  final String logoUrl;
  final String name;
  final String location;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Theme(
        data: ThemeData(),
        child: ListTile(
          onTap: onTap,
          visualDensity: VisualDensity.comfortable,
          leading: SvgPicture.asset(
            'assets/svg/$logoUrl',
            height: 60,
            width: 60,
          ),
          title: Text(name),
          subtitle: Text(location),
        ),
      ),
    );
  }
}

class AssetTile extends StatelessWidget {
  const AssetTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).primaryColor.withOpacity(0.2),
      //Theme.of(context).secondaryHeaderColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      // style: ListTileStyle.drawer,
      isThreeLine: true,
      leading: const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/img_avatar.png'),
        ),
      ),
      title: const Chip(
        label: Text('Jahanara Monjil'),
        elevation: 1,
      ),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chip(
            avatar: Icon(Icons.location_on_outlined),
            label: Text('Khil barir tek, Vatara, Dhaka'),
          ),
          Chip(
            avatar: Icon(Icons.money),
            label: Text('400000 BDT'),
          ),
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton.filledTonal(
            onPressed: () {}, icon: const Icon(Icons.call)),
      ),
    );
  }
}

class HouseListTile extends StatelessWidget {
  const HouseListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UnitList(title: 'Jahanara Monjil'),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          // Colors.green.shade200,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * .31,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'House Name',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Divider(),
                              Text('House Address'),
                              Divider(),
                              Text('Type'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .41,
                      child: const Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('total flat number : 7'),
                              Text('Rented Flat : 6'),
                              Text('To-Let Flat : 1'),
                              Divider(),
                              Text('Expected rent : 60000'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Manager Name : kuddus'),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.call,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
