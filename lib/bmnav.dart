// Copyright (c) 2018 Edwin Jose. All rights reserved.
// Licensed under the MIT license. See LICENSE file for full information.

import 'package:flutter/material.dart' as md;

class BottomNav extends md.StatefulWidget {
  final int index;
  final void Function(int i) onTap;
  final List<BottomNavItem> items;
  final md.Color iconColor;
  final md.Color iconSelectedColor;

  BottomNav({
    this.index,
    this.onTap,
    this.items,
    this.iconColor,
    this.iconSelectedColor
  }) :
    assert(index != null),
    assert(onTap != null),
    assert(items != null),
    assert(items.length >= 2);

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends md.State<BottomNav> {
  int currentIndex = 0;
  md.Color iconColor = md.Colors.grey[600];
  md.Color iconSelectedColor = md.Colors.blue;

  @override
  void initState() {
    currentIndex = widget.index;
    if (widget.iconColor != null) {
      iconColor = widget.iconColor;
    }
    if (widget.iconSelectedColor != null) {
      iconSelectedColor = widget.iconSelectedColor;
    }
    super.initState();
  }

  @override
  md.Widget build(md.BuildContext context) {
    return md.Material(
      elevation: 8.0,
      color: md.Colors.white,
      child: md.Row(
        mainAxisAlignment: md.MainAxisAlignment.spaceAround,
        mainAxisSize: md.MainAxisSize.max,
        children: widget.items.map((b) => BMNavItem(
          icon: b.icon,
          index: widget.items.indexOf(b),
          onTap: () => onItemClick(widget.items.indexOf(b)),
          currentIndex: currentIndex,
          iconColor: iconColor,
          iconSelectedColor: iconSelectedColor,
        )).toList(),
      )
    );
  }

  onItemClick(int i) {
    setState(() {
      currentIndex = i;
    });
    widget.onTap(i);
  }
}

class BottomNavItem {
  final md.IconData icon;

  BottomNavItem(this.icon);
}

class BMNavItem extends md.StatelessWidget {
  final md.IconData icon;
  final void Function() onTap;
  final int index;
  final int currentIndex;
  final md.Color iconColor;
  final md.Color iconSelectedColor;

  BMNavItem({
    this.icon,
    this.onTap,
    this.index,
    this.currentIndex,
    this.iconColor,
    this.iconSelectedColor,
  }) : 
    assert(icon != null),
    assert(onTap != null),
    assert(index != null),
    assert(currentIndex != null),
    assert(iconColor != null),
    assert(iconSelectedColor != null);

  @override
  md.Widget build(md.BuildContext context) {
    return md.Expanded(
      child: md.InkResponse(
        child: md.Padding(
          padding: md.EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
          child: md.Icon(
            icon,
            size: 24.0,
            color: currentIndex == index ? iconSelectedColor : iconColor
          ),
        ),
        highlightColor: md.Theme.of(context).highlightColor,
        splashColor: md.Theme.of(context).splashColor,
        radius: md.Material.defaultSplashRadius,
        onTap: () => onTap(),
      )
    );
  }  
}