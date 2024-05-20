import 'dart:convert';
import 'dart:developer';

import 'package:apis/API/API_Path.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class CheckHealth extends StatefulWidget {
  const CheckHealth({super.key});

  @override
  State<CheckHealth> createState() => _CheckHealthState();
}

class _CheckHealthState extends State<CheckHealth> {
  Future checkHealth() async {
    log("API");
    var res = await http.get(
      Uri.parse(API_URI.complete + DefaultAPIs.getHealth),
    );

    log(res.statusCode.toString());

    if (res.statusCode == 200) {
      var _jData = json.decode(res.body);

      log(_jData.toString());

      // Future.delayed(Durations.short2);
      return _jData;
    } else
      return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Health"),
      ),
      body: FutureBuilder(
        future: checkHealth(),
        builder: (context, snapshot) {
          List? data = snapshot.data ?? [];
          if (ConnectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            // if (snapshot.hasData) {
            return Text(
              snapshot.toString(),
              textAlign: TextAlign.center,
            );
            // } else {
            //   return Text("No data");
            // }
          }
        },
      ),
    );
  }
}
