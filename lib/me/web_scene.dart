import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:share/share.dart';

class WebScene extends StatefulWidget {
  final String url;
  final String? title;

  WebScene({required this.url, this.title});

  @override
  _WebSceneState createState() => _WebSceneState();
}

class _WebSceneState extends State<WebScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        title:
            Text(widget.title ?? '', style: TextStyle(color: Colors.black87)),
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Share.share(this.widget.url);
            },
            child: Image.asset('img/icon_menu_share.png'),
          )
        ],
      ),
      body: WebviewScaffold(
        // javascriptMode: JavaScriptMode.unrestricted,
        url: widget.url,
      ),
    );
  }
}
