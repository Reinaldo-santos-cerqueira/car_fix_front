import 'package:car_fix/model/address_model.dart';
import 'package:car_fix/model/client_model.dart';
import 'package:car_fix/model/vehicle_model.dart';
import 'package:car_fix/service/client/client_service.dart';
import 'package:car_fix/service/via_cep/via_cep_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpClientController extends GetxController {
  final ViaCepService viaCepService;
  final ClientService clientService;

  SignUpClientController(
      {required this.viaCepService, required this.clientService});

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
  TextEditingController textEditingControllerComplement = TextEditingController();

  TextEditingController textEditingControllerState = TextEditingController();
  TextEditingController textEditingControllerCity = TextEditingController();
  TextEditingController textEditingControllerModel = TextEditingController();
  TextEditingController textEditingControllerMark = TextEditingController();
  TextEditingController textEditingControllerPlate = TextEditingController();
  TextEditingController textEditingControllerColor = TextEditingController();

  TextEditingController textEditingControllerPathToImageCnh =
      TextEditingController();
  TextEditingController textEditingControllerCnh = TextEditingController();
  final formKeyAddress = GlobalKey<FormState>();
  final formKeyPersonal = GlobalKey<FormState>();
  final formKeyVehicle = GlobalKey<FormState>();

  final textBtnImgDocumentVehicle = "Documento do veiculo".obs;
  final Rx<XFile?> fileDocumentVehicle = Rx<XFile?>(null);
  final filePathDocumentVehicle = "".obs;
  final txtErrorDocumentVehicle = "".obs;

  final textBtnImgProfile = "Foto de perfil obrigatória".obs;
  final Rx<XFile?> fileProfile = Rx<XFile?>(null);
  final filePathProfile = "".obs;
  final txtErrorProfile = "".obs;

  final FocusNode focusNodeCep = FocusNode();

  final loadingBtn = false.obs;

  var currentStep = 0.obs;

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

  void onStepContinue(BuildContext context) {
    if (currentStep.value < 3) {
      if (currentStep.value == 0) {
        if (!formKeyPersonal.currentState!.validate()) {
          return;
        }
        currentStep(currentStep.value + 1);
      } else if (currentStep.value == 1) {
        if (!formKeyAddress.currentState!.validate()) {
          return;
        }
        currentStep(currentStep.value + 1);
      } else if (currentStep.value == 2) {
        if (!formKeyVehicle.currentState!.validate()) {
          return;
        } else if (fileDocumentVehicle.value == null) {
          txtErrorDocumentVehicle.value = "Documento do carro é obrigatório";
          return;
        }else if (fileProfile.value == null) {
          txtErrorProfile.value = "Foto de perfil é obrigatório";
          return;
        }


        String cpfFormatted = textEditingControllerIdentifier.text
            .replaceAll(".", "")
            .replaceAll("-", "");

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
          null, 
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
          type: "CLIENT",
          address: address,
          vehicle: vehicle,
        );

        clientService.create(user, fileDocumentVehicle.value!,fileProfile.value!, context, loadingBtn);
      }
    }
  }


  void getService(){
    
  }

  void onStepCancel() {
    if (currentStep.value == 0) {
      Get.back();
    } else if (currentStep.value > 0) {
      currentStep(currentStep.value - 1);
    }
  }
}
