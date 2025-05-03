import 'package:flutter/material.dart';
import 'package:khedma_link/screens/project_detail_page/components/progress_indicator.dart';

class OverallRating extends StatelessWidget {
  const OverallRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgressIndicator(text: '5', value: 1.0),
              RatingProgressIndicator(text: '4', value: 0.8),
              RatingProgressIndicator(text: '3', value: 0.6),
              RatingProgressIndicator(text: '2', value: 0.4),
              RatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
