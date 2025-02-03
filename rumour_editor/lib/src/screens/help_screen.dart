import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

/// A help screen to show a help page from [assetKey].
class HelpScreen extends StatelessWidget {
  /// Create an instance.
  const HelpScreen({required this.assetKey, super.key});

  /// The asset key to load the help file from.
  final String assetKey;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) {
    final bundle = DefaultAssetBundle.of(context);
    final future = bundle.loadString(assetKey);
    return Cancel(
      child: SimpleFutureBuilder(
        future: future,
        done:
            (final innerContext, final source) => SimpleScaffold(
              title: 'Help',
              body: Focus(
                autofocus: true,
                debugLabel: assetKey,
                child: Markdown(
                  data: source,
                  onTapLink: (final text, final href, final title) {
                    if (href == null) {
                      return;
                    }
                    final uri = Uri.tryParse(href);
                    if (uri == null) {
                      context.showMessage(message: 'Invalid URL: $href.');
                    } else {
                      launchUrl(uri);
                    }
                  },
                  selectable: true,
                ),
              ),
            ),
        loading: LoadingScreen.new,
        error: ErrorScreen.withPositional,
      ),
    );
  }
}
