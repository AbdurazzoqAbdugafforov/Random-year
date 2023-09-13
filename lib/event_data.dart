import 'dart:convert';

import 'package:get_it/get_it.dart';

import 'event.dart';
import 'package:flutter/material.dart';

import 'http_service.dart';

class EventsDate extends StatefulWidget {
  const EventsDate({super.key});

  @override
  State<EventsDate> createState() => _EventsDateState();
}

class _EventsDateState extends State<EventsDate> {
  bool _isloading = false;
  Event? _randomEvent;

  Future<void> _getEvent() async {
    setState(() {
      _isloading = true;
    });

    final client = GetIt.I.get<HttpService>().client();
    final response = await client.get('http://numbersapi.com/random/year?json');
    final Event event = Event.fromJson(response.data);
    setState(() {
      _randomEvent = event;
      _isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                _isloading ? const Center(child: CircularProgressIndicator()): Text('${_randomEvent?.text}'),
                  const SizedBox(height: 40,),
                  ElevatedButton(onPressed: (){_getEvent();}, child:const Text('Random Event'))
    ]))
    );
  }
}
