

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SidebarItem {
  String title;
  LinearGradient background;
  Icon icon;

  SidebarItem(
      {required this.title, required this.background, required this.icon});
}

List<SidebarItem> sidebarItem = [
  SidebarItem(
    title: '主页',
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    icon: Icon(
      Icons.home,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: '图书',
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFA7D75),
        Color(0xFFC23D61),
      ],
    ),
    icon: Icon(
      Platform.isAndroid? Icons.library_books:CupertinoIcons.book_solid,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: '钱包',
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFAD64A),
        Color(0xFFEA880F),
      ],
    ),
    icon: Icon(
      Icons.credit_card,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: '设置',
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
    icon: Icon(
      Platform.isAndroid? Icons.settings:CupertinoIcons.settings_solid,
      color: Colors.white,
    ),
  ),
];
