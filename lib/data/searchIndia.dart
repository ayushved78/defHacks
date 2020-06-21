import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:wecare/data/datasource.dart';

class searchIndia extends SearchDelegate{
  final List StateList;
  searchIndia(this.StateList);
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        primaryColor: primaryBlack,
        brightness: DynamicTheme.of(context).brightness
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query='';

      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList
    =
    query.isEmpty?
    StateList: StateList.where((element) => element['data']['regional']['loc'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index){
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
                        suggestionList[index]['data']['regional']['loc'],
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
                                suggestionList[index]['data']['regional']['totalConfirmed'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          Text(
                            'Indian-Confirmed:' +
                                suggestionList[index]['data']['regional']['confirmedCasesIndian'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          Text(
                            'RECOVERED:' +
                                suggestionList[index]['data']['regional']['discharged'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          Text(
                            'DEATHS:' +
                                suggestionList[index]['data']['regional']['deaths'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:  Theme.of(context).brightness==Brightness.dark?Colors.grey[100]:Colors.grey[900]),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}