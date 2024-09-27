//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../constants/colors.dart';
// import '../../../constants/icons.dart';
// import '../../../responsive_ui/ui_component/info_widget.dart';
//
// class NotificationDetailes extends StatelessWidget {
//
//    var notification;
//    // NotificationDetailes({super.key, this.notification});
//    NotificationDetailes({ this.notification});
//   static const route='/notificationDetailes';
//
//   @override
//   Widget build(BuildContext context) {
//     final message=ModalRoute.of(context)!.settings.arguments;
//     // final datamessage=ModalRoute.of(context)!.settings.arguments;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Align(
//             alignment: Alignment.topRight,
//             child: Text("تفاصيل الاشعار")),
//         leading:BackArrowIcon(context),
//       ),
//       body:body(message,notification) ,
//     );
//   }
// }
//
//
//
// Widget body(message,notification){
//   return InfoWidget(
//       builder: (context,deviceInfo) {
//
//         return  Column(
//           children: [
//             SizedBox(
//               width: deviceInfo.screenWidth,
//               child: Center(
//                 child:Column(
//                   textDirection: TextDirection.rtl,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(message!=null?message.notification.title:notification.title,
//                           style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.myBlue,fontSize:22.sp)),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width.w,
//                       height: MediaQuery.of(context).size.height/1.5.h,
//                       child: ListView.builder(
//                         // reverse: true,
//                         itemCount: notification.data.length,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                           Padding(
//                           padding: const EdgeInsets.only(left: 8.0,right: 8),
//                           child:Text(":${message!=null?message:";;"}",
//                               style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey.shade500,fontSize:22.sp)
//                           ),
//                           ),
//                               Padding(
//                           padding: const EdgeInsets.only(left: 8.0,right: 8),
//                                child:Directionality(
//                                  textDirection: TextDirection.rtl,
//                                  child: Text( message!=null?message:";;",
//                                  style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.myBlue,fontSize:22.sp)
//                                  ),
//                                ),
//                               ),
//                             ],
//                           );
//
//
//                             // MyRow(
//                             //     text_1:":${notification.data[index].key}",
//                             //     text_2:  notification.data[index].value,
//                             // ),
//                           // );
//                         },
//                       ),
//                     ),
//                   ],
//                 ) ,
//               ),
//             ),
//           ],
//         );
//       }
//   );
// }
//
//
//
//
// // children: [
// // Padding(
// // padding: const EdgeInsets.only(left: 8.0,right: 8),
// // child: MyRow(
// // text_1: "العنوان",
// // text_2: "",
// // //" ${message != null ? message.notification!.title : notification!.title}",
// // ),
// // ),
// // Padding(
// // padding: const EdgeInsets.only(left: 8.0,right: 8),
// // child: MyRow(
// // text_1: "المحتوى",
// // text_2:" ${message != null ? message.notification!.body : notification!.content}",
// // ),
// // ),
// // Padding(
// // padding: const EdgeInsets.only(left: 8.0,right: 8),
// // child: MyRow(
// // text_1: "المحتوى",
// // text_2:" ${message != null ? message.data['description'] : notification!.data.description}",
// // ),
// // ),
// // ],