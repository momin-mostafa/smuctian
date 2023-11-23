import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Welcome Dada Bhai'),
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.3,
        ),
        SliverToBoxAdapter(
          child: CustomBottomSheet(),
        )
      ],
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Colors.yellow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            Card(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            Card(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            Card(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            Card(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            Card(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            Card(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            Card(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            Card(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            Card(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
