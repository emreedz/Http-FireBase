import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpPage extends StatefulWidget {
  const HttpPage({Key? key}) : super(key: key);

  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  // late bool isData;
  // String? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // isData = false;
    // data = "";
  }

  Future getApi() async {
    return (await http.get(Uri.parse(
            "https://restapideneme-ba5bf-default-rtdb.firebaseio.com/students/-MlzJd1C8kE82DbnF480/name.json")))
        .body;

    //data = json.decode(data);
    // setState(() {
    //   isData = !isData;
    //   this.data = data;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: getApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Text(json.decode(snapshot.data.toString()));
              } else {
                Text("You have error.Look at api.");
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Text("You have error.Are you sure api ?");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

// Future<Column> buildColumn() async {
//   return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         isData ? Text(data!) : CircularProgressIndicator(),
//         ElevatedButton(
//           onPressed: () async {
//             await getApi();
//           },
//           child: Text("Send Request"),
//         )
//       ],
//     );
// }
