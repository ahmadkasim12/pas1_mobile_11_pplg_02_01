import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/login_api/LoginController.dart';
import '../../widgets/MyTextButton.dart';
import '../../widgets/MyTextField.dart';

class RegistrarMobile extends StatelessWidget {
  const RegistrarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    var username = TextEditingController().obs;
    var password = TextEditingController().obs;
    var fullname = TextEditingController().obs;
    var email = TextEditingController().obs;
    var errorHandler = false.obs;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Registrar", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: Colors.white)),
              SizedBox(height: 10,),
              Text("In order to use our service, one must fulfill our requirement to have at the very least one account to use", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white60)),
              SizedBox(height: 30,),
              MyTextField(hasLabel: true, controller: fullname.value, label: "Full Name", isPassword: false, prefixIcon: Icon(Icons.person),),
              SizedBox(height: 10,),
              MyTextField(hasLabel: true, controller: username.value, label: "Username", isPassword: false, prefixIcon: Icon(Icons.alternate_email)),
              SizedBox(height: 10,),
              MyTextField(hasLabel: true, controller: email.value, label: "Email", isPassword: false, prefixIcon: Icon(Icons.email)),
              SizedBox(height: 10,),
              MyTextField(hasLabel: true, controller: password.value, label: "Password", isPassword: true,),
              Obx(() {
                return Column(
                  children: [
                    errorHandler.value ? SizedBox(height: 10,) : SizedBox(),
                    errorHandler.value ? Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.redAccent,),
                        Text(" One or more field above is missing.", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.redAccent)),
                      ],
                    ) : SizedBox()
                  ],
                );
              }),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text("Already have an account? ", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white60)),
                  InkWell(
                      onTap: () {
                        Get.toNamed('/login');
                      },
                      child: Text("Log in here", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white))
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Obx(() {
                return SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: MyTextButton(
                      isLoading: loginController.isLoading.value,
                      text: "Registrar",
                      onTap: () async {
                        errorHandler.value = false;
                        await loginController.register(username.value.text, password.value.text, fullname.value.text, email.value.text);
                        if(loginController.authStatus.value == true){
                          print("Register successful");
                          loginController.authStatus.value = false;
                          loginController.isLoading.value = false;
                          Get.toNamed('/login');
                        }
                        else if(loginController.authStatus.value == false){
                          errorHandler.value = true;
                          print("Register attempt failed");
                        }
                        else{
                          print("Error while attempting to register");
                        }
                      },)
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
