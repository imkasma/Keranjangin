import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();

  List<String> items = [
    "Apple",
    "Banana",
    "Milk",
    "Egg",
    "Rice",
    "Oil",
  ];

  List<String> result = [];

  @override
  void initState() {
    super.initState();
    result = items;
  }

  void search(String query) {
    final data = items.where((item) {
      return item.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      result = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
          onChanged: search,
          decoration: const InputDecoration(
            hintText: "Search products...",
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(result[index]),
          );
        },
      ),
    );
  }
}