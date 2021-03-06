import 'package:equatable/equatable.dart';

import "Books.dart";

class BookCase extends Equatable {
	final String kind;
	final int totalItems;
	final List<Books> items;

	const BookCase({
		this.kind,
		this.totalItems,
		this.items,
	});

	@override
	String toString() {
		return 'BookCase(kind: $kind, totalItems: $totalItems, items: $items)';
	}

	factory BookCase.fromJson(Map<String, dynamic> json) {
		return BookCase(
			kind: json['kind'] as String,
			totalItems: json['totalItems'] as int,
			items: (json['items'] as List<Books>)?.map((e) {
				return e == null ? null : Books.fromJson(e as Map<String, dynamic>);
			})?.toList(),
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'kind': kind,
			'totalItems': totalItems,
			'items': items?.map((e) => e?.toJson())?.toList(),
		};
	}

	BookCase copyWith({
		String kind,
		int totalItems,
		List<Books> items,
	}) {
		return BookCase(
			kind: kind ?? this.kind,
			totalItems: totalItems ?? this.totalItems,
			items: items ?? this.items,
		);
	}

	@override
	List<Object> get props => [kind, totalItems, items];
}
