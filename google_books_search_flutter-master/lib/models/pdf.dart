import 'package:equatable/equatable.dart';

class Pdf extends Equatable {
	final bool isAvailable;

	const Pdf({this.isAvailable});

	@override
	String toString() => 'Pdf(isAvailable: $isAvailable)';

	factory Pdf.fromJson(Map<String, dynamic> json) {
		return Pdf(
			isAvailable: json['isAvailable'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'isAvailable': isAvailable,
		};
	}

	Pdf copyWith({
		bool isAvailable,
	}) {
		return Pdf(
			isAvailable: isAvailable ?? this.isAvailable,
		);
	}

	@override
	List<Object> get props => [isAvailable];
}
