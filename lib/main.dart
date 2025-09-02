import 'package:flutter/material.dart';
import 'package:netflix_portfolio/views/portfolioViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => PortfolioViewModel()),
      ],
      child: MaterialApp(
        title: 'Vaibhav Shukla - Portfolio',
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: const PortfolioHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
