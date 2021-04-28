import 'package:flutter/material.dart';

class BuildDrawerList extends StatelessWidget {
  final Widget leading;
  final String title;
  final Color color;
  final Function onTap;

  const BuildDrawerList({
    Key key,
    this.color,
    @required this.leading,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      trailing: Icon(
        Icons.navigate_next,
        color: Colors.white,
      ),
      title: Transform.translate(
        offset: Offset(0, 3),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: color ?? Colors.white,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
