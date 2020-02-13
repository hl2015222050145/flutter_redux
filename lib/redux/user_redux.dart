import '../model/User.dart';
import 'package:redux/redux.dart';

/// redux 的 combineReducers, 通过 TypedReducer 将 UpdateUserAction 与 reducers 关联起来
final UserReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_updateLoaded),
]);

//根据user创建一个新的user
User _updateLoaded(User user,  UpdateUserAction action) {
  user = action.userInfo;
  return user;
}

class UpdateUserAction {
  final User userInfo;

  UpdateUserAction(this.userInfo);
}