import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(args['header'] as String),
      ),
      body: Center(
        child: Markdown(
          data: args['text'] as String,
          controller: scrollController,
          selectable: false,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            h1Align: WrapAlignment.center,
          ),
          onTapLink: (text, href, title) =>
              launch(href!), // launchUrl(Uri.parse(href!)),
        ),
      ),
    );
  }
}
