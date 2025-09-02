import 'package:flutter/material.dart';
import 'package:netflix_portfolio/models/portfolio_models.dart';

class PortfolioService {
  static Future<List<SkillCategory>>
      fetchSkillCategories() async {
    // Simulate API call delay
    await Future.delayed(
        const Duration(milliseconds: 500));

    return [
      SkillCategory(
        id: 'featured',
        name: 'Featured Projects',
        description:
            'My best work and achievements',
        icon: Icon(Icons.star),
        color: Colors.red,
        projects: _getFeaturedProjects(),
      ),
      SkillCategory(
        id: 'flutter',
        name: 'Flutter',
        description:
            'Cross-platform Mobile & Web Applications',
        icon: Icon(Icons.phone_android),
        color: const Color(0xFF02569B),
        projects: _getFlutterProjects(),
      ),
      SkillCategory(
        id: 'react',
        name: 'React',
        description:
            'Modern Web Applications & SPAs',
        icon: Icon(Icons.web),
        color: const Color(0xFF61DAFB),
        projects: _getReactProjects(),
      ),
      SkillCategory(
        id: 'nodejs',
        name: 'Node.js',
        description:
            'Backend APIs & Server Applications',
        icon: Icon(Icons.dns),
        color: const Color(0xFF68A063),
        projects: _getNodeProjects(),
      ),
      SkillCategory(
        id: 'python',
        name: 'Python',
        description:
            'Data Science & Machine Learning',
        icon: Icon(Icons.analytics),
        color: const Color(0xFF3776AB),
        projects: _getPythonProjects(),
      ),
    ];
  }

