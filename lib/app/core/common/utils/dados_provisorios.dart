class DadosProvisorios {
  static List<Map<String, dynamic>> pocs = [
    {
      'numero': '1/2025',
      'data': '21/02/2025',
      'empresa': 'Empresa 1',
      'filial': 'Filial 1',
      'setor': 'Setor 1',
      'sub_setor': 'Subsetor 1',
      'pessoas_abordadas': 2,
      'pessoas_no_local': 1,
      'numero_de_desvios': 1,
      'tipo': 'Desvio Comportamental',
      'sincronizado': true,
    },
    {
      'numero': '2/2025',
      'data': '21/02/2025',
      'empresa': 'Empresa 2',
      'filial': 'Filial 2',
      'setor': 'Setor 2',
      'sub_setor': 'Subsetor 2',
      'pessoas_abordadas': 3,
      'pessoas_no_local': 1,
      'numero_de_desvios': 1,
      'tipo': 'Desvio Comportamental',
      'sincronizado': true,
    },
    {
      'numero': '3/2025',
      'data': '23/02/2025',
      'empresa': 'Empresa 3',
      'filial': 'Filial 3',
      'setor': 'Setor 3',
      'sub_setor': 'Subsetor 3',
      'pessoas_abordadas': 4,
      'pessoas_no_local': 1,
      'numero_de_desvios': 1,
      'tipo': 'Desvio Comportamental',
      'sincronizado': true,
    },
    {
      'numero': '4/2025',
      'data': '25/02/2025',
      'empresa': 'Empresa 4',
      'filial': 'Filial 4',
      'setor': 'Setor 4',
      'sub_setor': 'Subsetor 4',
      'pessoas_abordadas': 4,
      'pessoas_no_local': 1,
      'numero_de_desvios': 1,
      'tipo': 'Desvio Comportamental',
      'sincronizado': true,
    },
    {
      'numero': '5/2025',
      'data': '25/02/2025',
      'empresa': 'Empresa 5',
      'filial': 'Filial 5',
      'setor': 'Setor 5',
      'sub_setor': 'Subsetor 5',
      'pessoas_abordadas': 5,
      'pessoas_no_local': 1,
      'numero_de_desvios': 1,
      'tipo': 'Desvio Comportamental',
      'sincronizado': true,
    },
    {
      'numero': '6/2025',
      'data': '26/02/2025',
      'empresa': 'Empresa 5',
      'filial': 'Filial 5',
      'setor': 'Setor 5',
      'sub_setor': 'Subsetor 5',
      'pessoas_abordadas': 5,
      'pessoas_no_local': 1,
      'numero_de_desvios': 1,
      'tipo': 'Desvio Comportamental',
      'sincronizado': false,
    },
  ];
  static List<Map<String, dynamic>> ips = [];
  static List<Map<String, dynamic>> planoAcao = [];

  static List<Map<String, dynamic>> empresas = [
    {'id': 1, 'nome': 'Empresa 1', 'data': '2025-02-25'},
    {'id': 2, 'nome': 'Empresa 2', 'data': '2025-02-25'},
    {'id': 3, 'nome': 'Empresa 3', 'data': '2025-02-23'},
    {'id': 4, 'nome': 'Empresa 4', 'data': '2025-02-23'},
    {'id': 5, 'nome': 'Empresa 5', 'data': '2025-02-21'},
  ];

  static List<Map<String, dynamic>> filiais = [
    {'id': 1, 'nome': 'Filial 1'},
    {'id': 2, 'nome': 'Filial 2'},
    {'id': 3, 'nome': 'Filial 3'},
    {'id': 4, 'nome': 'Filial 4'},
    {'id': 5, 'nome': 'Filial 5'},
  ];

  static List<Map<String, dynamic>> setores = [
    {'id': 1, 'nome': 'Setor 1'},
    {'id': 2, 'nome': 'Setor 2'},
    {'id': 3, 'nome': 'Setor 3'},
    {'id': 4, 'nome': 'Setor 4'},
    {'id': 5, 'nome': 'Setor 5'},
  ];

  static List<Map<String, dynamic>> subSetores = [
    {'id': 1, 'nome': 'Subsetor 1'},
    {'id': 2, 'nome': 'Subsetor 2'},
    {'id': 3, 'nome': 'Subsetor 3'},
    {'id': 4, 'nome': 'Subsetor 4'},
    {'id': 5, 'nome': 'Subsetor 5'},
  ];
}
