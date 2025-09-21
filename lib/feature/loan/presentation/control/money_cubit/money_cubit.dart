import '../../../../../core/utils/import_file.dart';
import 'money_state.dart';

class MoneyCubit extends Cubit<MoneyState> {
  MoneyCubit() : super(MoneyState());
  static final TextEditingController totalMoneyController = TextEditingController();
  static final TextEditingController numberOfInstallmentsController = TextEditingController();


  calculateOneInstallment() {
    final totalText = totalMoneyController.text.trim() ?? '';
    final installmentsText = numberOfInstallmentsController.text.trim() ?? '';

    final totalMoney = double.tryParse(totalText) ?? 0.0;
    final installments = int.tryParse(installmentsText) ?? 0;


    if (installments > 0) {
      final oneInstallment = totalMoney / installments;
      emit(state.copyWith(installmentValue: oneInstallment));
    } else {
      emit(state.copyWith(installmentValue: 0));
    }
  }
}

