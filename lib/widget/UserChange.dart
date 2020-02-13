import 'package:flutter/material.dart';
import 'package:flutter_redux_demo/model/User.dart';
import 'package:flutter_redux_demo/redux/GState.dart';
import 'package:flutter_redux_demo/redux/user_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class UserChange extends StatefulWidget{
  
   @override
  State createState() => UserChangeState();

}

class UserChangeState extends State<UserChange> {
  @override
  Widget build(BuildContext context) {

    /// StoreBuilder
    return StoreBuilder<GState>(
        builder: (BuildContext context, Store<GState> store){
          return Scaffold(
            appBar: AppBar(
              title: Text(store.state.userinfo.name),
            ),
            body: Center(
                child: Column(
                  children: <Widget>[
                    Text(store.state.userinfo.age.toString()),
                    SizedBox(height: 100,),
                    FlatButton(
                        onPressed: (){
                          store.dispatch(UpdateUserAction(User("黄林", ++store.state.userinfo.age, true)));
                        },
                        child: Text("点击增大年龄")
                    )
                  ],
                )
            ),
          );
        }
    );
  }
}
