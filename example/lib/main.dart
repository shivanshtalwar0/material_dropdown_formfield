import 'package:flutter/material.dart';
import 'package:material_dropdown_formfield/material_dropdown_formfield.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _myActivity;
  GlobalKey<FormState> form = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  List<DropdownMenuItem<int>> dataSource = [
    DropdownMenuItem<int>(
        value: 1, child: Container(child: Text("Abc", style: TextStyle())))
  ];

  @override
  void initState() {
    super.initState();
    _myActivity = null;
    focusNode.addListener(() {
      focusNode.unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Formfield Example'),
      ),
      body: Center(
        child: Form(
            key: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: DropdownButtonFormField(
                    decoration: RoundedDropDownDecoration(
                        labelText: "Welcome to island"),
                    value: _myActivity,
                    onSaved: (value) {
                      print("from saved" + value.toString());
                    },
                    validator: (value) {
                      print('in validator ' + value.toString());
                      if (value == 1) {
                        return 'Swimming Not Allowed!';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      print("onchanged " + value.toString());
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    items: dataSource,
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Save form'),
                          onPressed: () {
                            form.currentState.validate();
                            form.currentState.save();
                          },
                        ),
                        RaisedButton(
                          child: Text('change to 1'),
                          onPressed: () {
                            setState(() {
                              _myActivity = 1;
                            });
                            form.currentState.validate();
                          },
                        ),
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}
