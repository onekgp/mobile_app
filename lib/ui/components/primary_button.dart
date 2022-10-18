import 'package:flutter/material.dart';
import 'package:onekgp_app/ui/utils/size_config.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: SizeConfig.sw,
      height: 50.toHeight,
      child: TextButton(
        onPressed: onPress,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0.toWidth),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.toFont,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
