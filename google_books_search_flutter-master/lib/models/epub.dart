import 'package:equatable/equatable.dart';

class Epub extends Equatable {
	final bool isAvailable;

	const Epub({this.isAvailable});

	@override
	String toString() => 'Epub(isAvailable: $isAvailable)';

	factory Epub.fromJson(Map<String, dynamic> json) {
		return Epub(
			isAvailable: json['isAvailable'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'isAvailable': isAvailable,
		};
	}

	Epub copyWith({
		bool isAvailable,
	}) {
		return Epub(
			isAvailable: isAvailable ?? this.isAvailable,
		);
	}

	@override
	List<Object> get props => [isAvailable];
}
