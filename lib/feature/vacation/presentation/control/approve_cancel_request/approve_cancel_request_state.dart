class ApproveCancelRequestState{
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  ApproveCancelRequestState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  ApproveCancelRequestState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return ApproveCancelRequestState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}