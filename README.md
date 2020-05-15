### This plugin is not maintained anymore, so its use is not recommended
since in latest flutter update this plugin was already introduced, So there's no point maintaining this plugin. Kindly refer
[DropDownButtonFormField](https://api.flutter.dev/flutter/material/DropdownButtonFormField-class.html)

### Material Dropdown form fieldA material dropdown form field using a dropdown button inside a form field.
this plugin is improved version of [dropdown_formfield](https://github.com/cetorres/dropdown_formfield) plugin originally developed by [cetorres](https://github.com/cetorres)


## Demo

<img src="https://github.com/shivanshtalwar0/material_dropdown_formfield/raw/master/preview.gif" width="300" />

## Features

- Can be used as regular form field.
- Simple to implement.
- Simple and intuitive to use in the app.
- Provides validation of data.
- Provides requirement of the field.
- Follows the app theme and colors.

## Helper Classes for customizing look and feel of dropdownbutton
1. OutlinedDropDownDecoration inherits InputDecoration
2. RoundedDropDownDecoration inherits InputDecoration

## Api and Options

| Option               | Type            | Description                                                                                    |
|----------------------|-----------------|------------------------------------------------------------------------------------------------|
| innerBackgroundColor | Color           | inner background color of dropdownformfield                                                    |
| titleText            | String          | provide labelText                                                                              |
| hintText             | String          | provide hint                                                                                   |
| required             | bool            | field required or no                                                                           |
| errorText            | String          | error text                                                                                     |
| value                | dynamic         | initial source value                                                                           |
| dataSource           | List            | list of options                                                                                |
| textField            | String          | field to show text                                                                             |
| valueField           | String          | field to target for value                                                                      |
| onChanged            | Function        | fired when value changes                                                                       |
| filed                | bool            |                                                                                                |
| focusNode            | FocusNode       | provide focus node                                                                             |
| inputDecoration      | InputDecoration | can be OutlinedDropDownDecoration,RoundedDropDownDecoration or your own custom InputDecoration |
| innerTextStyle       | TextStyle       | inner text style of dropdown                                                                   |
| wedgeColor           | Color           | dropdown wedge color                                                                           |
| disabledWedgeColor   | Color           | wedge color to be shown when dropdown disabled                                                 |
| wedgeIcon            | Icon            | icon of wedge default:-(Icon(Icons.arrow_drop_down))                                           |




## Example

```dart
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
  String _myActivity;
  String _myActivityResult;
  GlobalKey<FormState> form = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  List dataSource = [
    {
      "display": "Running",
      "value": "Running",
    },
    {
      "display": "Climbing",
      "value": "Climbing",
    },
    {
      "display": "Walking",
      "value": "Walking",
    },
    {
      "display": "Swimming",
      "value": "Swimming",
    },
    {
      "display": "Soccer Practice",
      "value": "Soccer Practice",
    },
    {
      "display": "Baseball Practice",
      "value": "Baseball Practice",
    },
    {
      "display": "Football Practice",
      "value": "Football Practice",
    },
  ];

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
    focusNode.addListener(() {
      focusNode.unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
//      focusNode.
    });
  }

  _saveForm() {
//    var form = formKey.currentState;
    if (form.currentState.validate()) {
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
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
                  color: Colors.black,
                  padding: EdgeInsets.all(16),
                  child: DropDownFormField(
                    autovalidate: true,
                    validator: (value) {
                      if (value == '') {
                        return "can't be empty";
                      }
                      if (value == 'Swimming') {
                        return 'Swimming Not Allowed!';
                      } else {
                        return null;
                      }
                    },
                    innerBackgroundColor: Colors.green,
                    wedgeIcon: Icon(Icons.keyboard_arrow_down),
                    wedgeColor: Colors.lightBlue,
                    innerTextStyle: TextStyle(color: Colors.white),
                    focusNode: focusNode,
                    inputDecoration: OutlinedDropDownDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: "Welcome to island",
                        borderColor: Colors.white),
                    hintText: 'Please choose one',
                    value: _myActivity,
                    onSaved: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    dataSource: dataSource,
                    textField: 'display',
                    valueField: 'value',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: DropDownFormField(
                    titleText: 'My workout',
                    hintText: 'Please choose one',
                    validator: (value) {
                      if (value == 'Swimming') {
                        return 'Swimming Not Allowed!';
                      } else {
                        return null;
                      }
                    },
                    value: _myActivity,
                    onSaved: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    dataSource: dataSource,
                    textField: 'display',
                    valueField: 'value',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: DropDownFormField(
                    inputDecoration: RoundedDropDownDecoration(
                        labelText: "Welcome to island"),
                    hintText: 'Please choose one',
                    value: _myActivity,
                    validator: (value) {
                      if (value == 'Swimming') {
                        return 'Swimming Not Allowed!';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _myActivity = value;
                      });
                    },
                    dataSource: dataSource,
                    textField: 'display',
                    valueField: 'value',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: RaisedButton(
                    child: Text('Save'),
                    onPressed: _saveForm,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(_myActivityResult),
                )
              ],
            )),
      ),
    );
  }
}
```

## License

This project is licensed under the BSD License. See the LICENSE file for details.
