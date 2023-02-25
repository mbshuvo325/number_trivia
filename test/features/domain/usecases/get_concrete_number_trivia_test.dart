import 'package:dartz/dartz.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MocNumberTriviaRepository extends Mock implements NumberTriviaRepository{}

void main() {
  GetConcreteNumberTrivia? useCase;
  MocNumberTriviaRepository? mocNumberTriviaRepository;

  setUp((){
    mocNumberTriviaRepository = MocNumberTriviaRepository();
    useCase = GetConcreteNumberTrivia(mocNumberTriviaRepository!);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: "Test",number: 1);

  test('Should get trivia for number from repository',() async{
    when(mocNumberTriviaRepository!.getConcreteNumberTrivia(1))
        .thenAnswer((_) async => const Right(tNumberTrivia));

    final result = await useCase!.execute(number: tNumber);

    expect(result, const Right(tNumberTrivia));

    verify(mocNumberTriviaRepository!.getConcreteNumberTrivia(tNumber));

    verifyNoMoreInteractions(mocNumberTriviaRepository);

  });
}
