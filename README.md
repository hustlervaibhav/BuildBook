# BuildBook
A stunning Netflix-inspired portfolio website showcasing my projects and skills. Built with Flutter Web using MVVM architecture, featuring smooth animations, responsive design, and interactive project cards. Perfect blend of modern UI/UX and clean code architecture.
My Netflix-Inspired Portfolio Website: A Showcase of My Projects and Skills
This isn't just a portfolio; it's a little corner of the internet I built to show off what I can do, all wrapped up in a design that'll feel super familiar if you've ever spent an entire weekend binging a show. 

Why Netflix?
I've always loved the clean, intuitive design of Netflix, so I thought, "Why not build my portfolio around that?" This project was a blast to create and helped me focus on some key areas:

A killer UI/UX: The whole thing uses a dark theme with those iconic red accents. I put a lot of work into the details, from the smooth entrance animations on the hero section to the hover effects on the project cards.

Built for everyone: It's totally responsive. Whether you're on a phone, a tablet, or a big ol' desktop monitor, the site looks and works great. I tested it on all the major browsers, too!

Under the hood: I built this using the MVVM architecture for a really clean separation of concerns. I also relied on the Provider pattern for state management, which kept things organized and efficient. It's also lazy-loaded and optimized for a silky-smooth 60fps experience.

Interactive Goodness
This portfolio isn't just a static page; it’s meant to be a fun, interactive experience.

Filter away! You can easily filter projects by technology—want to see only my Flutter projects? Easy.

Project details: Click on any project card to pop up a detailed modal with more info.

Let's connect! You'll find quick links to my email, LinkedIn, GitHub, and a one-click button to download my resume.

My Tech Stack
Here's a quick look at the tools and frameworks that brought this to life.

Category	Technologies
Framework	Flutter 3.0+, Dart 3.0+
Architecture	MVVM (Model-View-ViewModel)
State Management	Provider Pattern
UI/Animation	Custom Flutter Animations, Tween Animations
Responsive Design	LayoutBuilder, MediaQuery
Web Deployment	Flutter Web, GitHub Pages Compatible

Export to Sheets
Wanna give it a try?
If you want to clone this project and play around with it, here's how to get started.

First, the basics:

You'll need the Flutter SDK (version 3.0 or higher) and the Dart SDK (3.0 or higher).

Chrome or Edge for web development.

Installation (it's a breeze!):

Clone the repo: git clone https://github.com/hustlervaibhav/BuildBook.git then cd netflix-portfolio

Grab the dependencies: flutter pub get

Enable Flutter Web (if you haven't already): flutter config --enable-web

Run it! flutter run -d chrome

For production: flutter build web --release

You'll find the app running at http://localhost:58080 (or a similar address).

Project Layout
I designed this to be clean and easy to navigate. Everything's housed in a multiple divided and structured folders, but don't let that fool you—it still follows a solid, clean architecture. It's a great example of how to keep a project tidy even when it's all in one place.

lib/
├── main.dart # Everything is here, beautifully organized
│   ├── Models # Your data structures live here
│   ├── Services # The logic for fetching data
│   ├── ViewModels # The brain behind the views
│   ├── Widgets # All the individual UI pieces
│   └── Views # The main screens
├── pubspec.yaml # All your dependencies
└── README.md # The documentation you're reading now!

What's in there?
The Hero Section: Your first impression! It's an animated intro with my name, title, and little skill badges. Plus, some buttons that smoothly scroll you down the page.

Skills Navigation: This is where you can filter projects by category like "Flutter," "React," and more. The animated indicators make it easy to see what you've selected.

Project Showcase: A neat grid layout with all my projects, complete with hover effects, tech badges, and links to GitHub and live demos.

Contact Section: All my contact info is right here, ready for you to reach out.

Customize it for yourself!
This project is open-source and meant to be a template for your own portfolio. It's super easy to make it your own.

Adding your projects:

Just pop your project details into the PortfolioService.fetchSkillCategories() method. Replace my images and links with yours. It's just a simple list of objects, like this:

Dart

Project(
  id: 'your_project_id',
  title: 'Your Awesome Project!',
  description: 'A little description of the cool stuff you built.',
  imageUrl: 'https://your-screenshot-url.com/image.png',
  technologies: ['Flutter', 'Firebase'],
  githubUrl: 'https://github.com/your-username/project',
  liveUrl: 'https://your-live-demo.com',
  duration: '3 months',
  category: 'Mobile App',
),
Personalizing the text:

Just search for "Vaibhav Shukla" and replace it with your name. Do the same for your title, contact info, and skills.

Theming:

I used Colors.red to match the Netflix vibe, but you can change that main color and the accent colors to whatever you want.

Deployment
Ready to show it to the world? It's a piece of cake.

GitHub Pages:

Build it: flutter build web --release

The files will be in the build/web/ folder. Just upload those to your gh-pages branch.

Netlify:

Build it: flutter build web --release

Drag and drop the build/web folder directly onto the Netlify dashboard. Done!

Firebase Hosting:

Bash

# First, get the CLI
npm install -g firebase-tools

# Login and initialize
firebase login
firebase init hosting

# Deploy!
firebase deploy
Got an idea? Let's collaborate!
This is an open project, and I'd love your help making it even better. Feel free to open a pull request!

Some ideas I have for the future:

More animations!

Making the mobile experience even smoother.

Adding a search function.

Internationalization (i18n).

Making it even more accessible.

License
This project is licensed under the MIT License. Feel free to use it as inspiration or as a starting point for your own portfolio. All I ask is that you give a little credit where it's due! 🙏

A big thanks to:
Netflix: For the amazing design inspiration!

Flutter Team: For building such a fantastic framework.

Google Fonts, Unsplash, Icons8: For the typography, images, and icons that made it all look so good.

Let's connect!
Vaibhav Shukla
Full Stack Developer | Flutter Enthusiast | Problem Solver
www.linkedin.com/in/vaibhav-shukla-09897a213
