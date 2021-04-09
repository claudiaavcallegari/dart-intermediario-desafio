main(List<String> args) {
  var pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Masculino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  // Baseado na lista acima.
  // 1 - Remover os duplicados
  // 2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino
  // 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos
  //     e mostre a quantidade de pessoas com mais de 18 anos
  // 4 - Encontre a pessoa mais velha.

  try {
    var pessoas2 = <String>{};

    for (var valor in pessoas) {
      pessoas2.add(valor);
    }

    print('1- Lista abaixo sem os ítens duplicados ');
    print(pessoas2);

    Set<Map> pessoasMap = pessoasToMap(pessoas2);
//  print(pessoasMap);

    var totMasculino = 0;
    var totFeminino = 0;

    var pessoaMaisVelha = '';
    var idadeAtual = 0;

    pessoasMap.forEach((element) {
      (element['sexo'].toString().toUpperCase().substring(0, 1) == 'F')
          ? totFeminino++
          : totMasculino++;
      if (element['idade'] > idadeAtual) {
        idadeAtual = element['idade'];
        pessoaMaisVelha = element['nome'];
      }
    });

    print('2-  Total Masculino: $totMasculino   Total Feminino: $totFeminino');
    print(' ');
    pessoasMap.removeWhere((element) => element['idade'] <= 18);

    print('3- Lista de pessoas com mais de 18 anos:');
    print(pessoasMap);
    print(' ');
    print('3.1 - Total de pessoas com mais de 18 anos: ${pessoasMap.length}');

    print('4-  A pessoa mais velha é: $pessoaMaisVelha ');
  } catch (e, s) {
    print('Houve um erro: $e');
    print('Detalhes do erro: $s');
  }
}

Set pessoasToMap(Set pessoas) {
  var pessoasMap = <Map<String, dynamic>>{};

  for (var valor in pessoas) {
    var linha = valor.split('|');
    var nome = linha[0];
    var idade = int.parse(linha[1]);
    var sexo = linha[2];

    pessoasMap.add({'nome': nome, 'idade': idade, 'sexo': sexo});
  }
  return pessoasMap;
}
