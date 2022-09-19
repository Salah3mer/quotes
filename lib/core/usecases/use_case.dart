import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/core/errors/failure.dart';

abstract class UseCases<type,parmas>{

  Future<Either<Failure,type>>call(parmas parmas);
}

class Noparmas extends Equatable{
  @override
  List<Object?> get props => [];
}