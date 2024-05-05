import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      try {
        print("---STATE--CHANGED--");
        print("---STATE--CHANGED--${change.currentState}={change.nextState}");
        print("---STATE--CHANGED--");
      } catch (e) {}
    }
    // LogUtils.logError("----------------STATE CHANGED--------------",
    //     "---------------------------");
    // LogUtils.logError(
    //     "----------------STATE CHANGED--------------", change.nextState);
    // LogUtils.logError("----------------STATE CHANGED--------------",
    //     "---------------------------");
  }
}
