import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'small_circle_icon.dart';

// Widget get all svgs from folder "others" and create list of icons from them
class SmallIconsWrapWidget extends StatefulWidget {
  const SmallIconsWrapWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SmallIconsWrapWidget> createState() => _SmallIconsWrapWidgetState();
}

class _SmallIconsWrapWidgetState extends State<SmallIconsWrapWidget> {

  Future<List<String>> _initImages() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('assets/icons/instruments/others/'))
        .where((String key) => key.contains('.svg'))
        .toList();

    return imagePaths;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: _initImages(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                for (var path in snapshot.data!)
                  SmallCircleIcon(
                    iconPath: path,
                    title: File(path)
                        .uri
                        .pathSegments
                        .last
                        .replaceAll(".svg", "")
                        .replaceAll("_", " "),
                  )
              ],
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SelectableText(
                      'Error: ${snapshot.error}, cant load icons'),
                )
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
