import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wecare/data/datasource.dart';
import 'package:wecare/panels/indiaInfo.dart';
import 'package:wecare/panels/indiapannel.dart';
import 'package:wecare/panels/mostaffectedstates.dart';

class IndiaPage extends StatefulWidget {
  static const String id = "indiapage_screen";
  @override
  _IndiaPageState createState() => _IndiaPageState();
}

class _IndiaPageState extends State<IndiaPage> {
  Map IndiaData;
  fetchIndiaData() async {
    http.Response response = await http.get('https://api.rootnet.in/covid19-in/stats/latest');
    setState(() {
      IndiaData = json.decode(response.body);
    });
  }
  List StateData;
  fetchStateData() async {
    http.Response response =
    await http.get('https://api.rootnet.in/covid19-in/stats/latest');
    setState(() {
      StateData = json.decode(response.body);
    });
  }
  Future fetchData() async{
    fetchIndiaData();
    fetchStateData();
    print('fetchData called');
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight), onPressed: (){
            DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
          })
        ],

        centerTitle: false,
        title: Text(
          'COVID-19 TRACKER',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  color: Colors.orange[100],
                  child: Text(
                    DataSource.quote,
                    style: TextStyle(
                        color: Colors.orange[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'India',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => IndiaPage()));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: primaryBlack,
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Regional',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                IndiaData == null
                    ? CircularProgressIndicator()
                    : IndiaPannel(
                  IndiaData: IndiaData,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Most affected Countries',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                StateData == null
                    ? Container()
                    : mostAffectedStates(
                  StateData: StateData,
                ),
                indiaInfo(),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                      'WE ARE TOGETHER IN THE FIGHT',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                SizedBox(
                  height: 50,
                )
              ],
            )),
      ),
    );
  }
}
