// ## GURU'S EXAMPLE
// // import 'package:auto_route/annotations.dart';
// import 'package:flutter/material.dart';
//
//
// import '../../../providers/post_provider.dart';
// import '../../../utils/enums/viewstate.dart';
// import '../../base_view/base_view.dart';
//
// // @RoutePage()
// class PostScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BaseView<PostProvider>(
//       onInitProvider: (provider) => provider.getPosts(context),
//       builder: (context, provider, child) => Scaffold(
//         appBar: AppBar(
//           title: const Text("Post List"),
//         ),
//           body: provider.state == ViewState.Busy
//               ? const Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: provider.postList.length,
//                   itemBuilder: (context, index) => Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "${provider.postList[index].title}",
//                               style: const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text("${provider.postList[index].body}"),
//                           ],
//                         ),
//                       ))),
//     );
//   }
// }
