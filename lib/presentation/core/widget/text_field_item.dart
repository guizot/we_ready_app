import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant/form_type.dart';
import '../handler/dialog_handler.dart';
import 'package:intl/intl.dart';

class TextFieldItem extends StatefulWidget {
  const TextFieldItem({
    super.key,
    required this.title,
    this.formType = FormType.text,
    this.inputType = TextInputType.text,
    this.preText = "",
    this.fieldValue
  });

  final String title;
  final FormType formType;
  final TextInputType inputType;
  final String preText;
  final dynamic fieldValue;

  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {

  bool switchValue = false;
  String dateValue = "01 Jan 2025 - 00:00";
  String textValue = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      switch(widget.formType) {
        case FormType.text:
          textValue = widget.fieldValue ?? "";
        case FormType.date:
          dateValue = widget.fieldValue ?? "01 Jan 2025 - 00:00";
        case FormType.switcher:
          switchValue = widget.fieldValue ?? false;
      }
    });
  }

  Widget switchItem({
    required String text,
    required Color color,
    required GestureTapCallback onTap
  }) {
    return Expanded(
      child: GestureDetector(
          onTap: onTap,
          child: ClipPath(
            clipper: const ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))
                )
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: color,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        )
    );
  }

  void datePicker(BuildContext context) {
    DialogHandler.showBottomSheet(
        context: context,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 5.0,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                        color: Theme.of(context).hoverColor,
                        borderRadius: const BorderRadius.all(Radius.circular(25.0))
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                          height: 215,
                          color: Theme.of(context).colorScheme.surface,
                          child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            mode: CupertinoDatePickerMode.dateAndTime,
                            onDateTimeChanged: (DateTime newDate) {
                              setState(() {
                                String formattedDate = DateFormat('dd MMM yyyy - HH:mm').format(newDate);
                                dateValue = formattedDate;
                              });
                            },
                          )
                      ),
                    ),
                  )
                ],
              )
          ),
        )
    );
  }

  Widget formWidget(BuildContext context) {
    if(widget.formType == FormType.text) {
      return ClipPath(
          clipper: const ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))
              )
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  widget.preText != "" ? Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).highlightColor,
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      widget.preText,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ) : Container(),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'input ${widget.title.toLowerCase()}',
                        hintStyle: TextStyle(
                            color: Theme.of(context).iconTheme.color?.withAlpha(70),
                            fontWeight: FontWeight.normal
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surface,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: widget.inputType,
                      maxLines: widget.inputType == TextInputType.multiline ? null : 1,
                    ),
                  ),
                ],
              ),
            ),
          )
      );
    }
    else if(widget.formType == FormType.switcher) {
      return Row(
        children: [
          switchItem(
            text: "Confirmed",
            color: switchValue ? Colors.green : Theme.of(context).highlightColor,
            onTap: () {
              setState(() {
                switchValue = true;
              });
            }
          ),
          const SizedBox(width: 8),
          switchItem(
            text: "Unconfirmed",
            color: !switchValue ? Colors.green : Theme.of(context).highlightColor,
            onTap: () {
              setState(() {
                switchValue = false;
              });
            }
          ),
        ],
      );
    }
    else if(widget.formType == FormType.date) {
      return Row(
        children: [
          switchItem(
            text: dateValue,
            color: Theme.of(context).highlightColor,
            onTap: () {
              datePicker(context);
            }
          )
        ],
      );
    }
    return Container();
  }

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
                  formWidget(context)
                ],
              ),
            )
        ),
        const SizedBox(height: 16),
      ],
    );

  }

}