import 'package:flutter_redux_demo/redux/user_redux.dart';

import '../model/User.dart';

class GState{
  User userinfo;
  GState({this.userinfo});
}

//创建reductor
 GState appReducer(GState state,acton){
  return GState(
    userinfo: UserReducer(state.userinfo,acton),
  );
 }