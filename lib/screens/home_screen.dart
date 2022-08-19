
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tchat/pages/calls_page.dart';
import 'package:tchat/pages/contacts_page.dart';
import 'package:tchat/pages/messages_page.dart';
import 'package:tchat/pages/notifications_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = const [
    MessagesPage(),
    NotificationPage(),
    CallPage(),
    ContactPage(),
  ];
  var index =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: (i){
          setState(() {
            index = i;
          });
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget{
  const _BottomNavigationBar({Key? key,
  required this.onItemSelected
  }) : super(key: key);

  final ValueChanged<int> onItemSelected; 

  @override
  Widget build(BuildContext context){
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          _NavigationBatItem(
            index: 0,
            label: 'messages',
            icon: CupertinoIcons.bubble_left_bubble_right_fill, 
            onTapped: onItemSelected,
          ),
          _NavigationBatItem(
            index: 1,
            label: 'notifications',
            icon: CupertinoIcons.bell_solid,
            onTapped: onItemSelected,
          ),
          _NavigationBatItem(
            index: 2,
            label: 'calls',
            icon: CupertinoIcons.phone_fill,
            onTapped: onItemSelected,
          ),
          _NavigationBatItem(
            index: 3,
            label: 'contacts',
            icon: CupertinoIcons.person_2_fill,
            onTapped: onItemSelected,
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
    required this.icon,
    required this.onTapped
  }) : super(key: key);


  final int index;
  final String label;
  final IconData icon;
  final ValueChanged<int> onTapped; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTapped(index);
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