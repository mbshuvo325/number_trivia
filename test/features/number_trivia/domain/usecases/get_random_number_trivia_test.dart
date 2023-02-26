import 'package:dartz/dartz.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_trivia.dart';

class MocNumberTriviaRepository extends Mock implements NumberTriviaRepository{}

void main() {
  GetRandomNumberTrivia? useCase;
  MocNumberTriviaRepository? mocNumberTriviaRepository;

  setUp((){
    mocNumberTriviaRepository = MocNumberTriviaRepository();
    useCase = GetRandomNumberTrivia(mocNumberTriviaRepository!);
  });

  const tNumberTrivia = NumberTrivia(text: "Test",number: 1);

  test('Should get Random trivia from repository',() async{

    when(mocNumberTriviaRepository!.getRandomNumberTrivia())
        .thenAnswer((_) async => const Right(tNumberTrivia));

    final result = await useCase!(NoParams());

    expect(result, const Right(tNumberTrivia));

    verify(mocNumberTriviaRepository!.getRandomNumberTrivia());

    verifyNoMoreInteractions(mocNumberTriviaRepository);

  });
}
