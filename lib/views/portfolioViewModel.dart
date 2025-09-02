import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:netflix_portfolio/models/portfolio_models.dart';
import 'package:netflix_portfolio/services/portfolio_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// Models
// class SkillCategory {
//   final String id;
//   final String name;
//   final String description;
//   final IconData icon;
//   final Color color;
//   final List<Project> projects;

//   SkillCategory({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.icon,
//     required this.color,
//     required this.projects,
//   });
// }

// class Project {
//   final String id;
//   final String title;
//   final String description;
//   final String imageUrl;
//   final List<String> technologies;
//   final String? githubUrl;
//   final String? liveUrl;
//   final String duration;
//   final bool isFeatured;
//   final String category;

//   Project({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//     required this.technologies,
//     this.githubUrl,
//     this.liveUrl,
//     required this.duration,
//     this.isFeatured = false,
//     required this.category,
//   });
// }

// // Service
// class PortfolioService {
//   static Future<List<SkillCategory>>
//       fetchSkillCategories() async {
//     await Future.delayed(
//         const Duration(milliseconds: 500));

//     return [
//       SkillCategory(
//         id: 'featured',
//         name: 'Featured Projects',
//         description:
//             'My best work and achievements',
//         icon: Icons.star,
//         color: Colors.red,
//         projects: [
//           Project(
//             id: 'featured_1',
//             title:
//                 'InvoiceFlow - Invoice Trading Platform',
//             description:
//                 'A comprehensive fintech platform for invoice trading with real-time bidding, payment processing, and analytics dashboard. Built with Flutter for mobile and React for web admin panel.',
//             imageUrl:
//                 'https://via.placeholder.com/400x250/e74c3c/ffffff?text=InvoiceFlow',
//             technologies: [
//               'Flutter',
//               'React',
//               'Node.js',
//               'MongoDB',
//               'Stripe',
//               'Firebase'
//             ],
//             githubUrl:
//                 'https://github.com/vaibhavshukla/invoice-flow',
//             liveUrl: 'https://invoiceflow.app',
//             duration: '6 months',
//             isFeatured: true,
//             category: 'Fintech',
//           ),
//           Project(
//             id: 'featured_2',
//             title:
//                 'SmartLearn - AI-Powered Learning Platform',
//             description:
//                 'Educational platform with AI-driven personalized learning paths, video streaming, progress tracking, and collaborative features for students and teachers.',
//             imageUrl:
//                 'https://via.placeholder.com/400x250/3498db/ffffff?text=SmartLearn',
//             technologies: [
//               'React',
//               'Node.js',
//               'Python',
//               'TensorFlow',
//               'PostgreSQL',
//               'AWS'
//             ],
//             githubUrl:
//                 'https://github.com/vaibhavshukla/smart-learn',
//             liveUrl: 'https://smartlearn.edu',
//             duration: '4 months',
//             isFeatured: true,
//             category: 'EdTech',
//           ),
//         ],
//       ),
//       SkillCategory(
//         id: 'flutter',
//         name: 'Flutter',
//         description:
//             'Cross-platform Mobile & Web Applications',
//         icon: Icons.phone_android,
//         color: const Color(0xFF02569B),
//         projects: [
//           Project(
//             id: 'flutter_1',
//             title: 'CryptoWallet',
//             description:
//                 'Secure cryptocurrency wallet with multi-currency support, real-time price tracking, and trading features.',
//             imageUrl:
//                 'https://via.placeholder.com/400x250/f39c12/ffffff?text=CryptoWallet',
//             technologies: [
//               'Flutter',
//               'Provider',
//               'Secure Storage',
//               'REST APIs',
//               'Biometric Auth'
//             ],
//             githubUrl:
//                 'https://github.com/vaibhavshukla/crypto-wallet',
//             duration: '2 months',
//             category: 'Finance',
//           ),
//           Project(
//             id: 'flutter_2',
//             title: 'FoodieExpress',
//             description:
//                 'Food delivery app with real-time tracking, multiple payment options, and restaurant management dashboard.',
//             imageUrl:
//                 'https://via.placeholder.com/400x250/e67e22/ffffff?text=FoodieExpress',
//             technologies: [
//               'Flutter',
//               'Firebase',
//               'Google Maps',
//               'Payment Gateway',
//               'Push Notifications'
//             ],
//             githubUrl:
//                 'https://github.com/vaibhavshukla/foodie-express',
//             liveUrl:
//                 'https://play.google.com/store',
//             duration: '3 months',
//             category: 'Food & Delivery',
//           ),
//           Project(
//             id: 'flutter_3',
//             title: 'TaskMaster Pro',
//             description:
//                 'Advanced task management with team collaboration, time tracking, and productivity analytics.',
//             imageUrl:
//                 'https://via.placeholder.com/400x250/34495e/ffffff?text=TaskMaster',
//             technologies: [
//               'Flutter',
//               'Bloc',
//               'SQLite',
//               'Charts',
//               'Drag & Drop'
//             ],
//             githubUrl:
//                 'https://github.com/vaibhavshukla/task-master',
//             duration: '2 months',
//             category: 'Productivity',
//           ),
//         ],
//       ),
//       SkillCategory(
//         id: 'react',
//         name: 'React',
//         description:
//             'Modern Web Applications & SPAs',
//         icon: Icons.web,
//         color: const Color(0xFF61DAFB),
//         projects: [
//           Project(
//             id: 'react_1',
//             title: 'EcoMarketplace',
//             description:
//                 'Sustainable products marketplace with seller dashboard, eco-impact tracking, and community features.',
//             imageUrl:
//                 'https://via.placeholder.com/400x250/27ae60/ffffff?text=EcoMarket',
//             technologies: [
//               'React',
//               'Redux Toolkit',
//               'Material-UI',
//               'Node.js',
//               'Stripe'
//             ],
//             githubUrl:
//                 'https://github.com/vaibhavshukla/eco-marketplace',
//             liveUrl:
//                 'https://ecomarket.vaibhavshukla.dev',
//             duration: '3 months',
//             category: 'E-commerce',
//           ),
//           Project(
//             id: 'react_2',
//             title: 'DataViz Dashboard',
//             description:
//                 'Interactive data visualization platform with real-time charts, custom reports, and data export features.',
//             imageUrl:
//                 'https://via.placeholder.com/400x250/8e44ad/ffffff?text=DataViz',
//             technologies: [
//               'React',
//               'D3.js',
//               'Chart.js',
//               'TypeScript',
//               'WebSockets'
//             ],
//             githubUrl:
//                 'https://github.com/vaibhavshukla/dataviz-dashboard',
//             liveUrl:
//                 'https://dataviz.vaibhavshukla.dev',
//             duration: '2 months',
//             category: 'Analytics',
//           ),
//         ],
//       ),
//       SkillCategory(
//         id: 'nodejs',
//         name: 'Node.js',
//         description:
//             'Backend APIs & Server Applications',
//         icon: Icons.dns,
//         color: const Color(0xFF68A063),
//         projects: [
//           Project(
//             id: 'node_1',
//             title: 'MicroServices API Gateway',
//             description:
//                 'Scalable API gateway with load balancing, authentication, rate limiting, and service discovery.',
//             imageUrl:
//                 'https://via.placeholder.com/400x250/2c3e50/ffffff?text=API+Gateway',
//             technologies: [
//               'Node.js',
//               'Express',
//               'Redis',
//               'Docker',
//               'Kubernetes',
//               'JWT'
//             ],
//             githubUrl:
//                 'https://github.com/vaibhavshukla/api-gateway',
//             duration: '2 months',
//             category: 'Backend',
//           ),
//           Project(
//             id: 'node_2',
//             title: 'Real-time Chat Server',
//             description:
//                 'WebSocket-based chat server with rooms, message encryption, file sharing, and moderation tools.',
//             imageUrl:
//                 'https://via.placeholder.com/400x250/16a085/ffffff?text=Chat+Server',
//             technologies: [
//               'Node.js',
//               'Socket.io',
//               'MongoDB',
//               'Redis',
//               'Cloudinary'
//             ],
//             githubUrl:
//                 'https://github.com/vaibhavshukla/chat-server',
//             duration: '6 weeks',
//             category: 'Real-time',
//           ),
//         ],
//       ),
//     ];
//   }
// }

