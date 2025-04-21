import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final Column body;
  final String label;
  const AnimatedButton({super.key, required this.body, required this.label});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool isAnimated = false;
  bool showContent = false;

  void toggleCard() {
    if (!isAnimated) {
      setState(() {
        isAnimated = true;
      });

      Future.delayed(Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            showContent = true;
          });
        }
      });
    } else {
      setState(() {
        showContent = false;
      });

      Future.delayed(Duration(milliseconds: 300), () {
        if (mounted) {
          setState(() {
            isAnimated = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Color(0xFF2F2F2F),
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: toggleCard,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 12.0, 30.0, 12.0),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              width: isAnimated ? MediaQuery.of(context).size.width - 20 : 50,
              height: isAnimated ? 200 : 20,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: isAnimated ? 0.0 : 1.0,
                    child: Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins-Bold',
                        color: Color(0xFFFFEA00),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: showContent ? 1.0 : 0.0,
                      child: SingleChildScrollView(child: widget.body)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
