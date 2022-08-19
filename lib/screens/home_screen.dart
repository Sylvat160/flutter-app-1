
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tchat/pages/calls_page.dart';
import 'package:tchat/pages/contacts_page.dart';
import 'package:tchat/pages/messages_page.dart';
import 'package:tchat/pages/notifications_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MessagesPage(),
    NotificationPage(),
    CallPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget{
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _NavigationBatItem(
            index: 0,
            label: 'messages',
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
          ),
          _NavigationBatItem(
            index: 1,
            label: 'notifications',
            icon: CupertinoIcons.bell_solid,
          ),
          _NavigationBatItem(
            index: 2,
            label: 'calls',
            icon: CupertinoIcons.phone_fill,
          ),
          _NavigationBatItem(
            index: 3,
            label: 'contacts',
            icon: CupertinoIcons.person_2_fill,
          ),
        ],
      ),
    );
  }
}

class _NavigationBatItem extends StatelessWidget {
  const _NavigationBatItem({
    Key? key, 
    required this.index,
    required this.label,
    required this.icon
  }) : super(key: key);

  final int index;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20,),
            SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 11
              ),
            )
          ],
        ),
      ),
    );
  }
}