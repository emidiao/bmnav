// Copyright (c) 2018 Edwin Jose. All rights reserved.
// Licensed under the MIT license. See LICENSE file for full information.

import 'package:flutter/material.dart' as md;

class BottomNav extends md.StatefulWidget {
  final int index;
  final void Function(int i) onTap;
  final List<BottomNavItem> items;
  final md.EdgeInsets padding;
  final IconStyle iconStyle;
  final IconStyle selectedIconStyle;

  BottomNav({
    this.index,
    this.onTap,
    this.items,
    this.padding,
    this.iconStyle,
    this.selectedIconStyle
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
  md.EdgeInsets padding = md.EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0);

  @override
  void initState() {
    currentIndex = widget.index;

    padding = widget.padding != null ? widget.padding : padding;

    super.initState();
  }

  @override
  md.Widget build(md.BuildContext context) {
    return md.Material(
      elevation: 8.0,
      color: md.Colors.white,
      child: md.Padding(
        padding: padding,
        child: md.Row(
          mainAxisAlignment: md.MainAxisAlignment.spaceAround,
          mainAxisSize: md.MainAxisSize.max,
          children: widget.items.map((b) => BMNavItem(
            icon: b.icon,
            index: widget.items.indexOf(b),
            onTap: () => onItemClick(widget.items.indexOf(b)),
            currentIndex: currentIndex,
            iconStyle: widget.iconStyle,
            selectedIconStyle: widget.selectedIconStyle,
          )).toList(),
        )
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

class IconStyle {
  final double size;
  final md.Color color;

  IconStyle({this.size, this.color});
}

class BMNavItem extends md.StatelessWidget {
  final md.IconData icon;
  final void Function() onTap;
  final int index;
  final int currentIndex;
  final IconStyle iconStyle;
  final IconStyle selectedIconStyle;

  BMNavItem({
    this.icon,
    this.onTap,
    this.index,
    this.currentIndex,
    this.iconStyle,
    this.selectedIconStyle,
  }) : 
    assert(icon != null),
    assert(onTap != null),
    assert(index != null),
    assert(currentIndex != null);

  @override
  md.Widget build(md.BuildContext context) {
    final bool selected = currentIndex == index;

    final double size = iconStyle != null &&
      iconStyle.size != null ? iconStyle.size : 24.0;

    final double selectedSize = selectedIconStyle != null &&
      selectedIconStyle.size != null ? selectedIconStyle.size : 24.0;

    final md.Color color = iconStyle != null &&
      iconStyle.color != null ? iconStyle.color : md.Colors.grey[700];

    final md.Color selectedColor = selectedIconStyle != null &&
      selectedIconStyle.color != null ? selectedIconStyle.color : md.Colors.blue;

    return md.Expanded(
      child: md.InkResponse(
        child: md.Icon(
          icon,
          size: selected ? selectedSize : size,
          color: selected ? selectedColor : color
        ),
        highlightColor: md.Theme.of(context).highlightColor,
        splashColor: md.Theme.of(context).splashColor,
        radius: md.Material.defaultSplashRadius,
        onTap: () => onTap(),
      )
    );
  }  
}