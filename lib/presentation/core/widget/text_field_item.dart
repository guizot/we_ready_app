import 'package:flutter/material.dart';

class TextFieldItem extends StatefulWidget {
  const TextFieldItem({
    super.key,
    required this.title,
    this.isMultiline = false,
  });

  final String title;
  final bool isMultiline;

  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}


class _TextFieldItemState extends State<TextFieldItem> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipPath(
            clipper: const ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))
                )
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Theme.of(context).hoverColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_circle_right_rounded,
                        size: 18,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                            ),
                          )
                      ),
                      const SizedBox(width: 8.0),
                    ],
                  ),
                  const SizedBox(height: 8.0,),
                  TextFormField(
                    style: const TextStyle(
                        fontSize: 14
                    ),
                    decoration: InputDecoration(
                      hintText: 'Input ${widget.title}',
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    keyboardType: widget.isMultiline ? TextInputType.multiline : TextInputType.text,
                    maxLines: widget.isMultiline ? null : 1,
                  ),
                ],
              ),
            )
        ),
        const SizedBox(height: 16),
      ],
    );
  }

}