import 'package:car_fix/model/address_model.dart';
import 'package:car_fix/model/client_model.dart';
import 'package:car_fix/model/service_model.dart';
import 'package:car_fix/model/service_provider_model.dart';
import 'package:car_fix/model/vehicle_model.dart';
import 'package:car_fix/service/service_provider/service_provider_service.dart';
import 'package:car_fix/service/services/services_service.dart';
import 'package:car_fix/service/via_cep/via_cep_service.dart';
import 'package:car_fix/utils/dialogs.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpServiceProviderController extends GetxController {
  final ViaCepService viaCepService;
  final ServicesService servicesService;
  final ServiceProviderService serviceProviderService;

  SignUpServiceProviderController({
    required this.viaCepService,
    required this.servicesService,
    required this.serviceProviderService,
  });

  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerFullName = TextEditingController();
  TextEditingController textEditingControllerIdentifier =
      TextEditingController();
  TextEditingController textEditingControllerPhoneNumber =
      TextEditingController();
  TextEditingController textEditingControllerConfirmPassword =
      TextEditingController();
  TextEditingController textEditingControllerNeighborhood =
      TextEditingController();
  TextEditingController textEditingControllerStreet = TextEditingController();
  TextEditingController textEditingControllerNumber = TextEditingController();
  TextEditingController textEditingControllerCep = TextEditingController();
  TextEditingController textEditingControllerComplement =
      TextEditingController();
  TextEditingController textEditingControllerState = TextEditingController();
  TextEditingController textEditingControllerCity = TextEditingController();
  TextEditingController textEditingControllerModel = TextEditingController();
  TextEditingController textEditingControllerMark = TextEditingController();
  TextEditingController textEditingControllerPlate = TextEditingController();
  TextEditingController textEditingControllerColor = TextEditingController();
  TextEditingController textEditingControllerCnh = TextEditingController();
  final formKeyAddress = GlobalKey<FormState>();
  final formKeyPersonal = GlobalKey<FormState>();
  final formKeyVehicle = GlobalKey<FormState>();

  final textBtnImgCnh = "Imagem da cnh obrigatoria".obs;
  final Rx<XFile?> fileCnh = Rx<XFile?>(null);
  final filePathCnh = "".obs;
  final txtErrorCnh = "".obs;

  final textBtnImgDocumentVehicle = "Documento do carro obrigatorio".obs;
  final Rx<XFile?> fileDocumentVehicle = Rx<XFile?>(null);
  final filePathDocumentVehicle = "".obs;
  final txtErrorDocumentVehicle = "".obs;
  List<String> listServiceApi = [];
  final FocusNode focusNodeCep = FocusNode();
  final Rx<int> serviceSelected = 0.obs;

  final RxList<ServiceModel> listService = <ServiceModel>[].obs;

  final loadingBtn = false.obs;

  @override
  void onInit() async {
    super.onInit();
    List<ServiceModel>? listReturnService =
        await servicesService.get(Get.context!);
    listService.value = listReturnService!;
  }

  var currentStep = 0.obs;

  void onStepContinue() {
    if (currentStep.value < 4) {
      switch (currentStep.value) {
        case 0:
          if (!formKeyPersonal.currentState!.validate()) {
            if (fileCnh.value == null) {
              txtErrorCnh.value = "Imagem de Cnh é obrigatorio";
            }
            return;
          } else if (fileCnh.value == null) {
            txtErrorCnh.value = "Imagem de Cnh é obrigatorio";
            return;
          } else {
            txtErrorCnh.value = "";
            currentStep(currentStep.value + 1);
          }
          break;
        case 1:
          if (!formKeyAddress.currentState!.validate()) {
            return;
          }
          currentStep(currentStep.value + 1);
          break;
        case 2:
          if (!formKeyVehicle.currentState!.validate()) {
            return;
          }
          currentStep(currentStep.value + 1);
          break;
        case 3:
          for (var service in listService) {
            if (listServiceApi.contains(service.id)) {
              if (!service.isSelected) {
                listServiceApi.remove(service.id);
              }
            } else {
              if (service.isSelected) {
                listServiceApi.add(service.id);
                serviceSelected.value++;
              }
            }
          }
          if (serviceSelected == 0) {
            showDialogError(
              title: "Escolha ao menos 1 serviço",
              context: Get.context!,
            );
            return;
          }
          String cpfWithouPoint =
              textEditingControllerIdentifier.text.replaceAll(".", "");
          String cpfFormatted = cpfWithouPoint.replaceAll("-", "");
          AddressModel address = AddressModel(
            neighborhood: textEditingControllerNeighborhood.text,
            street: textEditingControllerStreet.text,
            number: textEditingControllerNumber.text,
            city: textEditingControllerCity.text,
            state: textEditingControllerState.text,
            cep: textEditingControllerCep.text,
            complement: textEditingControllerComplement.text,
          );

          VehicleModel vehicle = VehicleModel(
            model: textEditingControllerModel.text,
            mark: textEditingControllerMark.text,
            plate: textEditingControllerPlate.text,
            color: textEditingControllerColor.text,
            pathToDocument: fileDocumentVehicle.value!.path,
          );

          ClientModel user = ClientModel(
            fullName: textEditingControllerFullName.text,
            phoneNumber: textEditingControllerPhoneNumber.text,
            email: textEditingControllerEmail.text,
            identifier: cpfFormatted,
            password: textEditingControllerPassword.text,
            type: "SERVICE_PROVIDER",
            address: address,
            vehicle: vehicle,
          );
          ServiceProviderModel clientData = ServiceProviderModel(
            listServicesID: listServiceApi,
            userDto: user,
            cnh: textEditingControllerCnh.text,
          );

          serviceProviderService.create(
            clientData,
            fileDocumentVehicle.value!,
            fileCnh.value!,
            Get.context!,
            loadingBtn,
          );
          break;
      }
    }
  }

  void onStepCancel() {
    if (currentStep.value == 0) {
      Get.back();
    } else if (currentStep.value > 0) {
      currentStep(currentStep.value - 1);
    }
  }

  void fetchCep() async {
    AddressModel? addressModel;
    try {
      textEditingControllerNeighborhood.text = "Carregando...";
      textEditingControllerStreet.text = "Carregando...";
      textEditingControllerState.text = "Carregando...";
      textEditingControllerCity.text = "Carregando...";

      addressModel =
          await viaCepService.getAddress(textEditingControllerCep.value.text);
    } catch (e) {
      addressModel = null;
    } finally {
      if (addressModel != null) {
        textEditingControllerNeighborhood.text = addressModel.neighborhood;
        textEditingControllerStreet.text = addressModel.street;
        textEditingControllerState.text = addressModel.state;
        textEditingControllerCity.text = addressModel.city;
      } else {
        textEditingControllerNeighborhood.text = "";
        textEditingControllerStreet.text = "";
        textEditingControllerState.text = "";
        textEditingControllerCity.text = "";
      }
    }
  }
}
