import 'aluno.dart';

class Professor {
  final int idProfessor;
  String nome;
  String especialidade;
  String? telefone; 
  final List<Aluno> _alunos = []; 

  Professor({
    required this.idProfessor,
    required this.nome,
    required this.especialidade,
    this.telefone,
  });

  List<Aluno> get alunos => _alunos;

  void adicionarAluno(Aluno aluno) {
    if (!_alunos.contains(aluno)) {
      _alunos.add(aluno);
    }
  }

  void removerAluno(Aluno aluno) {
    _alunos.remove(aluno);
  }

  @override
  String toString() {
    return 'Professor [ID: $idProfessor, Nome: $nome, '
        'Especialidade: $especialidade, '
        'Telefone: ${telefone ?? "Não informado"}, '
        'Total de Alunos: ${_alunos.length}]';
  }
}