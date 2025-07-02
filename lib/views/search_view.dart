import 'package:flutter/material.dart';
import 'package:weather_app/utils/search_city_helper.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            controller: controller,
            onSubmitted: (value) {
              searchCity(context, value);
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              hintText: 'Enter city name',
              labelText: 'Search',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  searchCity(context, controller.text);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
