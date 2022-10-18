import 'package:flutter/material.dart';
import 'package:onekgp_app/ui/utils/size_config.dart';

class SecondaryButton extends StatefulWidget {
  final String text;
  final void Function()? onPress;
  const SecondaryButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  final MaterialStateProperty<Color> backgroundColor = MaterialStateProperty.all(Colors.black);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SizedBox(
      width: SizeConfig.sw,
      height: 40.toHeight,
      child: ElevatedButton(
        onPressed: widget.onPress,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 16.toFont,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
