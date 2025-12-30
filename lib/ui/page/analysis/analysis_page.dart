import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnalysisPageChild();
  }
}
class AnalysisPageChild extends StatefulWidget {
  const AnalysisPageChild({super.key});

  @override
  State<AnalysisPageChild> createState() => _AnalysisPageChildState();
}

class _AnalysisPageChildState extends State<AnalysisPageChild> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

