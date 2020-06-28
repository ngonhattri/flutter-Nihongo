import 'package:flutter/material.dart';
import 'package:dacn/quiz/models/category.dart';
import 'package:dacn/quiz/models/question.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:dacn/quiz/ui/pages/quiz_finished.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:dacn/quiz/recognizer/contants.dart';
import 'package:dacn/quiz/recognizer/drawing_painter.dart';
import 'package:dacn/quiz/recognizer/brain.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  final Category category;

  const QuizPage({Key key, @required this.questions, this.category})
      : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Offset> points = List();
  AppBrain brain = AppBrain();

  void _cleanDrawing() {
    setState(() {
      points = List();
    });
  }

  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    brain.loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text(widget.category.name),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Text("${_currentIndex + 1}"),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          HtmlUnescape().convert(
                              widget.questions[_currentIndex].question),
                          softWrap: true,
                          style: _questionStyle,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      border: new Border.all(
                        width: 3.0,
                        color: Colors.blue,
                      ),
                    ),
                    child: Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onPanUpdate: (details) {
                            setState(() {
                              RenderBox renderBox = context.findRenderObject();
                              points.add(renderBox
                                  .globalToLocal(details.globalPosition));
                            });
                          },
                          onPanStart: (details) {
                            setState(() {
                              RenderBox renderBox = context.findRenderObject();
                              points.add(renderBox
                                  .globalToLocal(details.globalPosition));
                            });
                          },
                          onPanEnd: (details) async {
                            points.add(null);
                            List predictions =
                                await brain.processCanvasPoints(points);
                            print(predictions);

                            _answers[_currentIndex] =
                                predictions.first['label'];
                          },
                          child: ClipRect(
                            child: CustomPaint(
                              size: Size(kCanvasSize, kCanvasSize),
                              painter: DrawingPainter(
                                offsetPoints: points,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        child: Text(
                            _currentIndex == (widget.questions.length - 1)
                                ? "Nộp"
                                : "Tiếp theo"),
                        onPressed: _nextSubmit,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _cleanDrawing();
          },
          tooltip: 'Clean',
          child: Icon(Icons.delete),
        ),
      ),
    );
  }

  void _nextSubmit() {
    if (points.isEmpty == true) {
      _key.currentState.showSnackBar(SnackBar(
        content: Text("Bạn chưa viết chữ nào!!!!"),
      ));
      return;
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
      _cleanDrawing();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => QuizFinishedPage(
              questions: widget.questions, answers: _answers)));
    }
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Bạn có chắc muốn thoát? Toàn bộ quá trình sẽ bị mất dữ liệu."),
            title: Text("Cảnh báo!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Có"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text("Không"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
  }
}
