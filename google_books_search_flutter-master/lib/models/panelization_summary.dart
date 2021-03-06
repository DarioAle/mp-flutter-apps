import 'package:equatable/equatable.dart';

class PanelizationSummary extends Equatable {
	final bool containsEpubBubbles;
	final bool containsImageBubbles;

	const PanelizationSummary({this.containsEpubBubbles, this.containsImageBubbles});

	@override
	String toString() {
		return 'PanelizationSummary(containsEpubBubbles: $containsEpubBubbles, containsImageBubbles: $containsImageBubbles)';
	}

	factory PanelizationSummary.fromJson(Map<String, dynamic> json) {
		return PanelizationSummary(
			containsEpubBubbles: json['containsEpubBubbles'] as bool,
			containsImageBubbles: json['containsImageBubbles'] as bool,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'containsEpubBubbles': containsEpubBubbles,
			'containsImageBubbles': containsImageBubbles,
		};
	}

	PanelizationSummary copyWith({
		bool containsEpubBubbles,
		bool containsImageBubbles,
	}) {
		return PanelizationSummary(
			containsEpubBubbles: containsEpubBubbles ?? this.containsEpubBubbles,
			containsImageBubbles: containsImageBubbles ?? this.containsImageBubbles,
		);
	}

	@override
	List<Object> get props => [containsEpubBubbles, containsImageBubbles];
}
