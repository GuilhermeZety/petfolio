// ignore_for_file: public_member_api_docs, sort_constructors_first
class Paginated<T> {
  List<T> itens;

  final bool nextPage;
  final bool previousPage;

  Paginated({
    required this.itens,
    required this.nextPage,
    required this.previousPage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': itens.map((x) => (x as dynamic)?.toMap()).toList(),
      'pagination': {
        'next_page': nextPage, //próxima pagina
        'previus_page': previousPage, //pagina anterior
      },
    };
  }

  factory Paginated.fromMap(
    Map<String, dynamic> map,
    String name,
    T Function(Map<String, dynamic>) fromM,
  ) {
    return Paginated<T>(
      itens: map[name].map<T>((x) => fromM(x as Map<String, dynamic>)).toList(),
      nextPage: map['pagination']['next_page'] as bool,
      previousPage: map['pagination']['previous_page'] as bool,
    );
  }
}
