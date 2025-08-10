import 'package:equatable/equatable.dart';

class AllRequestState extends Equatable{
  final bool ?isLoading ;
  final  String? errorMessage;
  final List<dynamic>? response;


  const AllRequestState({ this.isLoading= false, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<dynamic>? response,

  }) {
    return AllRequestState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        response: response ?? this.response,
    );

  }
  @override
  List<Object?> get props => [response,  isLoading, errorMessage];

}