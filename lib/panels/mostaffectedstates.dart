import 'package:flutter/material.dart';

class mostAffectedStates extends StatelessWidget {
  final List StateData;
  const mostAffectedStates({Key key, this.StateData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    StateData[index]['data']['regional']['loc'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Deaths:' + StateData[index]['data']['regional']['deaths'].toString(),
                  ),
                ],
              ),

            );
          },
      ),
    );
  }
}
