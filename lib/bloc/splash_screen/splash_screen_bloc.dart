import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_chat/utils/connection.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final Connection connection;

  SplashScreenBloc(this.connection) : super(SplashScreenInitial());

  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenEvent event,
  ) async* {
    if (event is CheckInternet) {
      yield SplashScreenLoading();
      final isConnected = await connection.check();
      if (isConnected) {
        yield SplashScreenFinishSuccess();
      } else {
        yield SplashScreenFinishFailed();
      }
    }
  }
}
