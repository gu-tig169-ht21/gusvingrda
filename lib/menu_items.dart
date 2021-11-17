import 'package:flutter/material.dart';
import 'menu_item.dart';

class MenuItems {
  static const List<MenuItem> itemsFirst = [itemAdd, itemFilter, itemSettings];

  static const itemAdd = MenuItem(text: 'Create new task', icon: Icons.add);
  static const itemFilter =
      MenuItem(text: 'Filter your tasks', icon: Icons.sort);
  static const itemSettings = MenuItem(text: 'Settings', icon: Icons.settings);
}
