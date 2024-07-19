import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Get.back();
        },
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query == '') {
              Get.back();
            } else {
              query = '';
            }
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
