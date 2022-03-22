import 'dart:async';
import 'package:en_vi_dic/en_vi_dic.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translator Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  StreamController<Vocabulary?> _streamController =
      StreamController<Vocabulary?>.broadcast();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
            ),
            ElevatedButton(
              child: Text('Translate'),
              onPressed: () async {
                if (!EnViDic().hasInit) {
                  await EnViDic().init();
                }
                final vocabulary = EnViDic().lookUp(_controller.text);
                _streamController.add(vocabulary);
              },
            ),
            StreamBuilder(
              stream: _streamController.stream,
              builder: (context, data) {
                if (!data.hasError && data.hasData) {
                  final Vocabulary? vocabulary = data.data as Vocabulary;
                  if (vocabulary == null) return Text('');
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('${vocabulary.ipa}\n'),
                      ...vocabulary.details
                          .map((detail) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'POS: ${detail.pos}',
                                    textAlign: TextAlign.center,
                                  ),
                                  ...detail.means
                                      .map((mean) => Text(
                                          'Vietname: ${mean.mean}\n Example: ${mean.example}\n\n',
                                          textAlign: TextAlign.center))
                                      .toList(),
                                  Divider()
                                ],
                              ))
                          .toList()
                    ],
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }
}
