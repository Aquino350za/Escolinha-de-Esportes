// ignore: deprecated_member_use
import 'package:flutter/material.dart';
import 'models/aluno.dart';
import 'models/mensalidade.dart';
import 'models/plano.dart';
import 'models/professor.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final profRicardo = Professor(
      idProfessor: 1,
      nome: 'Prof. Ricardo',
      especialidade: 'Futebol',
      telefone: '22988883333',
    );

    final profFernanda = Professor(
      idProfessor: 2,
      nome: 'Profa. Fernanda',
      especialidade: 'Natação',
      telefone: '22988884444',
    );

    final planoMensal = Mensal(
      idPlano: 1,
      nome: 'Plano Básico Mensal',
      valor: 150.0,
      duracaoMeses: 1,
      diaVencimento: 10,
      taxaAdesao: 20.0,
    );

    final planoTrimestral = Trimestral(
      idPlano: 2,
      nome: 'Plano Trimestral',
      valor: 140.0,
      duracaoMeses: 3,
      diaVencimento: 10,
      descontoTrimestral: 10.0,
    );

    final planoAnual = Anual(
      idPlano: 3,
      nome: 'Plano Anual',
      valor: 130.0,
      duracaoMeses: 12,
      diaVencimento: 10,
      descontoAnual: 20.0,
    );

    final List<Aluno> alunos = [
      Aluno(
        idAluno: 1,
        nome: 'Gabriel Silva',
        dataNascimento: '10/05/2010',
        telefone: '22999991111',
        responsavel: 'Carlos Silva',
        cpfResponsavel: '12345678900',
        professor: profRicardo,
        plano: planoMensal,
      ),
      Aluno(
        idAluno: 2,
        nome: 'Emanuel Monteiro',
        dataNascimento: '15/08/2011',
        telefone: '22999992222',
        responsavel: 'Ana Monteiro',
        cpfResponsavel: '98765432100',
        professor: profRicardo,
        plano: planoTrimestral,
      ),
      Aluno(
        idAluno: 3,
        nome: 'Mariana Costa',
        dataNascimento: '22/03/2012',
        telefone: '22999993333',
        responsavel: 'Paulo Costa',
        cpfResponsavel: '11122233344',
        professor: profFernanda,
        plano: planoAnual,
      ),
      Aluno(
        idAluno: 4,
        nome: 'Lucas Oliveira',
        dataNascimento: '04/11/2009',
        telefone: '22999994444',
        responsavel: 'Juliana Oliveira',
        cpfResponsavel: '55566677788',
        professor: profFernanda,
        plano: planoMensal,
      ),
      Aluno(
        idAluno: 5,
        nome: 'Sofia Almeida',
        dataNascimento: '19/07/2013',
        telefone: '22999995555',
        responsavel: 'Marcos Almeida',
        cpfResponsavel: '99988877766',
        professor: null, 
        plano: planoTrimestral,
      ),
    ];

    final mens1 = Mensalidade(
      idMensalidade: 1,
      valor: planoMensal.calcularValorFinal(),
      dataVencimento: '10/10/2026',
      aluno: alunos[0],
      plano: planoMensal,
    );
    alunos[0].adicionarMensalidade(mens1);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Escolinha de Esportes'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: alunos.length,
          itemBuilder: (context, index) {
            final aluno = alunos[index];
            final nomeProf = aluno.professor?.nome ?? 'Sem Professor';
            final modalidade = aluno.professor?.especialidade ?? 'Geral';
            final nomePlano = aluno.plano?.nome ?? 'Sem Plano';
            final valorFinal = aluno.plano?.calcularValorFinal() ?? 0.0;

            return Card(
              child: ListTile(
                leading: const Icon(Icons.sports_soccer),
                title: Text(aluno.nome),
                subtitle: Text('$modalidade ($nomeProf) · $nomePlano'),
                trailing: Text('R\$ ${valorFinal.toStringAsFixed(2)}'),
              ),
            );
          },
        ),
      ),
    );
  }
}