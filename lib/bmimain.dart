import 'package:flutter/material.dart';
import 'package:flutter_chapter8/bmiresult.dart';

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {

  final _formKey = GlobalKey<FormState>();

  final _heightControler = TextEditingController();
  final _weightControler = TextEditingController();

  @override
  void dispose(){
    _heightControler.dispose();
    _weightControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비만도 계산기'),),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '키'
                  ),
                  controller: _heightControler,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value.trim().isEmpty){
                      return '키를 입력하세요' ;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '몸무게'
                  ),
                  controller: _weightControler,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value.trim().isEmpty){
                      return '몸무게를 입력하세요';
                    }
                    return null;
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => BmiResult(
                                double.parse(_heightControler.text.trim()),
                                double.parse(_weightControler.text.trim()),
                              ),
                            ));
                      }
                    },
                    child: Text('결과'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}