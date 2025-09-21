class MoneyState {
  final bool isLoading;
  final double installmentValue;

  MoneyState({
    this.isLoading = false,
    this.installmentValue = 0.0,
  });

  MoneyState copyWith({
    double? totalMoney,
    bool? isLoading,
    int? numberOfInstallments,
    double? installmentValue,
  }) {
    return MoneyState(
      isLoading: isLoading ?? this.isLoading,
      installmentValue: installmentValue ?? this.installmentValue,
    );
  }
}