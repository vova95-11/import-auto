import 'package:flutter/material.dart';

class UAuctionCardText extends StatelessWidget {
  const UAuctionCardText({
    super.key,
    required this.title,
    this.smallSize = false,
    required this.maxLines,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelSmall
          : Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold, fontSize: 11),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
