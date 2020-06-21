import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wecare/data/searchIndia.dart';

class IndiaStatus extends StatefulWidget {
  static const String id = "india_screen";
  @override
  _IndiaStatusState createState() => _IndiaStatusState();
}

class _IndiaStatusState extends State<IndiaStatus> {
  List StateData;
  fetchStateData() async {
    http.Response response =
    await http.get('https://api.rootnet.in/covid19-in/stats/latest');
    setState(() {
      StateData = json.decode(response.body);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchStateData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){

            showSearch(context: context, delegate: searchIndia(StateData));

          },)
        ],
        title: Text('Country Stats'),
      ),
      body: StateData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          StateData[index]['data']['regional']['loc'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'CONFIRMED:' +
                                  StateData[index]['data']['regional']['totalConfirmed'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              'Indian-Confirmed:' +
                                  StateData[index]['data']['regional']['confirmedCasesIndian'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              'RECOVERED:' +
                                  StateData[index]['data']['regional']['discharged'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            Text(
                              'DEATHS:' +
                                  StateData[index]['data']['regional']['deaths'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness==Brightness.dark?Colors.grey[100]:Colors.grey[900]),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
        itemCount: StateData == null ? 0 : StateData.length,
      ),
    );
  }
}