  static List<Project> _getFeaturedProjects() {
    return [
      Project(
        id: 'featured_1',
        title:
            'InvoiceFlow - Invoice Trading Platform',
        description:
            'A comprehensive fintech platform for invoice trading with real-time bidding, payment processing, and analytics dashboard. Built with Flutter for mobile and React for web admin panel.',
        imageUrl:
            'https://via.placeholder.com/400x250/e74c3c/ffffff?text=InvoiceFlow',
        technologies: [
          'Flutter',
          'React',
          'Node.js',
          'MongoDB',
          'Stripe',
          'Firebase'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/invoice-flow',
        liveUrl: 'https://invoiceflow.app',
        duration: '6 months',
        isFeatured: true,
        category: 'Fintech',
      ),
      Project(
        id: 'featured_2',
        title:
            'SmartLearn - AI-Powered Learning Platform',
        description:
            'Educational platform with AI-driven personalized learning paths, video streaming, progress tracking, and collaborative features for students and teachers.',
        imageUrl:
            'https://via.placeholder.com/400x250/3498db/ffffff?text=SmartLearn',
        technologies: [
          'React',
          'Node.js',
          'Python',
          'TensorFlow',
          'PostgreSQL',
          'AWS'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/smart-learn',
        liveUrl: 'https://smartlearn.edu',
        duration: '4 months',
        isFeatured: true,
        category: 'EdTech',
      ),
      Project(
        id: 'featured_3',
        title: 'HealthTracker Pro',
        description:
            'Comprehensive health monitoring app with wearable device integration, telemedicine features, and AI-powered health insights.',
        imageUrl:
            'https://via.placeholder.com/400x250/2ecc71/ffffff?text=HealthTracker',
        technologies: [
          'Flutter',
          'Firebase',
          'TensorFlow Lite',
          'HealthKit',
          'Google Fit'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/health-tracker',
        liveUrl:
            'https://play.google.com/store/apps/details?id=com.healthtracker.pro',
        duration: '5 months',
        isFeatured: true,
        category: 'HealthTech',
      ),
    ];
  }

  static List<Project> _getFlutterProjects() {
    return [
      Project(
        id: 'flutter_1',
        title: 'CryptoWallet',
        description:
            'Secure cryptocurrency wallet with multi-currency support, real-time price tracking, and trading features.',
        imageUrl:
            'https://via.placeholder.com/400x250/f39c12/ffffff?text=CryptoWallet',
        technologies: [
          'Flutter',
          'Provider',
          'Secure Storage',
          'REST APIs',
          'Biometric Auth'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/crypto-wallet',
        duration: '2 months',
        category: 'Finance',
      ),
      Project(
        id: 'flutter_2',
        title: 'FoodieExpress',
        description:
            'Food delivery app with real-time tracking, multiple payment options, and restaurant management dashboard.',
        imageUrl:
            'https://via.placeholder.com/400x250/e67e22/ffffff?text=FoodieExpress',
        technologies: [
          'Flutter',
          'Firebase',
          'Google Maps',
          'Payment Gateway',
          'Push Notifications'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/foodie-express',
        liveUrl: 'https://play.google.com/store',
        duration: '3 months',
        category: 'Food & Delivery',
      ),
      Project(
        id: 'flutter_3',
        title: 'MindfulMeditation',
        description:
            'Meditation and mindfulness app with guided sessions, progress tracking, and social features.',
        imageUrl:
            'https://via.placeholder.com/400x250/9b59b6/ffffff?text=MindfulMed',
        technologies: [
          'Flutter',
          'Audio Player',
          'Local Storage',
          'Animations',
          'Notifications'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/mindful-meditation',
        duration: '6 weeks',
        category: 'Wellness',
      ),
      Project(
        id: 'flutter_4',
        title: 'TaskMaster Pro',
        description:
            'Advanced task management with team collaboration, time tracking, and productivity analytics.',
        imageUrl:
            'https://via.placeholder.com/400x250/34495e/ffffff?text=TaskMaster',
        technologies: [
          'Flutter',
          'Bloc',
          'SQLite',
          'Charts',
          'Drag & Drop'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/task-master',
        duration: '2 months',
        category: 'Productivity',
      ),
    ];
  }

  static List<Project> _getReactProjects() {
    return [
      Project(
        id: 'react_1',
        title: 'EcoMarketplace',
        description:
            'Sustainable products marketplace with seller dashboard, eco-impact tracking, and community features.',
        imageUrl:
            'https://via.placeholder.com/400x250/27ae60/ffffff?text=EcoMarket',
        technologies: [
          'React',
          'Redux Toolkit',
          'Material-UI',
          'Node.js',
          'Stripe'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/eco-marketplace',
        liveUrl:
            'https://ecomarket.vaibhavshukla.dev',
        duration: '3 months',
        category: 'E-commerce',
      ),
      Project(
        id: 'react_2',
        title: 'DataViz Dashboard',
        description:
            'Interactive data visualization platform with real-time charts, custom reports, and data export features.',
        imageUrl:
            'https://via.placeholder.com/400x250/8e44ad/ffffff?text=DataViz',
        technologies: [
          'React',
          'D3.js',
          'Chart.js',
          'TypeScript',
          'WebSockets'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/dataviz-dashboard',
        liveUrl:
            'https://dataviz.vaibhavshukla.dev',
        duration: '2 months',
        category: 'Analytics',
      ),
      Project(
        id: 'react_3',
        title: 'EventHub',
        description:
            'Event management platform with ticket booking, virtual event support, and attendee networking.',
        imageUrl:
            'https://via.placeholder.com/400x250/e74c3c/ffffff?text=EventHub',
        technologies: [
          'React',
          'Next.js',
          'Prisma',
          'PostgreSQL',
          'Stripe'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/event-hub',
        liveUrl:
            'https://eventhub.vaibhavshukla.dev',
        duration: '4 months',
        category: 'Events',
      ),
    ];
  }

  static List<Project> _getNodeProjects() {
    return [
      Project(
        id: 'node_1',
        title: 'MicroServices API Gateway',
        description:
            'Scalable API gateway with load balancing, authentication, rate limiting, and service discovery.',
        imageUrl:
            'https://via.placeholder.com/400x250/2c3e50/ffffff?text=API+Gateway',
        technologies: [
          'Node.js',
          'Express',
          'Redis',
          'Docker',
          'Kubernetes',
          'JWT'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/api-gateway',
        duration: '2 months',
        category: 'Backend',
      ),
      Project(
        id: 'node_2',
        title: 'Real-time Chat Server',
        description:
            'WebSocket-based chat server with rooms, message encryption, file sharing, and moderation tools.',
        imageUrl:
            'https://via.placeholder.com/400x250/16a085/ffffff?text=Chat+Server',
        technologies: [
          'Node.js',
          'Socket.io',
          'MongoDB',
          'Redis',
          'Cloudinary'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/chat-server',
        duration: '6 weeks',
        category: 'Real-time',
      ),
      Project(
        id: 'node_3',
        title: 'Payment Processing API',
        description:
            'Secure payment processing service with multiple payment gateways, fraud detection, and analytics.',
        imageUrl:
            'https://via.placeholder.com/400x250/c0392b/ffffff?text=Payment+API',
        technologies: [
          'Node.js',
          'Express',
          'Stripe',
          'PayPal',
          'MongoDB',
          'Bull Queue'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/payment-api',
        duration: '3 months',
        category: 'Fintech',
      ),
    ];
  }

  static List<Project> _getPythonProjects() {
    return [
      Project(
        id: 'python_1',
        title: 'AI Stock Predictor',
        description:
            'Machine learning model for stock price prediction with sentiment analysis and technical indicators.',
        imageUrl:
            'https://via.placeholder.com/400x250/d35400/ffffff?text=Stock+AI',
        technologies: [
          'Python',
          'TensorFlow',
          'Pandas',
          'scikit-learn',
          'FastAPI'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/stock-predictor',
        duration: '2 months',
        category: 'AI/ML',
      ),
      Project(
        id: 'python_2',
        title: 'Smart Home Automation',
        description:
            'IoT-based home automation system with voice control, scheduling, and energy optimization.',
        imageUrl:
            'https://via.placeholder.com/400x250/7f8c8d/ffffff?text=Smart+Home',
        technologies: [
          'Python',
          'Raspberry Pi',
          'MQTT',
          'TensorFlow Lite',
          'Flask'
        ],
        githubUrl:
            'https://github.com/vaibhavshukla/smart-home',
        duration: '4 months',
        category: 'IoT',
      ),
    ];
  }
}
