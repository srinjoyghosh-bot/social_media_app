import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/utils/global_variables.dart';

import '../providers/user_provider.dart';
import '../utils/colors.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchUser();
  }

  fetchUser() async {
    await Provider.of<UserProvider>(context).refreshUser();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int value) {
    pageController.jumpToPage(value);
    setState(() {
      page = value;
    });
  }

  void onPageChanged(int value) {
    setState(() {
      page = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          'assets/ic_instagram.svg',
          color: primaryColor,
          height: 32,
        ),
        actions: [
          IconButton(
            onPressed: () => navigationTapped(0),
            icon: const Icon(Icons.home),
            color: page == 0 ? primaryColor : secondaryColor,
          ),
          IconButton(
            onPressed: () => navigationTapped(1),
            icon: const Icon(Icons.search),
            color: page == 1 ? primaryColor : secondaryColor,
          ),
          IconButton(
            onPressed: () => navigationTapped(2),
            icon: const Icon(Icons.add_a_photo),
            color: page == 2 ? primaryColor : secondaryColor,
          ),
          IconButton(
            onPressed: () => navigationTapped(3),
            icon: const Icon(Icons.favorite),
            color: page == 3 ? primaryColor : secondaryColor,
          ),
          IconButton(
            onPressed: () => navigationTapped(4),
            icon: const Icon(Icons.person),
            color: page == 4 ? primaryColor : secondaryColor,
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
    );
  }
}
