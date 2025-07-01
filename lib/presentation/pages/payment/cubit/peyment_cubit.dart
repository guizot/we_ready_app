import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_ready_app/presentation/pages/payment/cubit/payment_state.dart';
import '../../../../data/models/local/payment_model.dart';
import '../../../../data/models/local/vendor_model.dart';
import '../../../../domain/usecases/payment_usecases.dart';

class PaymentCubit extends Cubit<PaymentCubitState> {

  final PaymentUseCases paymentUseCases;
  PaymentCubit({required this.paymentUseCases}) : super(PaymentInitial());

  Future<void> getAllPayment(String vendorId) async {
    emit(PaymentLoading());
    List<Payment> payments = paymentUseCases.getAllPayment(vendorId);
    if(payments.isEmpty) {
      emit(PaymentEmpty());
    } else if(payments.isNotEmpty) {
      emit(PaymentLoaded(payments: payments));
    }
  }

  Payment? getPayment(String id) {
    emit(PaymentLoading());
    Payment? event = paymentUseCases.getPayment(id);
    emit(PaymentInitial());
    return event;
  }

  Vendor? getVendor(String id) {
    Vendor? event = paymentUseCases.getVendor(id);
    return event;
  }

  Future<void> savePayment(Payment item) async {
    await paymentUseCases.savePayment(item);
  }

  Future<void> deletePayment(String id) async {
    await paymentUseCases.deletePayment(id);
  }

}