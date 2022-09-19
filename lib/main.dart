import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quotes/app.dart';
import 'package:quotes/core/bloc_opserever.dart';
import 'package:quotes/core/server/server_locator.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(const QuoteApp());
}

