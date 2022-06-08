import 'package:equatable/equatable.dart';

class Radios extends Equatable {
  final String name;
  final String url;

  Radios({required this.name, required this.url});

  @override
  // TODO: implement props
  List<Object?> get props => [name, url];

  @override
  String toString() => 'Radios(name: $name, url: $url)';

  Map<String, dynamic> toMap() {
    return {
      "Name": name,
      "URL": url,
    };
  }

  factory Radios.fromJson(Map<String, dynamic> json) {
    return Radios(
      name: json['Name'].toString(),
      url: json['URL'] ?? '',
    );
  }
}
