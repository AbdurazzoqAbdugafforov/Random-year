import 'package:get_it/get_it.dart';
import 'package:search_year/event.dart';

import 'package:flutter/material.dart';

import 'http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isloading = false;
  RandomYear? _randomEvent;

  Future<void> _getEvent() async {
    setState(() {
      _isloading = true;
    });

    final client = GetIt.I.get<HttpService>().client();
    final response = await client.get(
      'http://numbersapi.com/random/year?json',
    );
    final RandomYear event = RandomYear.fromJson(response.data);
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
      backgroundColor: Colors.blue,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            const SizedBox(
              height: 40,
            ),
            _isloading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${_randomEvent?.text}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(60),
                      backgroundColor: Colors.blueGrey),
                  onPressed: () {
                    _getEvent();
                  },
                  child: const Text(
                    'Random Event',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
            ),
          ])),
    );
  }
}
