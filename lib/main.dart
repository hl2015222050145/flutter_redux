import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/model/User.dart';
import 'package:flutter_redux_demo/redux/GState.dart';
import 'package:flutter_redux_demo/widget/UserChange.dart';
import 'package:redux/redux.dart';

void main() {
   /// 创建全局Store
  final store = Store<GState>(
      appReducer,
      initialState: GState(
        userinfo: User("mannyhuang", 18, true),
      )
  );
  runApp(MyApp(store,));  
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
    final Store<GState> store;
    MyApp(this.store);

     @override
  Widget build(BuildContext context) {
    return StoreProvider(//StoreProvider 能够加载store
        store: store,
        /// StoreBuilder后要跟上我们定义的那个State类，要不会报错，
        child: StoreBuilder<GState>(builder: (BuildContext context, Store<GState> store){
          return MaterialApp(
            title: 'ReduxDemo',
            theme: new ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: UserChange(),
          );
        })
    );
  }
}