// ViewModel
class PortfolioViewModel extends ChangeNotifier {
  String _selectedCategory = 'featured';
  bool _isLoading = false;
  List<SkillCategory> _categories = [];

  String get selectedCategory =>
      _selectedCategory;
  bool get isLoading => _isLoading;
  List<SkillCategory> get categories =>
      _categories;

  Future<void> loadCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categories = await PortfolioService
          .fetchSkillCategories();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setSelectedCategory(String categoryId) {
    _selectedCategory = categoryId;
    notifyListeners();
  }

  List<Project> getProjectsByCategory(
      String categoryId) {
    final category = _categories.firstWhere(
      (cat) => cat.id == categoryId,
      orElse: () => _categories.first,
    );
    return category.projects;
  }

  SkillCategory getCurrentCategory() {
    return _categories.firstWhere(
      (cat) => cat.id == _selectedCategory,
      orElse: () => _categories.first,
    );
  }
}

// Animated Project Card Widget
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

// Project Detail Dialog
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
                    const Text(
                      'About This Project',
                      style: TextStyle(
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
                    const Text(
                      'Technologies Used',
                      style: TextStyle(
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

// Main App

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({Key? key})
      : super(key: key);

  @override
  State<PortfolioHomePage> createState() =>
      _PortfolioHomePageState();
}

class _PortfolioHomePageState
    extends State<PortfolioHomePage> {
  final ScrollController _scrollController =
      ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController
        .addListener(_scrollListener);

    // Load categories when widget is initialized
    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      context
          .read<PortfolioViewModel>()
          .loadCategories();
    });
  }

  void _scrollListener() {
    if (_scrollController.offset > 50 &&
        !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (_scrollController.offset <= 50 &&
        _isScrolled) {
      setState(() => _isScrolled = false);
    }
  }

  @override
  void dispose() {
    _scrollController
        .removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Netflix-style App Bar
          SliverAppBar(
            expandedHeight: 0,
            floating: true,
            pinned: true,
            backgroundColor: _isScrolled
                ? Colors.black.withOpacity(0.95)
                : Colors.transparent,
            title: Row(
              children: [
                Icon(Icons.broken_image_outlined),
                // const Text(
                //   'VAIBHAV',
                //   style: TextStyle(
                //     color: Colors.red,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 24,
                //     letterSpacing: 2,
                //   ),
                // ),
                const SizedBox(width: 30),
                if (MediaQuery.of(context)
                        .size
                        .width >
                    800) ...[
                  _buildNavItem('Home', true),
                  _buildNavItem(
                      'Projects', false),
                  _buildNavItem('Skills', false),
                  _buildNavItem('About', false),
                  _buildNavItem('Contact', false),
                ],
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search,
                    color: Colors.white),
                onPressed: () =>
                    _showSearchDialog(),
              ),
              IconButton(
                icon: const Icon(Icons.download,
                    color: Colors.white),
                onPressed: () =>
                    _downloadResume(),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 16),
                child: const CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.red,
                  child: Text(
                    'VS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Hero Section
          SliverToBoxAdapter(
            child: _buildHeroSection(),
          ),

          // Category Navigation
          SliverToBoxAdapter(
            child: _buildCategoryNavigation(),
          ),

          // Projects Grid
          SliverToBoxAdapter(
            child: _buildProjectsSection(),
          ),

          // Contact Section
          SliverToBoxAdapter(
            child: _buildContactSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      String title, bool isActive) {
    return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: InkWell(
            onTap: () {
              print("pressed");
            },
            child: Text(
              title,
              style: TextStyle(
                color: isActive
                    ? Colors.white
                    : Colors.white70,
                fontWeight: isActive
                    ? FontWeight.w600
                    : FontWeight.normal,
              ),
            ))

        // child: Text(
        //   title,

        // ),
        );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 700,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.7),
            Colors.black,
          ],
        ),
        image: const DecorationImage(
          image: NetworkImage(
              'https://via.placeholder.com/1920x700/0f0f23/FFFFFF?text=< Code Background />'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              MediaQuery.of(context).size.width >
                      800
                  ? 60
                  : 20,
          vertical: 100,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            // Animated greeting
            TweenAnimationBuilder(
              duration: const Duration(
                  milliseconds: 1000),
              tween:
                  Tween<double>(begin: 0, end: 1),
              builder:
                  (context, double value, child) {
                return Transform.translate(
                  offset:
                      Offset(0, 50 * (1 - value)),
                  child: Opacity(
                    opacity: value,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        const Text(
                          'Hi, I\'m',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white70,
                            fontWeight:
                                FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                            height: 10),
                        Text(
                          'Vaibhav Shukla',
                          style: TextStyle(
                            fontSize: MediaQuery.of(
                                            context)
                                        .size
                                        .width >
                                    800
                                ? 72
                                : 48,
                            fontWeight:
                                FontWeight.bold,
                            color: Colors.white,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(
                            height: 10),
                        const Text(
                          'Full Stack Developer',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.red,
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            // Animated description
            TweenAnimationBuilder(
              duration: const Duration(
                  milliseconds: 1500),
              tween:
                  Tween<double>(begin: 0, end: 1),
              builder:
                  (context, double value, child) {
                return Transform.translate(
                  offset:
                      Offset(0, 30 * (1 - value)),
                  child: Opacity(
                    opacity: value,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth:
                            MediaQuery.of(context)
                                        .size
                                        .width >
                                    800
                                ? 700
                                : double.infinity,
                      ),
                      child: Text(
                        'I craft exceptional digital experiences through code. Specializing in Flutter, React, and Node.js, I transform ideas into powerful applications that make a difference. Welcome to my digital showcase.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                              .withOpacity(0.9),
                          height: 1.6,
                          fontWeight:
                              FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 40),

            // Skills badges
            TweenAnimationBuilder(
              duration: const Duration(
                  milliseconds: 2000),
              tween:
                  Tween<double>(begin: 0, end: 1),
              builder:
                  (context, double value, child) {
                return Transform.translate(
                  offset:
                      Offset(0, 20 * (1 - value)),
                  child: Opacity(
                    opacity: value,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        'Flutter',
                        'React',
                        'Node.js',
                        'Python',
                        'Firebase'
                      ]
                          .map(
                              (skill) =>
                                  Container(
                                    padding: const EdgeInsets
                                        .symmetric(
                                        horizontal:
                                            16,
                                        vertical:
                                            8),
                                    decoration:
                                        BoxDecoration(
                                      border: Border.all(
                                          color: Colors
                                              .white30),
                                      borderRadius:
                                          BorderRadius.circular(
                                              20),
                                      color: Colors
                                          .black
                                          .withOpacity(
                                              0.3),
                                    ),
                                    child: Text(
                                      skill,
                                      style:
                                          const TextStyle(
                                        color: Colors
                                            .white,
                                        fontSize:
                                            14,
                                        fontWeight:
                                            FontWeight
                                                .w500,
                                      ),
                                    ),
                                  ))
                          .toList(),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 50),

            // Call to action buttons
            TweenAnimationBuilder(
              duration: const Duration(
                  milliseconds: 2500),
              tween:
                  Tween<double>(begin: 0, end: 1),
              builder:
                  (context, double value, child) {
                return Transform.translate(
                  offset:
                      Offset(0, 20 * (1 - value)),
                  child: Opacity(
                    opacity: value,
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 15,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () =>
                              _scrollToSection(
                                  'projects'),
                          icon: const Icon(
                              Icons.play_arrow),
                          label: const Text(
                              'View My Work'),
                          style: ElevatedButton
                              .styleFrom(
                            backgroundColor:
                                Colors.red,
                            foregroundColor:
                                Colors.white,
                            padding:
                                const EdgeInsets
                                    .symmetric(
                                    horizontal:
                                        32,
                                    vertical: 16),
                            textStyle:
                                const TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                        FontWeight
                                            .w600),
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          8),
                            ),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () =>
                              _scrollToSection(
                                  'contact'),
                          icon: const Icon(Icons
                              .email_outlined),
                          label: const Text(
                              'Get In Touch'),
                          style: OutlinedButton
                              .styleFrom(
                            foregroundColor:
                                Colors.white,
                            side:
                                const BorderSide(
                                    color: Colors
                                        .white70,
                                    width: 2),
                            padding:
                                const EdgeInsets
                                    .symmetric(
                                    horizontal:
                                        32,
                                    vertical: 16),
                            textStyle:
                                const TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                        FontWeight
                                            .w600),
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  // Widget _buildHeroSection() {
  //   bool showSecond = false;
  //   bool showThird = false;
  //   bool showDescription = false;
  //   bool showButtons = false;

  //   return StatefulBuilder(
  //     builder: (context, setState) {
  //       return Container(
  //         height: 700,
  //         decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             begin: Alignment.topCenter,
  //             end: Alignment.bottomCenter,
  //             colors: [
  //               Colors.transparent,
  //               Colors.black.withOpacity(0.3),
  //               Colors.black.withOpacity(0.7),
  //               Colors.black,
  //             ],
  //           ),
  //           image: const DecorationImage(
  //             image: NetworkImage(
  //               'https://via.placeholder.com/1920x700/0f0f23/FFFFFF?text=< Code Background />',
  //             ),
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(
  //             horizontal: MediaQuery.of(context)
  //                         .size
  //                         .width >
  //                     800
  //                 ? 60
  //                 : 20,
  //             vertical: 100,
  //           ),
  //           child: Column(
  //             crossAxisAlignment:
  //                 CrossAxisAlignment.start,
  //             mainAxisAlignment:
  //                 MainAxisAlignment.center,
  //             children: [
  //               // First line
  //               AnimatedTextKit(
  //                 isRepeatingAnimation: false,
  //                 displayFullTextOnTap: true,
  //                 stopPauseOnTap: true,
  //                 animatedTexts: [
  //                   TypewriterAnimatedText(
  //                     'Hi, I\'m',
  //                     textStyle: const TextStyle(
  //                       fontSize: 24,
  //                       color: Colors.white70,
  //                       fontWeight:
  //                           FontWeight.w400,
  //                     ),
  //                     speed: const Duration(
  //                         milliseconds: 70),
  //                   ),
  //                 ],
  //                 onFinished: () => setState(
  //                     () => showSecond = true),
  //               ),

  //               if (showSecond)
  //                 AnimatedTextKit(
  //                   isRepeatingAnimation: false,
  //                   displayFullTextOnTap: true,
  //                   stopPauseOnTap: true,
  //                   animatedTexts: [
  //                     TypewriterAnimatedText(
  //                       'Vaibhav Shukla',
  //                       textStyle: TextStyle(
  //                         fontSize: MediaQuery.of(
  //                                         context)
  //                                     .size
  //                                     .width >
  //                                 800
  //                             ? 72
  //                             : 48,
  //                         fontWeight:
  //                             FontWeight.bold,
  //                         color: Colors.white,
  //                         height: 1.1,
  //                       ),
  //                       speed: const Duration(
  //                           milliseconds: 70),
  //                     ),
  //                   ],
  //                   onFinished: () => setState(
  //                       () => showThird = true),
  //                 ),

  //               if (showThird)
  //                 AnimatedTextKit(
  //                   isRepeatingAnimation: false,
  //                   displayFullTextOnTap: true,
  //                   stopPauseOnTap: true,
  //                   animatedTexts: [
  //                     TypewriterAnimatedText(
  //                       'Full Stack Developer',
  //                       textStyle:
  //                           const TextStyle(
  //                         fontSize: 32,
  //                         color: Colors.red,
  //                         fontWeight:
  //                             FontWeight.w600,
  //                       ),
  //                       speed: const Duration(
  //                           milliseconds: 70),
  //                     ),
  //                   ],
  //                   onFinished: () => setState(
  //                       () => showDescription =
  //                           true),
  //                 ),

  //               const SizedBox(height: 30),

  //               // Animated description (typed out)
  //               if (showDescription)
  //                 AnimatedTextKit(
  //                   isRepeatingAnimation: false,
  //                   displayFullTextOnTap: true,
  //                   stopPauseOnTap: true,
  //                   animatedTexts: [
  //                     TypewriterAnimatedText(
  //                       'I craft exceptional digital experiences through code.\nSpecializing in Flutter, React, and Node.js,\nI transform ideas into powerful applications that make a difference.\nWelcome to my digital showcase.',
  //                       textStyle: TextStyle(
  //                         fontSize: 20,
  //                         color: Colors.white
  //                             .withOpacity(0.9),
  //                         height: 1.6,
  //                         fontWeight:
  //                             FontWeight.w300,
  //                       ),
  //                       speed: const Duration(
  //                           milliseconds: 40),
  //                     ),
  //                   ],
  //                   onFinished: () => setState(
  //                       () => showButtons = true),
  //                 ),

  //               const SizedBox(height: 40),

  //               // Skills badges (stay as they are)
  //               Wrap(
  //                 spacing: 10,
  //                 runSpacing: 10,
  //                 children: [
  //                   'Flutter',
  //                   'React',
  //                   'Node.js',
  //                   'Python',
  //                   'Firebase'
  //                 ]
  //                     .map(
  //                       (skill) => Container(
  //                         padding:
  //                             const EdgeInsets
  //                                 .symmetric(
  //                                 horizontal: 16,
  //                                 vertical: 8),
  //                         decoration:
  //                             BoxDecoration(
  //                           border: Border.all(
  //                               color: Colors
  //                                   .white30),
  //                           borderRadius:
  //                               BorderRadius
  //                                   .circular(20),
  //                           color: Colors.black
  //                               .withOpacity(0.3),
  //                         ),
  //                         child: Text(
  //                           skill,
  //                           style:
  //                               const TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 14,
  //                             fontWeight:
  //                                 FontWeight.w500,
  //                           ),
  //                         ),
  //                       ),
  //                     )
  //                     .toList(),
  //               ),

  //               const SizedBox(height: 50),

  //               // Call to action buttons (only after description is done)
  //               if (showButtons)
  //                 TweenAnimationBuilder(
  //                   duration: const Duration(
  //                       milliseconds: 800),
  //                   tween: Tween<double>(
  //                       begin: 0, end: 1),
  //                   builder: (context,
  //                       double value, child) {
  //                     return Transform.translate(
  //                       offset: Offset(
  //                           0, 20 * (1 - value)),
  //                       child: Opacity(
  //                         opacity: value,
  //                         child: Wrap(
  //                           spacing: 20,
  //                           runSpacing: 15,
  //                           children: [
  //                             ElevatedButton.icon(
  //                               onPressed: () =>
  //                                   _scrollToSection(
  //                                       'projects'),
  //                               icon: const Icon(
  //                                   Icons
  //                                       .play_arrow),
  //                               label: const Text(
  //                                   'View My Work'),
  //                               style:
  //                                   ElevatedButton
  //                                       .styleFrom(
  //                                 backgroundColor:
  //                                     Colors.red,
  //                                 foregroundColor:
  //                                     Colors
  //                                         .white,
  //                                 padding: const EdgeInsets
  //                                     .symmetric(
  //                                     horizontal:
  //                                         32,
  //                                     vertical:
  //                                         16),
  //                                 textStyle: const TextStyle(
  //                                     fontSize:
  //                                         16,
  //                                     fontWeight:
  //                                         FontWeight
  //                                             .w600),
  //                                 shape:
  //                                     RoundedRectangleBorder(
  //                                   borderRadius:
  //                                       BorderRadius
  //                                           .circular(
  //                                               8),
  //                                 ),
  //                               ),
  //                             ),
  //                             OutlinedButton.icon(
  //                               onPressed: () =>
  //                                   _scrollToSection(
  //                                       'contact'),
  //                               icon: const Icon(Icons
  //                                   .email_outlined),
  //                               label: const Text(
  //                                   'Get In Touch'),
  //                               style:
  //                                   OutlinedButton
  //                                       .styleFrom(
  //                                 foregroundColor:
  //                                     Colors
  //                                         .white,
  //                                 side: const BorderSide(
  //                                     color: Colors
  //                                         .white70,
  //                                     width: 2),
  //                                 padding: const EdgeInsets
  //                                     .symmetric(
  //                                     horizontal:
  //                                         32,
  //                                     vertical:
  //                                         16),
  //                                 textStyle: const TextStyle(
  //                                     fontSize:
  //                                         16,
  //                                     fontWeight:
  //                                         FontWeight
  //                                             .w600),
  //                                 shape:
  //                                     RoundedRectangleBorder(
  //                                   borderRadius:
  //                                       BorderRadius
  //                                           .circular(
  //                                               8),
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget _buildCategoryNavigation() {
    return Consumer<PortfolioViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading ||
            viewModel.categories.isEmpty) {
          return const SizedBox(height: 60);
        }

        return Container(
          height: 80,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context)
                        .size
                        .width >
                    800
                ? 60
                : 20,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                viewModel.categories.length,
            itemBuilder: (context, index) {
              final category =
                  viewModel.categories[index];
              final isSelected =
                  viewModel.selectedCategory ==
                      category.id;

              return GestureDetector(
                onTap: () =>
                    viewModel.setSelectedCategory(
                        category.id),
                child: AnimatedContainer(
                  duration: const Duration(
                      milliseconds: 300),
                  margin: const EdgeInsets.only(
                      right: 25),
                  padding:
                      const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? category.color
                        : Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(25),
                    border: Border.all(
                      color: isSelected
                          ? category.color
                          : Colors.white30,
                      width: 2,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: category
                                  .color
                                  .withOpacity(
                                      0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    mainAxisSize:
                        MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.category,
                        color: isSelected
                            ? Colors.white
                            : Colors.white70,
                        size: 22,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        category.name,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.white70,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      if (isSelected) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding:
                              const EdgeInsets
                                  .symmetric(
                                  horizontal: 8,
                                  vertical: 2),
                          decoration:
                              BoxDecoration(
                            color: Colors.white
                                .withOpacity(0.2),
                            borderRadius:
                                BorderRadius
                                    .circular(10),
                          ),
                          child: Text(
                            category
                                .projects.length
                                .toString(),
                            style:
                                const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildProjectsSection() {
    return Consumer<PortfolioViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Padding(
            padding: EdgeInsets.all(60),
            child: Center(
              child: CircularProgressIndicator(
                  color: Colors.red),
            ),
          );
        }

        if (viewModel.categories.isEmpty) {
          return const SizedBox.shrink();
        }

        final projects =
            viewModel.getProjectsByCategory(
                viewModel.selectedCategory);
        final currentCategory =
            viewModel.getCurrentCategory();

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context)
                        .size
                        .width >
                    800
                ? 60
                : 20,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              // Section Header
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 40,
                    color: currentCategory.color,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Text(
                          currentCategory.name,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight:
                                FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          currentCategory
                              .description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${projects.length} Project${projects.length != 1 ? 's' : ''}',
                    style: TextStyle(
                      color:
                          currentCategory.color,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Projects Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 1;
                  if (constraints.maxWidth >
                      1200) {
                    crossAxisCount = 3;
                  } else if (constraints
                          .maxWidth >
                      800) {
                    crossAxisCount = 2;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          crossAxisCount,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25,
                    ),
                    itemCount: projects.length,
                    itemBuilder:
                        (context, index) {
                      return AnimatedProjectCard(
                          project:
                              projects[index]);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal:
            MediaQuery.of(context).size.width >
                    800
                ? 60
                : 20,
        vertical: 80,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Colors.grey[900]!,
            Colors.black,
          ],
        ),
      ),
      child: Column(
        children: [
          // Header
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.red
                          .withOpacity(0.3)),
                  borderRadius:
                      BorderRadius.circular(20),
                  color:
                      Colors.red.withOpacity(0.1),
                ),
                child: const Text(
                  'Let\'s Connect',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Ready to bring your ideas to life?',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                constraints: const BoxConstraints(
                    maxWidth: 600),
                child: const Text(
                  'I\'m always excited to work on new projects and collaborate with amazing people. Let\'s create something extraordinary together.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          // Contact Methods
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildContactCard(
                'Email',
                'vaibhav.shukla.dev@gmail.com',
                Icons.email,
                Colors.red,
                'mailto:vaibhav.shukla.dev@gmail.com',
              ),
              _buildContactCard(
                'LinkedIn',
                'Connect with me',
                Icons.business_center,
                const Color(0xFF0077B5),
                'https://linkedin.com/in/vaibhav-shukla',
              ),
              _buildContactCard(
                'GitHub',
                'Check out my code',
                Icons.code,
                const Color(0xFF333333),
                'https://github.com/vaibhavshukla',
              ),
              _buildContactCard(
                'Resume',
                'Download my CV',
                Icons.description,
                const Color(0xFF4CAF50),
                '/resume',
              ),
            ],
          ),

          const SizedBox(height: 60),

          // Footer
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white10,
          ),
          const SizedBox(height: 30),

          const Text(
            '© 2024 Vaibhav Shukla. Built with Flutter 💙',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(
      String title,
      String subtitle,
      IconData icon,
      Color color,
      String action) {
    return GestureDetector(
      onTap: () => _handleContactAction(action),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: 280,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius:
                BorderRadius.circular(16),
            border: Border.all(
                color: Colors.white
                    .withOpacity(0.1)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color:
                          color.withOpacity(0.3)),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Methods
  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.black87,
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                children: [
                  const Text(
                    'Search Projects',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
              const SizedBox(height: 20),
              TextField(
                style: const TextStyle(
                    color: Colors.white),
                decoration: InputDecoration(
                  hintText:
                      'Search by technology, project name...',
                  hintStyle: const TextStyle(
                      color: Colors.white60),
                  prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white70),
                  filled: true,
                  fillColor: Colors.white
                      .withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Popular searches: Flutter, React, Node.js, Python',
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _downloadResume() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Resume download started!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _scrollToSection(String section) {
    double scrollPosition = 0;
    switch (section) {
      case 'projects':
        scrollPosition = 700;
        break;
      case 'contact':
        scrollPosition = _scrollController
            .position.maxScrollExtent;
        break;
    }

    _scrollController.animateTo(
      scrollPosition,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void _handleContactAction(String action) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening: $action'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
