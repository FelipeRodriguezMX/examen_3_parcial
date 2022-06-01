part of './global_widgets.dart';

class CustomElevatedButton extends StatelessWidget {
  ///Platform adaptive button. If the platform is android an ElevatedButton is
  ///shown, if the platform is iOS a CupertinoButton is shown
  ///when `isLoading` is true, `withLoader` needs to be true
  ///for the loading indicator to show
  const CustomElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.withLoader = false,
    this.isLoading = false,
    this.titleColor = Colors.white,
    this.buttonColor = Colors.blue,
    this.borderRadius = 8,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final Function()? onPressed;
  final String title;
  final bool withLoader;
  final bool isLoading;
  final Color titleColor;
  final Color buttonColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => buttonColor,
        ),
        padding: MaterialStateProperty.resolveWith(
          (states) => padding,
        ),
      ),
      child: Center(
        child: withLoader
            ? isLoading
                ? SizedBox(
                    height: 17,
                    width: 17,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(titleColor),
                    ),
                  )
                : Text(
                    title,
                    style: theme.textTheme.button!.copyWith(
                      color: titleColor,
                    ),
                  )
            : Text(
                title,
                style: theme.textTheme.button!.copyWith(
                  color: titleColor,
                ),
              ),
      ),
    );
  }
}
