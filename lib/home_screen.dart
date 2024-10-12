import 'package:flightes/core/utils/constatnts/app_colors.dart';
import 'package:flightes/feature/air_porst/presentation/pages/air_porst_home_screen.dart';
import 'package:flightes/feature/flights/presentation/pages/insert_offers_information_screen.dart';
import 'package:flightes/feature/hotels/presentation/pages/hotels_home_screen.dart';
import 'package:flightes/feature/notifications/presentation/pages/notification_screen.dart';
import 'package:flightes/feature/user/presentation/pages/profile_home_screen.dart';
import 'package:flightes/nav_bar.dart';
import 'package:flutter/material.dart';

import 'nav_model.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
  
}

class _HomeScreen extends State<HomeScreen>{
  final flightsNavKey = GlobalKey<NavigatorState>();
  final hotelsNavKey = GlobalKey<NavigatorState>();
  final airPortsNavKey = GlobalKey<NavigatorState>();
  final notificationsNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTap = 2;
  final  screens= [
    ProfileHomeScreen(),
    HotelsHomeScreen(),
    InsertOffersInformationScreen(),
    AirPorstHomeScreen(),
    NotificationScreen()
  ];

  @override
  void initState(){
    super.initState();
    // items = [
    //   NavModel(page: ProfileHomeScreen(),
    //
    //       navKey: profileNavKey),
    //   NavModel(page: HotelsHomeScreen(),
    //
    //       navKey: hotelsNavKey),
    //   NavModel(page:InsertOffersInformationScreen(),
    //
    //       navKey: flightsNavKey),
    //   NavModel(page:AirPorstHomeScreen(),
    //
    //       navKey: airPortsNavKey),
    //   NavModel(page:NotificationScreen(),
    //
    //       navKey: notificationsNavKey)
    // ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[selectedTap],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.blue2,
          selectedItemColor: Colors.white,
          unselectedItemColor:Colors.white70,
          type: BottomNavigationBarType.fixed,
          onTap: (index)=>setState(() =>selectedTap = index),
          currentIndex: selectedTap,
          items:  const[
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),
            BottomNavigationBarItem(icon: Icon(Icons.hotel),label: "hotels"),
            BottomNavigationBarItem(icon: Icon(Icons.flight_takeoff_sharp),label: "flights"),
            BottomNavigationBarItem(icon: Icon(Icons.local_airport),label: "airports"),
          //  BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "notifications"),
          ],
        ),
      );
  }
  
}

