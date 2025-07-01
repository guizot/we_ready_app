import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_ready_app/presentation/pages/vendor/cubit/vendor_state.dart';
import '../../../../data/models/local/vendor_model.dart';
import '../../../../domain/usecases/vendor_usecases.dart';

class VendorCubit extends Cubit<VendorCubitState> {

  final VendorUseCases vendorUseCases;
  VendorCubit({required this.vendorUseCases}) : super(VendorInitial());

  Future<void> getAllVendor() async {
    emit(VendorLoading());
    List<Vendor> vendors = vendorUseCases.getAllVendor();
    if(vendors.isEmpty) {
      emit(VendorEmpty());
    } else if(vendors.isNotEmpty) {
      emit(VendorLoaded(vendors: vendors));
    }
  }

  Vendor? getVendor(String id) {
    emit(VendorLoading());
    Vendor? event = vendorUseCases.getVendor(id);
    emit(VendorInitial());
    return event;
  }

  Future<void> saveVendor(Vendor item) async {
    await vendorUseCases.saveVendor(item);
  }

  Future<void> deleteVendor(String id) async {
    await vendorUseCases.deleteVendor(id);
  }

  String? getSelectedEventId() {
    try {
      return vendorUseCases.getSelectedEvent()['id'];
    } catch(e) {
      return null;
    }
  }


}