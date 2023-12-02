import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _StreamBuilder createState() => _StreamBuilder();
}

class _StreamBuilder extends State<Home> {
  late StreamController<String> _streamController;
  final List<String> _lista = [];
  List<String> _meses = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<String>();
    _meses = _getMeses();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_meses.isNotEmpty) {
        _streamController.sink.add(_meses.removeAt(0));
      } else {
        timer.cancel();
      }
    });
  }

  List<String> _getMeses() {
    return [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder<String>(
            stream: _streamController.stream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                if (snapshot.data != null) {
                  _lista.add(snapshot.data!);
                }
                return ListView.builder(
                  itemCount: _lista.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_lista[index]),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _streamController.close();
    _timer?.cancel();
    super.dispose();
  }
}
