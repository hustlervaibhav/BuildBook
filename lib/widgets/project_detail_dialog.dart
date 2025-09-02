import 'package:flutter/material.dart';
import 'package:netflix_portfolio/models/portfolio_models.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailDialog
    extends StatelessWidget {
  final Project project;

  const ProjectDetailDialog(
      {Key? key, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 800,
        height: 600,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color:
                  Colors.white.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            // Header with close button
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                children: [
                  Text(
                    project.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        Navigator.pop(context),
                    icon: const Icon(Icons.close,
                        color: Colors.white),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(
                        horizontal: 20),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    // Project Image
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(
                              12),
                      child: Image.network(
                        project.imageUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Description
                    Text(
                      'About This Project',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      project.description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Technologies
                    Text(
                      'Technologies Used',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: project
                          .technologies
                          .map((tech) {
                        return Container(
                          padding:
                              const EdgeInsets
                                  .symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration:
                              BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius
                                    .circular(16),
                          ),
                          child: Text(
                            tech,
                            style:
                                const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight:
                                  FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // Project Stats
                    Row(
                      children: [
                        _buildStat('Duration',
                            project.duration),
                        const SizedBox(width: 30),
                        _buildStat('Category',
                            project.category),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  if (project.githubUrl != null)
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () =>
                            _launchUrl(project
                                .githubUrl!),
                        icon: const Icon(
                            Icons.code),
                        label: const Text(
                            'View Code'),
                        style: ElevatedButton
                            .styleFrom(
                          backgroundColor:
                              Colors.white,
                          foregroundColor:
                              Colors.black,
                          padding:
                              const EdgeInsets
                                  .symmetric(
                                  vertical: 12),
                        ),
                      ),
                    ),
                  if (project.githubUrl != null &&
                      project.liveUrl != null)
                    const SizedBox(width: 15),
                  if (project.liveUrl != null)
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () =>
                            _launchUrl(
                                project.liveUrl!),
                        icon: const Icon(
                            Icons.launch),
                        label: const Text(
                            'Live Demo'),
                        style: ElevatedButton
                            .styleFrom(
                          backgroundColor:
                              Colors.red,
                          foregroundColor:
                              Colors.white,
                          padding:
                              const EdgeInsets
                                  .symmetric(
                                  vertical: 12),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
