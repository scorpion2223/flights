import 'dart:io';

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget{
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({super.key, required this.pageIndex, required this.onTap});
  @override
  Widget build(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      left: 1,
      right: 1,
      bottom: Platform.isAndroid?1:0,

    ),
    child: BottomAppBar(
      elevation: 0.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 60,
          color: Colors.green,
          child: Row(children: [
            navItem(

                Icons.person,
                pageIndex == 0,
              onTap: ()=>onTap(0),
            ),
            navItem(
              Icons.hotel,
              pageIndex == 1,
              onTap: ()=>onTap(1),
            ),
            navItem(
              Icons.flight_takeoff_sharp,
              pageIndex == 2,
              onTap: ()=>onTap(2),
            ),
            navItem(
              Icons.local_airport,
              pageIndex == 3,
              onTap: ()=>onTap(3),
            ),
            navItem(
              Icons.notifications,
              pageIndex == 4,
              onTap: ()=>onTap(4),
            ),
          ],)
          ,
        ),
      ),
    ),
  );
  }

  Widget navItem(IconData icon,bool selected,{Function()?onTap}){
    return Expanded(child: InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: selected?Colors.white:Colors.white.withOpacity(0.4),
      ),

    ));

  }
  
}