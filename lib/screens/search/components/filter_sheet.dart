import 'package:flutter/material.dart';

class FilterSheets extends StatelessWidget {
  const FilterSheets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Filter by Price",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: [
              FilterChip(label: const Text("\$5"), onSelected: (_) {}),
              FilterChip(label: const Text("\$10"), onSelected: (_) {}),
              FilterChip(label: const Text("\$20"), onSelected: (_) {}),
              FilterChip(label: const Text("\$50"), onSelected: (_) {}),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Apply filter logic here
                Navigator.pop(context);
              },
              child: const Text("Apply Filter"),
            ),
          ),
        ],
      ),
    );
  }
}
