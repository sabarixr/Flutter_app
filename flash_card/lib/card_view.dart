import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class FlashCardView extends StatelessWidget {
  final String text;

  const FlashCardView({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: TeXView(
            style: const TeXViewStyle(
              contentColor: Colors.blue,
              textAlign: TeXViewTextAlign.center,
              sizeUnit: TeXViewSizeUnit.pixels ,),
            renderingEngine: const TeXViewRenderingEngine.katex(),
            child: TeXViewDocument(text),
          ),
        )
        ,),
    );

  }
}