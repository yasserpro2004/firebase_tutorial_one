import 'package:equatable/equatable.dart';

class PageIntity extends Equatable{
  final String route;
  final dynamic page;

  const PageIntity({
    required this.route,
    required this.page,
  });

  factory PageIntity.empty() =>
     const PageIntity(route: '', page: null);
  

  bool get isEmpty => this == PageIntity.empty();
  
  @override
  List<Object?> get props => [route,page];
}
