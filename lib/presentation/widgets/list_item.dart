import 'package:flutter/material.dart';
import 'package:popg/presentation/screens/details_screen.dart';
import 'package:popg/presentation/widgets/custom_rating_bar.dart';

import '../../core/constants.dart';
import '../widgets/widgets.dart';

class ListItem extends StatelessWidget {
  final int id;

  final String coverRef;
  final String name;

  final double rating;

  ListItem({
    required this.id,
    required this.coverRef,
    required this.name,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.network(
              httpsAdd + coverRef,
              headers: {
                clientIdKey: clientIdValue,
                authKey: authValue,
              },
            ),
            title: Text(
              name,
            ),
            subtitle: CustomRatingBar(rating: rating),
            onTap: () {
              navigateDetails(context);
            },
            contentPadding: EdgeInsets.all(5),
          ),
        ),
      ),
    );
  }

  void navigateDetails(BuildContext context) {
    Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: id);
  }
}
