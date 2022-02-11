import 'package:flutter/material.dart';



class BottomNavBarItem extends StatefulWidget {
  final IconData iconBold;
  final IconData iconLight;
  final int index;
  final int selectedIndex;
  final Function setSelectedIndex;
  const BottomNavBarItem({
    Key? key,
    required this.iconBold,
    required this.iconLight,
    required this.index,
    required this.selectedIndex,
    required this.setSelectedIndex
  }) : super(key: key);

  @override
  State<BottomNavBarItem> createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  isSelected(){
    return widget.index == widget.selectedIndex;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.setSelectedIndex(widget.index);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: isSelected() ? Colors.black : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        child: Icon(
          isSelected() ? widget.iconBold : widget.iconLight,
          color: isSelected() ? Colors.white : Colors.grey[700]
          ),
      ),
    );
  }
}