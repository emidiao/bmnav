// Copyright (c) 2018 Edwin Jose. All rights reserved.
// Licensed under the MIT license. See LICENSE file for full information.

import 'package:flutter/material.dart' as md;

class BottomNav extends md.StatefulWidget {
  final int index;
  final void Function(int i) onTap;
  final List<BottomNavItem> items;
  final bool showLabel;
  final bool showSelectedLabel;
  final double elevation;
  final double iconSize;
  final double selectedIconSize;
  final md.Color color;
  final md.Color selectedColor;
  final md.Color backgroundColor;
  final md.TextStyle textStyle;
  final md.TextStyle selectedTextStyle;

  BottomNav({
    this.index,
    this.onTap,
    this.items,
    this.showLabel,
    this.showSelectedLabel,
    this.elevation,
    this.iconSize,
    this.selectedIconSize,
    this.color,
    this.selectedColor,
    this.backgroundColor,
    this.textStyle,
    this.selectedTextStyle,
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
  double elevation = 8.0;
  double iconSize = 24.0;
  double selectedIconSize = 24.0;
  md.Color backgroundColor = md.Colors.white;
  bool showSelectedLabel = false;
  md.Color color = md.Colors.grey[700];
  md.Color selectedColor = md.Colors.blue;
  md.TextStyle textStyle;
  md.TextStyle selectedTextStyle;

  @override
  void initState() {
    elevation = widget.elevation ?? elevation;

    iconSize = widget.iconSize ?? iconSize;
    
    selectedIconSize = widget.selectedIconSize ?? selectedIconSize;

    backgroundColor = widget.backgroundColor ?? backgroundColor;

    showSelectedLabel = widget.showSelectedLabel ?? showSelectedLabel;

    color = widget.color ?? color;

    selectedColor = widget.selectedColor ?? selectedColor;

    currentIndex = widget.index;

    textStyle = widget.textStyle ?? md.TextStyle(color: color, fontSize: 12.0);

    selectedTextStyle = widget.selectedTextStyle ?? md.TextStyle(color: selectedColor, fontSize: 12.0);

    super.initState();
  }

  @override
  md.Widget build(md.BuildContext context) {
    return md.Material(
      elevation: elevation,
      color: backgroundColor,
      child: md.Row(
          mainAxisAlignment: md.MainAxisAlignment.spaceAround,
          mainAxisSize: md.MainAxisSize.max,
          children: widget.items.map((b) { 
            final int i = widget.items.indexOf(b);

            String label = b.label;
            if (showSelectedLabel) {
              label = showSelectedLabel && i == currentIndex ? b.label : null;
            }

            return BMNavItem(
              icon: b.icon,
              iconSize: i == currentIndex ? selectedIconSize : iconSize,
              label: label,
              onTap: () => onItemClick(i),
              textStyle: i == currentIndex ? selectedTextStyle : textStyle,
              color: i == currentIndex ? selectedColor : color,
            );
          }).toList(),
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
  final String label;

  BottomNavItem(this.icon, {this.label});
}

class BMNavItem extends md.StatelessWidget {
  final md.IconData icon;
  final double iconSize;
  final String label;
  final void Function() onTap;
  final md.Color color;
  final md.TextStyle textStyle;

  BMNavItem({
    this.icon,
    this.iconSize,
    this.label,
    this.onTap,
    this.color,
    this.textStyle,
  }) : 
    assert(icon != null),
    assert(iconSize != null),
    assert(color != null),
    assert(onTap != null);

  @override
  md.Widget build(md.BuildContext context) {
    double tbPadding = label != null ? ((56-textStyle.fontSize)-iconSize)/2 : (56-iconSize)/2;

    return md.Expanded(
      child: md.InkResponse(
        child: md.Padding(
          padding: md.EdgeInsets.fromLTRB(0.0, tbPadding, 0.0, tbPadding),
          child: md.Column(
            mainAxisSize: md.MainAxisSize.min,
            children: <md.Widget>[
              md.Icon(icon, size: iconSize, color: color),
              label != null ? md.Text(label, style: textStyle) : md.Container()
            ]
          )
        ),
        highlightColor: md.Theme.of(context).highlightColor,
        splashColor: md.Theme.of(context).splashColor,
        radius: md.Material.defaultSplashRadius,
        onTap: () => onTap(),
      )
    );
  }  
}