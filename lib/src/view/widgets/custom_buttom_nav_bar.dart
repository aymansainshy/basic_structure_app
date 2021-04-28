import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import '../utils/app_constant.dart';

class BottomIndicatorNavigationBarItem {
  final IconData icon;
  final String title;
  final Color backgroundColor;

  BottomIndicatorNavigationBarItem({
    @required this.icon,
    this.title,
    this.backgroundColor = AppColors.primaryColor,
  });
}

// ignore: must_be_immutable
class BottomIndicatorBar extends StatefulWidget {
  final Color indicatorColor;
  final Color activeColor;
  final Color inactiveColor;
  final bool shadow;
  int currentIndex;
  IconData iconData;
  final ValueChanged<int> onTap;
  final List<BottomIndicatorNavigationBarItem> items;

  BottomIndicatorBar({
    Key key,
    @required this.onTap,
    @required this.items,
    this.activeColor,
    this.inactiveColor = Colors.grey,
    this.indicatorColor,
    this.shadow = true,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  State createState() => _BottomIndicatorBarState();
}

class _BottomIndicatorBarState extends State<BottomIndicatorBar> {
  static const double BAR_HEIGHT = 56;
  static const double INDICATOR_HEIGHT = 2.5;

  List<BottomIndicatorNavigationBarItem> get items => widget.items;

  double width = 0;
  Color activeColor;
  Duration duration = Duration(milliseconds: 170);

  double _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr)
      return lerpDouble(-1.0, 1.0, index / (items.length - 1));
    else
      return lerpDouble(1.0, -1.0, index / (items.length - 1));
  }

  @override
  void initState() {
    super.initState();
    // widget.iconData = widget.items[widget.currentIndex].icon;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    activeColor = widget.activeColor ?? Theme.of(context).indicatorColor;

    return Container(
      height: BAR_HEIGHT + MediaQuery.of(context).viewPadding.bottom,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        boxShadow: widget.shadow
            ? [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ]
            : null,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: INDICATOR_HEIGHT,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => _select(index, item),
                  child: _buildItemWidget(
                      item, index == widget.currentIndex, index),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 0,
            width: width,
            child: AnimatedAlign(
              alignment:
                  Alignment(_getIndicatorPosition(widget.currentIndex), 0),
              curve: Curves.linear,
              duration: duration,
              child: Container(
                color: widget.indicatorColor ?? activeColor,
                width: width / items.length,
                height: INDICATOR_HEIGHT,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _select(int index, BottomIndicatorNavigationBarItem item) {
    widget.iconData = item.icon;
    widget.currentIndex = index;
    widget.onTap(widget.currentIndex);

    setState(() {});
  }

  Widget _setIcon(BottomIndicatorNavigationBarItem item, int index) {
    return Column(
      children: [
        Icon(
          item.icon,
          color:
              widget.currentIndex == index ? activeColor : widget.inactiveColor,
          size: widget.currentIndex == index ? 26.0 : 25.0,
        ),
        if (item.title != null)
          SizedBox(height: widget.currentIndex == index ? 3.0 : 2.5),
        if (item.title != null)
          Text(
            item.title,
            style: TextStyle(
              fontSize: 13,
              color: widget.currentIndex == index
                  ? activeColor
                  : widget.inactiveColor,
            ),
          ),
      ],
    );
  }

  Widget _buildItemWidget(
      BottomIndicatorNavigationBarItem item, bool isSelected, int index) {
    return Container(
      color: item.backgroundColor,
      height: BAR_HEIGHT,
      width: width / items.length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _setIcon(item, index),
        ],
      ),
    );
  }
}
