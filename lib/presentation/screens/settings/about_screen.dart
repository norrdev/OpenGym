import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:npng/generated/l10n.dart';

class AboutScreen extends StatelessWidget {
  final String? about;
  final String? history;
  final String? version;

  AboutScreen({super.key, this.about, this.history, this.version});

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    MarkdownStyleSheet style = MarkdownStyleSheet.fromTheme(Theme.of(context));

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).about),
      ),
      body: SafeArea(
        child: Markdown(
          data: '${about!}\n${history!}',
          controller: controller,
          selectable: false,
          styleSheet: style,
          onTapLink: (text, href, title) =>
              launch(href!), // launchUrl(Uri.parse(href!)),
        ),
      ),
    );
  }
}

// Container(
//   height: 260.0,
//   // constraints: BoxConstraints(maxWidth: 800.0),
//   child: FutureBuilder(
//       future: rootBundle.loadString("text/$myLocale/about.md"),
//       builder:
//           (BuildContext context, AsyncSnapshot<String> snapshot) {
//         if (snapshot.hasData) {
//           return Markdown(
//             data: snapshot.data,
//             controller: controller,
//             selectable: false,
//             styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
//             onTapLink: (href) => launch(href),
//           );
//         }
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       }),
// ),
