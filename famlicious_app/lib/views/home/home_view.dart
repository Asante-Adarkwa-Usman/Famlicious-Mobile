import 'package:famlicious_app/views/chat/chat_view.dart';
import 'package:famlicious_app/views/favorite/favorite_view.dart';
import 'package:famlicious_app/views/profile/profile_view.dart';
import 'package:famlicious_app/views/timeline/timeline_view.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final List<Widget> _views = [
    const TimelineView(),
    const ChatView(),
    const FavoriteView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).iconTheme.color,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: _currentIndex,
        // type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(UniconsLine.history), label: 'Timeline'),
          BottomNavigationBarItem(
              icon: Icon(UniconsLine.comment_dots), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(UniconsLine.heart), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(UniconsLine.user_md), label: 'Profile'),
        ],
      ),
      body: IndexedStack(
        children: _views,
        index: _currentIndex,
      ),
    );
  }
}
