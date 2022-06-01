part of './global_widgets.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      required this.icon,
      this.label,
      required this.onPress,
      this.backgroundColor = Colors.transparent,
      this.textColor = Colors.white})
      : super(key: key);
  final IconData icon;
  final String? label;
  final void Function() onPress;
  final Color backgroundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(50, 50),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: textColor,
            onTap: onPress,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: backgroundColor,
                  size: 25,
                ), // <-- Icon
                if (label != null)
                  Text(
                    label!,
                    style: TextStyle(color: textColor),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
