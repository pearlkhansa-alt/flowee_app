import 'package:flutter/material.dart';

class PromoBanner {
  final String title;
  final String subtitle;
  final String imageURL;
  final List<Color> gradientColors;

  PromoBanner({
    required this.title,
    required this.subtitle,
    required this.imageURL,
    required this.gradientColors,
  });
}
