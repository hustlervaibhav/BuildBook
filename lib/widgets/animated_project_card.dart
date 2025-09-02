import 'package:flutter/material.dart';
import 'package:netflix_portfolio/widgets/project_detail_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_models.dart';

class AnimatedProjectCard extends StatefulWidget {
  final Project project;

  const AnimatedProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<AnimatedProjectCard> createState() =>
      _AnimatedProjectCardState();
}

class _AnimatedProjectCardState
    extends State<AnimatedProjectCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: GestureDetector(
              onTap: () =>
                  _showProjectDetails(context),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.3),
                      blurRadius:
                          _isHovered ? 20 : 10,
                      spreadRadius:
                          _isHovered ? 2 : 0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      // Background Image
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                widget.project
                                    .imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Gradient Overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient:
                              LinearGradient(
                            begin: Alignment
                                .topCenter,
                            end: Alignment
                                .bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black
                                  .withOpacity(
                                      0.3),
                              Colors.black
                                  .withOpacity(
                                      0.8),
                            ],
                          ),
                        ),
                      ),

                      // Content
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding:
                              const EdgeInsets
                                  .all(20),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              // Category Badge
                              Container(
                                padding:
                                    const EdgeInsets
                                        .symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration:
                                    BoxDecoration(
                                  color:
                                      Colors.red,
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              12),
                                ),
                                child: Text(
                                  widget.project
                                      .category,
                                  style:
                                      const TextStyle(
                                    color: Colors
                                        .white,
                                    fontSize: 10,
                                    fontWeight:
                                        FontWeight
                                            .w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  height: 8),

                              // Title
                              Text(
                                widget.project
                                    .title,
                                style:
                                    const TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                  color: Colors
                                      .white,
                                ),
                              ),
                              const SizedBox(
                                  height: 8),

                              // Description
                              Text(
                                widget.project
                                    .description,
                                style:
                                    const TextStyle(
                                  fontSize: 13,
                                  color: Colors
                                      .white70,
                                  height: 1.3,
                                ),
                                maxLines: 3,
                                overflow:
                                    TextOverflow
                                        .ellipsis,
                              ),
                              const SizedBox(
                                  height: 12),

                              // Technologies
                              Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: widget
                                    .project
                                    .technologies
                                    .take(4)
                                    .map((tech) {
                                  return Container(
                                    padding:
                                        const EdgeInsets
                                            .symmetric(
                                      horizontal:
                                          8,
                                      vertical: 4,
                                    ),
                                    decoration:
                                        BoxDecoration(
                                      color: Colors
                                          .white
                                          .withOpacity(
                                              0.2),
                                      borderRadius:
                                          BorderRadius.circular(
                                              12),
                                      border:
                                          Border
                                              .all(
                                        color: Colors
                                            .white
                                            .withOpacity(
                                                0.3),
                                      ),
                                    ),
                                    child: Text(
                                      tech,
                                      style:
                                          const TextStyle(
                                        fontSize:
                                            10,
                                        color: Colors
                                            .white,
                                        fontWeight:
                                            FontWeight
                                                .w500,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Hover Actions
                      if (_isHovered)
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Row(
                            children: [
                              if (widget.project
                                      .githubUrl !=
                                  null)
                                _buildActionButton(
                                  Icons.code,
                                  () => _launchUrl(
                                      widget
                                          .project
                                          .githubUrl!),
                                ),
                              if (widget.project
                                      .liveUrl !=
                                  null) ...[
                                const SizedBox(
                                    width: 8),
                                _buildActionButton(
                                  Icons.launch,
                                  () => _launchUrl(
                                      widget
                                          .project
                                          .liveUrl!),
                                ),
                              ],
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionButton(
      IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.3),
              blurRadius: 8,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }

  void _showProjectDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ProjectDetailDialog(
          project: widget.project),
    );
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
