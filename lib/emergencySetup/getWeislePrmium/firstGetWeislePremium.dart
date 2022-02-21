// import 'package:flutter/material.dart';
// import 'package:weisle/emergencySetup/firstPaymentMethod.dart';
// import 'package:weisle/ui/constants/colors.dart';
// import 'package:weisle/ui/widgets/basic_widgets.dart';
// import 'package:weisle/ui/widgets/margin.dart';
// import 'package:weisle/ui/widgets/navigtion.dart';

// class GetAnotherWeizlePremium extends StatefulWidget {
//   const GetAnotherWeizlePremium({Key? key}) : super(key: key);

//   @override
//   _GetAnotherWeizlePremiumState createState() =>
//       _GetAnotherWeizlePremiumState();
// }

// class _GetAnotherWeizlePremiumState extends State<GetAnotherWeizlePremium> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: SideSpace(
//               10,
//               10,
//               SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Image.asset("assets/icons/headericons.png",
//                         height: 30, width: 30),
//                     const YMargin(10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [IconOf(Icons.alarm_on_rounded, black, 30)],
//                     ),
//                     const YMargin(20),
//                     TextOf('Get weizle premium', 23, FontWeight.w500, black),
//                     const YMargin(32),
//                     Material(
//                       elevation: 4.0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: white,
//                             borderRadius: BorderRadius.circular(13)),
//                         child: SideSpace(
//                           10,
//                           15,
//                           Row(
//                             children: [
//                               IconOf(Icons.circle_outlined, ash, 20),
//                               const XMargin(20),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   TextOf('Monthly', 20, FontWeight.w400, black),
//                                   TextOf('valid for 30 days', 13,
//                                       FontWeight.w400, ash),
//                                 ],
//                               ),
//                               const Expanded(child: XMargin(5)),
//                               TextOf('N 1,200', 20, FontWeight.w500, brown)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const YMargin(10),
//                     Material(
//                       elevation: 4.0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: white,
//                             borderRadius: BorderRadius.circular(13)),
//                         child: SideSpace(
//                           10,
//                           15,
//                           Row(
//                             children: [
//                               IconOf(Icons.circle_outlined, ash, 20),
//                               const XMargin(20),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   TextOf(
//                                       'Quaterly', 20, FontWeight.w400, black),
//                                   TextOf('valid for 90 days', 13,
//                                       FontWeight.w400, ash),
//                                 ],
//                               ),
//                               const Expanded(child: XMargin(5)),
//                               TextOf('N 3,000', 20, FontWeight.w500, deepBlue)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const YMargin(10),
//                     Material(
//                       elevation: 4.0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: white,
//                             borderRadius: BorderRadius.circular(13)),
//                         child: SideSpace(
//                           10,
//                           15,
//                           Row(
//                             children: [
//                               IconOf(Icons.check_circle_outline_rounded,
//                                   deepGreen1, 20),
//                               const XMargin(20),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   TextOf(
//                                       'Annually', 20, FontWeight.w400, black),
//                                   TextOf('valid for 360 days', 13,
//                                       FontWeight.w400, ash),
//                                 ],
//                               ),
//                               const Expanded(child: XMargin(5)),
//                               TextOf(
//                                   'N 10,000', 20, FontWeight.w500, deepGreen1)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const YMargin(40),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconOf(Icons.crop_square_rounded, colorPrimary, 20),
//                         TextOf('Set up payment to renew automatically', 15,
//                             FontWeight.w400, ash)
//                       ],
//                     ),
//                     const YMargin(40),
//                     InkWell(
//                       onTap: () {
//                         navigate(context, const PaymentMethod());
//                       },
//                       child: Container(
//                         width: 200,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SideSpace(
//                               10,
//                               10,
//                               TextOf('Continue', 15, FontWeight.w400, white),
//                             )
//                           ],
//                         ),
//                         decoration: BoxDecoration(
//                             color: colorPrimary,
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ))),
//     );
//   }
// }
