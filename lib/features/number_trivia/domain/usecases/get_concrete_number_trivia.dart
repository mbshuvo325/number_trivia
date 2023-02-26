
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/number_trivia.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia,Param>{
  final NumberTriviaRepository? repository;
  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure,NumberTrivia>>? call(Param param) async{
    return await repository!.getConcreteNumberTrivia(param.number)!;
  }
}

class Param extends Equatable{
 final int number;
  const Param({required this.number});

  @override
  List<Object?> get props => [number];
}