import 'package:flutter/material.dart';
import 'package:messaging_app/utils/color_theme.dart';

class ReadMore extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  const ReadMore({Key? key, required this.text, required this.textStyle})
      : super(key: key);

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        expanded == false
            ? Text(
                widget.text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: widget.textStyle,
              )
            : Text(
                widget.text,
                style: widget.textStyle,
              ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  expanded == false ? "Show More" : "Show Less",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorTheme.kPrimaryColor),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
