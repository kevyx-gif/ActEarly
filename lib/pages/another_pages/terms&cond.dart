import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

//futures import
import 'package:actearly/utils/futures.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsScreen> createState() =>
      TermsAndConditionsScreenState();
}

class TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Términos y condiciones de uso de la aplicación \"ActEarly\"',
          style: TextStyle(fontSize: 25)),
      SizedBox(height: 10),
      Expanded(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text(
          "Last Updated: 24/07/2023 \nWelcome to ActEarly, an application that allows you to monitor the social, physical, and psychological progress of your baby from their early months up to 5 years of age. \nBefore using this application, please read and understand the following Terms and Conditions, as they constitute a legal agreement between you (the \"User\") and ActEarly. \n 1. Acceptance of Terms: \nBy using the ActEarly application, the User automatically and unconditionally accepts these Terms and Conditions. If the User does not agree with any aspect of these Terms, please refrain from using the application. \n2. Purpose of the Application: \nActEarly is a tool intended solely to enable users to track and monitor their baby\'s development and progress, including social, physical, and psychological aspects. The information provided by the application is based on user input and should not be considered as a professional medical diagnosis or advice.\n3. Responsible Use:\nThe User agrees to use the application responsibly and not to provide false, inaccurate, or misleading information. ActEarly shall not be held responsible for any errors or damages resulting from the User\'s information. \n4. Privacy and Data Protection: \nActEarly is committed to protecting the User\'s privacy. The information provided by the User in the application will be used in accordance with our Privacy Policy [link to the privacy policy]. The User\'s personal information will not be shared or sold to third parties without their explicit consent. \n5. User Responsibility: \nThe User is solely responsible for the accuracy and updating of the information provided in the application. ActEarly shall not be liable for any damages or losses arising from inaccurate or outdated information. \n6. Use of Anonymous Data: \nActEarly reserves the right to use aggregated and anonymized data for statistical, research, or application improvement purposes. This data will not contain personally identifiable information. \n7. Intellectual Property: \nThe ActEarly application, including its design, logo, content, and functionalities, are protected by intellectual property rights. The User agrees not to copy, modify, distribute, or use the protected elements without ActEarly\'s express permission. \n8. Modifications to the Application and Terms: \nActEarly reserves the right to modify or discontinue the application and its Terms and Conditions at any time. The User will be notified of significant changes to the Terms. The continued use of the application after such modifications will be considered as acceptance of the new Terms. \n9. Medical Disclaimer: \nThe User acknowledges that ActEarly does not replace professional medical care. A qualified healthcare professional should always be consulted for any health-related concerns or issues regarding the baby. \n10. Applicable Law: \nThese Terms and Conditions are governed by the laws of the country where the ActEarly application is used. \nBy using the ActEarly application, the User indicates that they have read and understood the Terms and Conditions and agree to comply with them in their entirety. If the User disagrees with these Terms, they must not use the application. \nIf you have any questions or concerns regarding these Terms and Conditions, please contact us at email@ads.cas.",
          style: TextStyle(fontSize: 17),
        ),
      )),
      IconButton(
          onPressed: () => {acceptTermsAndConditionsAccepted()},
          icon: Icon(
            Icons.circle,
            color: Colors.green,
          )),
      Text("Aceptar"),
    ]));
  }
}
