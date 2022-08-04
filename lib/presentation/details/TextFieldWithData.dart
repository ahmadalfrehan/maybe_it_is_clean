import 'package:flutter/material.dart';

class TextFieldWithData extends StatelessWidget {
  final String dataName, text;
  final bool isExpanded;
  const TextFieldWithData(this.dataName, this.text, this.isExpanded, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3, right: 5),
              child: Text(
                dataName,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0, left: 5),
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(8),
                width: isExpanded ? size.width / 1.1 : size.width / 2.3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(child: Text(text)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
