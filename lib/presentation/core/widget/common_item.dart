import 'package:flutter/material.dart';

class CommonItem extends StatefulWidget {
  const CommonItem({super.key, required this.title, required this.child, this.timestamp });
  final String title;
  final Widget child;
  final String? timestamp;

  @override
  State<CommonItem> createState() => _CommonItemState();
}

class _CommonItemState extends State<CommonItem> {

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
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),
                        ),
                      ),
                      widget.timestamp != null ? Text(
                        widget.timestamp!,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14
                        ),
                      ) : Container(),
                    ],
                  ),
                  const SizedBox(height: 12),
                  widget.child
                ],
              ),
            )
        ),
        const SizedBox(height: 16),
      ],
    );
  }

}