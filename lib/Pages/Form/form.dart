import 'package:campus_events/Pages/Hidden%20Drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class DetailForm extends StatelessWidget {
  const DetailForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 130,
      ),
      child: Form(
        // Use a GlobalKey<FormState> to access the form state
        // and perform form validation or other actions.
        key: GlobalKey<FormState>(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextFormField(
              label: 'Name',
              hintText: 'Enter your name',
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              label: 'Phone number',
              hintText: 'Enter your phone number',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              label: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              label: 'Roll no.',
              hintText: 'Enter your roll number',
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              label: 'Branch',
              hintText: 'Enter your branch',
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              label: 'Graduation Year',
              hintText: 'Enter your graduation year',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement your form submission logic here
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HiddenDrawer()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.deepPurple.shade300,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required String hintText,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        filled: true,
        fillColor: Colors.deepPurple.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(16.0),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}
