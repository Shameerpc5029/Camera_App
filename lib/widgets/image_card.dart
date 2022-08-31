import 'dart:io';

import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String path;
  const ImageCard({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          image: FileImage(
            File(
              path,
            ),
          ),
        ),
      );
}
