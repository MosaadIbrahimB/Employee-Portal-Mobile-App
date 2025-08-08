import 'package:equatable/equatable.dart';

class ReviewerModel extends Equatable {
  final String? name;
  final String? status;
  final String? note;

  const ReviewerModel({this.name, this.status, this.note});

  factory ReviewerModel.fromJson(Map<String, dynamic> json) {
    return ReviewerModel(
      name: json['Name'],
      status: json['Status'],
      note: json['Note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Status': status,
      'Note': note,
    };
  }

  @override
  List<Object?> get props => [name, status, note];




}
