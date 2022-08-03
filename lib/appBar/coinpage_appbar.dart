// import 'package:flutter/material.dart';

// class CoinAppBar extends StatefulWidget with PreferredSizeWidget {
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//   late Color? heart;
//   CoinAppBar({
//     super.key,
//     required this.heart,
//   });

//   @override
//   State<CoinAppBar> createState() => _CoinAppBarState();
// }

// class _CoinAppBarState extends State<CoinAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 1.0,
//       shadowColor: Colors.grey[500],
//       centerTitle: true,
//       title: const Text(
//         'CryptoCoin',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       leading: Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: IconButton(
//           onPressed: () {
//             Navigator.pop(context, widget.heart);
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.teal,
//             size: 30,
//           ),
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: IconButton(
//               onPressed: () {
//                 setState(() {
//                   if (widget.heart == Colors.white) {
//                     widget.heart = Colors.redAccent[400];
//                   } else {
//                     widget.heart = Colors.white;
//                   }
//                 });
//               },
//               icon: Icon(
//                 Icons.favorite,
//                 color: widget.heart,
//               )),
//         ),
//       ],
//     );
//   }
// }
