import 'package:equatable/equatable.dart';

class IndustryIdentifiers extends Equatable {
	final String type;
	final String identifier;

	const IndustryIdentifiers({this.type, this.identifier});

	@override
	String toString() {
		return 'IndustryIdentifiers(type: $type, identifier: $identifier)';
	}

	factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) {
		return IndustryIdentifiers(
			type: json['type'] as String,
			identifier: json['identifier'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'type': type,
			'identifier': identifier,
		};
	}

	IndustryIdentifiers copyWith({
		String type,
		String identifier,
	}) {
		return IndustryIdentifiers(
			type: type ?? this.type,
			identifier: identifier ?? this.identifier,
		);
	}

	@override
	List<Object> get props => [type, identifier];
}
