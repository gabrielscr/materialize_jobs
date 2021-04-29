import 'package:materialize_jobs/domain/intro.dart';

class IntroRepository {
  List<Intro> list() {
    List<Intro> intros = [];

    return mockList(intros);
  }

  List<Intro> mockList(List<Intro> intros) {
    intros.add(
      Intro(
          description: 'Você trabalha com o que mais domina',
          image: 'https://image.freepik.com/vetores-gratis/conversa-de-entrevista-de-emprego_74855-7566.jpg',
          title: 'Encontre seu cargo ideal'),
    );

    intros.add(
      Intro(
          description: 'Junte-se ao nosso time',
          image: 'https://image.freepik.com/vetores-gratis/icone-plano-de-comunicacao_1262-18771.jpg',
          title: 'Somos especialistas'),
    );

    intros.add(
      Intro(
          description: 'Não precisa se locomover até uma empresa, você é a empresa.',
          image: 'https://image.freepik.com/vetores-gratis/trabalhando-na-ilustracao-de-escritorio_301430-946.jpg',
          title: 'Trabalhe da sua casa'),
    );

    return intros;
  }
}
