import 'package:country_list/src/common/constants/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    LogView.success('${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    LogView.info('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    LogView.error('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
