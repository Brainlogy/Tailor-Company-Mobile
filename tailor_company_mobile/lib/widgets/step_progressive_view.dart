import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';

class StepProgressView extends StatelessWidget {
  final double _width;
  final List<String> _titles;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = ColorConstants.paleMuse;
  final double lineHeight = 5.0;

  const StepProgressView({
    required int curStep,
    List<String> titles = const [],
    required double width,
    required Color color,
    super.key,
  })  : _titles = titles,
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        assert(width > 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _width,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: _iconViews(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _titleViews(),
            ),
          ],
        ));
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, icon) {
      // var circleColor =
      //     (i == 0 || _curStep > i) ? _activeColor : _inactiveColor;
      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
      var iconColor = (i == 0 || _curStep > i) ? _activeColor : _inactiveColor;
      var icon = (i == 0 || _curStep > i) ? Icons.check_circle : Icons.circle;

      list.add(
        Icon(
          icon,
          color: iconColor,
          size: 16.0,
        ),
      );

      //line between icons
      if (i != _titles.length - 1) {
        list.add(Expanded(
            child: Container(
          height: lineHeight,
          color: lineColor,
        )));
      }
    });

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      var titleColor =
          (i == 0 || _curStep > i) ? _activeColor : ColorConstants.secondary;
      list.add(Text(text,
          style: TextStyle(
            color: titleColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          )));
    });
    return list;
  }
}
