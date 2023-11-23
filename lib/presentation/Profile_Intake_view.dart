import 'package:flutter/material.dart';
import '/app.exports.widgets.dart';

class ProfileIntakeView extends StatelessWidget {
  const ProfileIntakeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
                child: CardTextFormField(label: 'Profile ID')),
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () => customPop(context),
                child: const Icon(Icons.add),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Assign existing member',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
            ),
            SliverList.list(children: const [
              MemberTile(
                alreadyAssigned: true,
              ),
              MemberTile(),
              MemberTile(),
              MemberTile(),
            ]),
          ],
        ),
      ),
    );
  }
}

class MemberTile extends StatelessWidget {
  const MemberTile({super.key, this.alreadyAssigned = false});

  final bool alreadyAssigned;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        visualDensity: VisualDensity.compact,
        title: const Text('Md Al momin mostafa'),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Text('Software Engineer'),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Age : 21'), Text('relation : Father')],
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset('assets/images/person.jpg'),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: alreadyAssigned ?  const Icon(
            Icons.remove_circle_outline_sharp,
            color: Colors.red,
          ): const Icon(
            Icons.add_circle_outline,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
