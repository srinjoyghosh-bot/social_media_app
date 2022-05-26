import 'package:flutter/material.dart';
import 'package:social_media_app/screens/add_post_screen.dart';
import 'package:social_media_app/screens/feed_screen.dart';

const int webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  Text('Search'),
  AddPostScreen(),
  Text('notif'),
  Text('profile'),
];
