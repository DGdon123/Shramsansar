import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlView extends StatelessWidget {
  final String text;

  const HtmlView(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: text,
      style: {
        "table": Style(
          backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        "tr": Style(
          border: const Border(bottom: BorderSide(color: Colors.grey)),
        ),
        "th": Style(
          padding: const EdgeInsets.all(6),
          backgroundColor: Colors.grey,
        ),
        "td": Style(
          padding: const EdgeInsets.all(6),
          alignment: Alignment.topLeft,
        ),
        'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
      },
      customRender: {
        "table": (context, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Table(
              children:
                  _parseTableNodes(context as BuildContext, child as List),
            ),
          );
        },
        "bird": (RenderContext context, Widget child) {
          return const Text("🐦");
        },
        "flutter": (RenderContext context, Widget child) {
          return FlutterLogo(
            style: (context.tree.element!.attributes['horizontal'] != null)
                ? FlutterLogoStyle.horizontal
                : FlutterLogoStyle.markOnly,
            textColor: context.style.color!,
            size: context.style.fontSize!.size! * 5,
          );
        },
      },
      onLinkTap: (url, _, __, ___) {
        print("Opening $url...");
      },
      onImageTap: (src, _, __, ___) {
        print(src);
      },
      onImageError: (exception, stackTrace) {
        print(exception);
      },
      onCssParseError: (css, messages) {
        print("css that errored: $css");
        print("error messages:");
        for (var element in messages) {
          print(element);
        }
        return null;
      },
    );
  }

  List<TableRow> _parseTableNodes(BuildContext context, List<dynamic> nodes) {
    List<TableRow> tableRows = [];
    for (var node in nodes) {
      if (node is List<dynamic> &&
          node.isNotEmpty &&
          node[0] is String &&
          node[0] == "tr") {
        List<Widget> tableCells = [];
        for (var child in node.sublist(1)) {
          if (child is List<dynamic> &&
              child.isNotEmpty &&
              child[0] is String &&
              child[0] == "td") {
            tableCells.add(TableCell(child: Html(data: child[3])));
          }
        }
        tableRows.add(TableRow(children: tableCells));
      }
    }
    return tableRows;
  }
}
