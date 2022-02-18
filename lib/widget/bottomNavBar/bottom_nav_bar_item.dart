import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/getx/categorie_controller.dart';
import 'package:tourism_app/getx/favorite_controller.dart';

class BottomNavBarItem extends StatefulWidget {
  final IconData iconBold;
  final IconData iconLight;
  final int index;
  final int selectedIndex;
  final Function setSelectedIndex;
  final bool? isFavoriteIttem;
  const BottomNavBarItem(
      {Key? key,
      required this.iconBold,
      required this.iconLight,
      required this.index,
      required this.selectedIndex,
      this.isFavoriteIttem,
      required this.setSelectedIndex})
      : super(key: key);

  @override
  State<BottomNavBarItem> createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  final FavoriteCategorie favoriteCategorie = Get.put(FavoriteCategorie());
  isSelected() {
    return widget.index == widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.setSelectedIndex(widget.index);
        });
      },
      child: Stack(children: [
        AnimatedContainer(
          margin: EdgeInsets.only(bottom: isSelected() ? 25 : 0),
          duration: Duration(milliseconds: 300),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: isSelected() ? Colors.black : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Icon(isSelected() ? widget.iconBold : widget.iconLight,
              color: isSelected() ? Colors.white : Colors.grey[700]),
        ),
        widget.isFavoriteIttem == true
            ? Positioned(
                top: 0,
                right: 0,
                child: Obx(() => Container(
                  padding: EdgeInsets.only(left: 2, right: 2),
                  decoration: BoxDecoration(
                    color: /* Colors.white */Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Text(
                      favoriteCategorie.favoriteList.length.toString(),
                      style: TextStyle(
                        color: /* Colors.red */ Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                )),
            )
            : Text('')
      ]),
    );
  }
}
