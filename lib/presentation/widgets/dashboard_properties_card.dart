import 'package:flutter/material.dart';

import 'animated_dashboard_card.dart';

// class DashBoardPropertiesCard extends StatelessWidget {
//   const DashBoardPropertiesCard({super.key, required this.imageUrl});
//
//   final String imageUrl;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         width: MediaQuery.of(context).size.width * .7,
//         child: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/$imageUrl'),
//                       fit: BoxFit.fill,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.3),
//                         offset: Offset.fromDirection(1,3),
//                         blurRadius: 3,
//                         spreadRadius: 2,
//                       ),
//                     ],
//                   ),
//                   height: MediaQuery.of(context).size.height * 0.18,
//                   width: MediaQuery.of(context).size.width * .7,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         "Type",
//                         style: TextStyle(
//                           color: Theme.of(context).primaryColorDark,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         '\$Price',
//                         style: TextStyle(
//                           color:
//                               Theme.of(context).primaryColor.withOpacity(0.8),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         'Name',
//                         style: TextStyle(
//                           color: Theme.of(context).primaryColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Row(
//                         children: [
//                           const Icon(Icons.location_on_outlined),
//                           Text(
//                             'Location',
//                             style: TextStyle(
//                               color: Theme.of(context).primaryColor,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               top: 120,
//               right: 10,
//               child: IconButton.filledTonal(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.favorite_outlined,
//                   color: Theme.of(context).primaryColor,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 130,
//               left: 10,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).highlightColor.withOpacity(0.8),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 height: 20,
//                 width: 50,
//                 child: Center(
//                   child: Text(
//                     'Hello',
//                     style: AppStyle.featuredTextStyle,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 10,
//               left: 10,
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColor,
//                     borderRadius: BorderRadius.circular(5)),
//                 height: 20,
//                 width: 50,
//                 child: Center(
//                   child: Text(
//                     'hi',
//                     style: AppStyle.featuredTextStyle,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


enum CardType {
  courses,
  assignments,
  notices,
  exams,
  classes
}

class DashBoardPropertiesCard extends StatelessWidget {
  const DashBoardPropertiesCard(
      {super.key, this.onTap, this.cardType = CardType.classes});

  final VoidCallback? onTap;
  final CardType cardType;
  @override
  Widget build(BuildContext context) {
    var unit = getUnit();
    var icon = getIcon();
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Stack(
          children: [
            SizedBox(
              height: 150,
              width: 240,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Course Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.8),
                          ),
                        ),
                        Icon(
                          Icons.more_vert_rounded,
                          color: Theme
                              .of(context)
                              .primaryColor,
                        )
                      ],
                    ),
                    if(unit != null)
                    RichText(
                      text: TextSpan(
                        text: '95%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary,
                        ),
                        children: [
                          TextSpan(
                            text:
                            " $unit",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'CSE 1234',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        icon,
                        const SizedBox(width: 5),
                        const Text(
                          'Online',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    const Divider(),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                        text: 'Faculty Name : ',
                        children: [
                          TextSpan(
                            text: 'Sazzad Bhuiya',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned.fill(
            //   child: AnimatedSlider(
            //     child: SizedBox(
            //       height: 150,
            //       width: 240,
            //       child: Card(
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.stretch,
            //             children: [
            //               Text(
            //                 'House Name',
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 17,
            //                   color: Theme.of(context).primaryColorDark,
            //                 ),
            //               ),
            //               RichText(
            //                 text: TextSpan(
            //                   text: 'total flat number : ',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 13,
            //                     color: Theme.of(context).colorScheme.secondary,
            //                   ),
            //                   children: [
            //                     TextSpan(
            //                       text: '7',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 13,
            //                         color: Theme.of(context)
            //                             .colorScheme
            //                             .primary
            //                             .withOpacity(0.8),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               RichText(
            //                 text: TextSpan(
            //                   text: 'Rented flat  : ',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 13,
            //                     color: Theme.of(context).colorScheme.secondary,
            //                   ),
            //                   children: [
            //                     TextSpan(
            //                       text: '6',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 13,
            //                         color: Theme.of(context)
            //                             .colorScheme
            //                             .primary
            //                             .withOpacity(0.8),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               RichText(
            //                 text: TextSpan(
            //                   text: 'TO-LET : ',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 13,
            //                     color: Theme.of(context).colorScheme.secondary,
            //                   ),
            //                   children: [
            //                     TextSpan(
            //                       text: '1',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 13,
            //                         color: Theme.of(context)
            //                             .colorScheme
            //                             .primary
            //                             .withOpacity(0.8),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const Divider(),
            //               RichText(
            //                 text: TextSpan(
            //                   text: 'Expected Rent : ',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 13,
            //                     color: Theme.of(context).colorScheme.secondary,
            //                   ),
            //                   children: [
            //                     TextSpan(
            //                       text: '60000',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 13,
            //                         color: Theme.of(context)
            //                             .colorScheme
            //                             .primary
            //                             .withOpacity(0.8),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }


  String? getUnit() {
    String? naming = '';
    switch (cardType) {
      case CardType.classes:
        naming = "marks";
        break;
      case CardType.courses:
        naming = "attendance";
        break;
      case CardType.assignments:
        naming = "due";
        break;
      case CardType.notices:
        naming = null;
        break;
      case CardType.exams:
        naming = "score";
        break;
    }
    return naming;
  }

  Icon getIcon(){
    switch(cardType){
      case CardType.courses:
        return const Icon(Icons.book_outlined);
      case CardType.assignments:
        return const Icon(Icons.note_outlined);
      case CardType.notices:
        return const Icon(Icons.notifications_outlined);
      case CardType.exams:
        return const Icon(Icons.night_shelter_outlined);
      case CardType.classes:
        return const Icon(Icons.edit_outlined);
    }

  }
}
