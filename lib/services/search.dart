import 'package:flutter/material.dart';

class SearchBox extends SearchDelegate<String> {
  List<String> cityName;
  String? result;
  SearchBox({required this.cityName});

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          close(context, '');
        },
      );

  @override
  List<Widget>? buildActions(
    BuildContext context,
  ) {
    return [
      IconButton(
          onPressed: () {
            if (query == '') {
              close(context, '');
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
    final List<String> userLoc = [];
    for (var i in cityName) {
      if (i.toLowerCase().contains(query..toLowerCase())) {
        userLoc.add(i);
      }
    }

    return ListView.builder(
      itemCount: userLoc.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            result = userLoc.elementAt(index);
            close(context, result == null ? '' : result.toString());
          },
          title: Text(
            userLoc[index],
            style: const TextStyle(
                fontSize: 24, color: Colors.black, fontFamily: 'Quicksand'),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> userLoc = [];
    for (var i in cityName) {
      if (i.toLowerCase().contains(query..toLowerCase())) {
        userLoc.add(i);
      }
    }
    return ListView.builder(
      itemCount: userLoc.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            onTap: () {
              close(context, '');
            },
            title: const Text(
              'Use my Current location',
              style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 145, 41, 163),
                  fontFamily: 'Quicksand'),
            ),
            leading: const Icon(
              Icons.my_location,
              color: Color.fromARGB(255, 145, 41, 163),
              size: 24,
            ),
          );
        } else {
          return ListTile(
            onTap: () {
              query = userLoc.elementAt(index - 1);
              close(context, query);
            },
            title: Text(
              userLoc.elementAt(index - 1),
              style: const TextStyle(
                  fontSize: 24, color: Colors.black, fontFamily: 'Quicksand'),
            ),
          );
        }
      },
    );
  }
}
