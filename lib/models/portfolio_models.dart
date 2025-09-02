import 'package:flutter/material.dart';

class SkillCategory {
  final String id;
  final String name;
  final String description;
  final Icon icon;
  final Color color;
  final List<Project> projects;

  SkillCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.projects,
  });
}

class Project {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;
  final String duration;
  final bool isFeatured;
  final String category;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
    required this.duration,
    this.isFeatured = false,
    required this.category,
  });
}
