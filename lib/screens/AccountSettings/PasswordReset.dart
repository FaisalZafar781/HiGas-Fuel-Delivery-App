import 'package:flutter/material.dart';
import 'package:hi_gas/services/utils/constants/constants.dart';
import 'package:hi_gas/widgets/ActionButton/action_button.dart';
import 'package:hi_gas/widgets/CustomTextField/custom_textfield.dart';
import 'package:hi_gas/widgets/PrimaryButton/CustomPrimaryButton.dart';
import 'package:hi_gas/widgets/RoundedContainer/rounded_container.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRoundedContainer(
              onTap: () => Navigator.pop(context),
              radius: 100,
              padding: EdgeInsets.all(8),
              backgroundColor: AppColors.containerBorderColor,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Current Password Field
            const PasswordField(hintText: 'Current Password'),

            const SizedBox(height: 16),

            // New Password Field
            const PasswordField(hintText: 'Choose a strong password'),

            const SizedBox(height: 16),

            // Re-enter Password Field
            const PasswordField(
              hintText: 'Re-enter Password',
            ),

            const SizedBox(height: 10),

            const Spacer(),

            // Continue Button
            Text(
              "Password must be 8 characters long.\nPlease use alphanumeric characters.",
              style: TextStyle(
                  fontSize: 12,
                  color: AppColors.description,
                  fontFamily: AppFontsFamily.spaceGrotesk),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ActionButton(
                text: 'Reset',
                borderRadius: 30,
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
                borderColor: Colors.transparent,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String hintText;

  const PasswordField({super.key, required this.hintText});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomField(
      controller: _controller,
      hintText: widget.hintText,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: Colors.grey,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        return null;
      },
    );
  }
}
