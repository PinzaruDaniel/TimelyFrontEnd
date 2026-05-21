import 'package:get/get.dart';
import 'package:presentation/util/widgets/text_form_field_widget.dart';

class LoginController extends GetxController {
  Rx<TextFieldViewItem> emailViewItem = Rx(TextFieldViewItem());
  Rx<TextFieldViewItem> passwordViewItem = Rx(TextFieldViewItem(isPassword: true));
}
