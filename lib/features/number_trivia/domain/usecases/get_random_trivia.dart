import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/core/usecase/use_case.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia,NoParams>{
  final NumberTriviaRepository? repository;
  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure,NumberTrivia>>? call(NoParams param) async{
    return await repository!.getRandomNumberTrivia()!;
  }
}

class NoParams extends Equatable{
  @override
  List<Object?> get props => [];
}