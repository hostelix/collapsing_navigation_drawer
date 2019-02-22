import 'package:flutter/material.dart';
import '../models/navigation_item.dart';
import '../ui/collapsing_list_tile.dart';
import '../ui/theme.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double _maxWidth = 250;
  double _minWidth = 70;
  bool _isCollapsed = false;
  AnimationController _animationController;
  Animation<double> _withAnimation;
  int _currentIndexMenu = 0;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _withAnimation =
        Tween(begin: _maxWidth, end: _minWidth).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(BuildContext context, Widget widget) {
    return Material(
      elevation: 80,
      child: Container(
        width: _withAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            CollapsingListTile(
              title: "Israel Lugo",
              icon: Icons.account_circle,
              animationController: _animationController,
            ),
            Divider(
              color: Colors.grey,
              height: 40.0,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 12,
                  );
                },
                itemBuilder: (context, index) {
                  return CollapsingListTile(
                    title: navigationItems[index].title,
                    icon: navigationItems[index].icon,
                    animationController: _animationController,
                    isSelected: _currentIndexMenu == index,
                    onTab: () {
                      setState(() {
                        _currentIndexMenu = index;
                      });
                    },
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _isCollapsed = !_isCollapsed;

                  _isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: Colors.white,
                size: 40,
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
