// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_conditional_rendering/conditional.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
//
// import '../../../Bussnies_logic_layer/notifications/cubit.dart';
// import '../../../Bussnies_logic_layer/notifications/states.dart';
// import '../../../constants/colors.dart';
// import '../../../constants/icons.dart';
// import '../../../constants/letters.dart';
// import '../../../responsive_ui/ui_component/info_widget.dart';
// import '../../component/myContainer.dart';
// import '../../component/navigat-to.dart';
// import '../profile/main_profile.dart';
// import 'hiveObjects/myNotification.dart';
// import 'hiveObjects/notifications.dart';
// import 'notificationDetailes.dart';
//
// class Notifications extends StatelessWidget {
//   Notifications({super.key});
//
//   static const route = '/notification';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Align(
//             alignment: Alignment.topRight, child: Text("الاشعارات")),
//         leading: BackArrowIcon(context),
//       ),
//       body: BlocProvider(
//         create: (BuildContext context) =>
//             NotificationsCubit()..getNotification(),
//         child: BlocBuilder<NotificationsCubit, NotificationsStates>(
//           builder: (context, state) {
//             var cubit = NotificationsCubit.get(context);
//             return notificationBody(context, cubit);
//           },
//         ),
//       ),
//     );
//   }
// }
//
// Widget notificationBody(context, cubit) {
//   return InfoWidget(
//     builder: (context, deviceInfo) {
//       return SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Conditional.single(
//           context: context,
//           conditionBuilder: (context) => cubit.notificationModel != null,
//           widgetBuilder: (context) {
//             if (cubit.notificationModel!.data.isEmpty)
//               return SizedBox(
//                   width: MediaQuery.of(context).size.width.w,
//                   height: MediaQuery.of(context).size.height / 1.3.h,
//                   child: Center(child: noNotificationMessage));
//             return SizedBox(
//               width: deviceInfo.screenWidth,
//               height: deviceInfo.screenHeight! / 1.2.h,
//               child: RefreshIndicator(
//                 onRefresh: () => cubit.refreshNotificationsList(),
//                 child: ListView.builder(
//                   // reverse: true,
//                   itemCount: cubit.notificationModel!.data.length,
//                   itemBuilder: (context, index) {
//                     return notificationItem(
//                         context, index, cubit.notificationModel!, cubit);
//                   },
//                 ),
//               ),
//             );
//           },
//           fallbackBuilder: (BuildContext context) {
//             return SizedBox(
//                 width: MediaQuery.of(context).size.width.w,
//                 height: MediaQuery.of(context).size.height / 1.3.h,
//                 child: Center(
//                     child: CircularProgressIndicator(
//                   color: AppColors.myGreen,
//                 )));
//           },
//         ),
//       );
//     },
//   );
// }
//
// Widget notificationItem(context, index, notifications, cubit) {
//   return MyContainer(
//     height: MediaQuery.of(context).size.height / 5.5.h,
//     width: MediaQuery.of(context).size.width.w,
//     icon: Icon(notifications.data[index].type == "success"
//         ? Icons.notification_add_outlined
//         : Icons.notification_important_outlined),
//     ontap: () {
//       // notifications.save();
//       // print(notifications);
//       cubit.changeReadState(notifications.data[index].id);
//       navigateTo(context,
//           NotificationDetailes(notification: notifications.data[index]));
//       cubit.refreshNotificationsList();
//     },
//     widget: Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
//           child: Text("${notifications.data[index].title}",
//               style: TextStyle(
//                 fontWeight: notifications.data[index].isRead != 0
//                     ? FontWeight.normal
//                     : FontWeight.bold,
//                 color: AppColors.myBlue,
//                 fontSize: 22.sp,
//               )),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
//           child: Text("${notifications.data[index].description}",
//               style: TextStyle(
//                 fontWeight: notifications.data[index].isRead != 0
//                     ? FontWeight.normal
//                     : FontWeight.bold,
//                 color: AppColors.myBlue,
//                 fontSize: 21.sp,
//               )),
//         ),
//         Text(
//           "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} - ${DateTime.now().hour}:${DateTime.now().minute}pm",
//           style: TextStyle(color: Colors.grey.shade600),
//         ),
//       ],
//     ),
//   );
// }
