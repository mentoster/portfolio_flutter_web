import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/global_widgets/appbar.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue,
      body: Text("hello world"),
    );
  }
}
