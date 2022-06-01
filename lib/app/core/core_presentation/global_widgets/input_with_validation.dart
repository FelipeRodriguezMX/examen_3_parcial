part of './global_widgets.dart';

class InputWithValidation extends StatefulWidget {
  const InputWithValidation({
    Key? key,
    this.maxLines = 1,
    this.hintText,
    this.label,
    this.validator,
    this.controller,
  }) : super(key: key);
  final int? maxLines;
  final String? hintText;
  final String? label;
  final Function? validator;
  final TextEditingController? controller;

  @override
  InputWithValidationState createState() => InputWithValidationState();
}

class InputWithValidationState extends State<InputWithValidation> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          child: Text(
            widget.label ?? '',
            style: theme.textTheme.bodyText1,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.all(10),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (String? value) {
            if (value!.trim().isEmpty) {
              return 'Campo vació';
            }
            return null;
          },
          maxLines: widget.maxLines,
        ),
      ],
    );
  }
}
