import 'package:flutter/material.dart';

Row screenHeading(
    String mainText, String subText, MainAxisAlignment alignment) {
  return Row(
    mainAxisAlignment: alignment,
    children: [
      Text(
        mainText,
        style: TextStyle(fontSize: 22),
      ),
      Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 2, right: 4, left: 4),
          child: Text(
            subText,
            style: TextStyle(color: Color(0xFFFFEA00)),
          ),
        ),
      )
    ],
  );
}

Card darkYellowButton(String text, VoidCallback onTap, {double fontSize = 12}) {
  return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Color(0xFF2F2F2F),
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 12.0, 30.0, 12.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'Poppins-Bold',
                color: Color(0xFFFFEA00),
              ),
            ),
          ),
        ),
      ));
}

Card lightDarkButton(String text, VoidCallback onTap, {double fontSize = 12}) {
  return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Color(0xFFFEFFFE),
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 12.0, 30.0, 12.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'Poppins-Bold',
                color: Color(0xFF2F2F2F),
              ),
            ),
          ),
        ),
      ));
}

Card yellowDarkButton(String text, VoidCallback onTap,
    {double fontSize = 12, IconData? icon}) {
  return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Color(0XFFFFEA00),
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 12.0, 30.0, 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'Poppins-Bold',
                    color: Color(0xFF2F2F2F),
                  ),
                ),
                icon != null
                    ? Icon(
                        icon,
                        size: 20,
                        color: Color(0xFF2F2F2F),
                      )
                    : SizedBox(
                        width: 0.0001,
                      )
              ],
            ),
          ),
        ),
      ));
}

Card darkLightButton(String text, VoidCallback onTap,
    {double fontSize = 12, IconData? icon}) {
  return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Color(0xFF2F2F2F),
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 12.0, 30.0, 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'Poppins-Bold',
                    color: Color(0XFFFEFFFE),
                  ),
                ),
                icon != null
                    ? Icon(
                        icon,
                        size: 20,
                        color: Color(0XFFFEFFFE),
                      )
                    : SizedBox(
                        width: 0.0001,
                      )
              ],
            ),
          ),
        ),
      ));
}

AnimatedBuilder rotator(
    AnimationController controller, BuildContext context, Widget? widget) {
  return AnimatedBuilder(
    animation: controller,
    builder: (context, widget) {
      return Transform.rotate(
        angle: controller.value * 2.0 * 3.141,
        child: widget,
      );
    },
    child: widget,
  );
}
