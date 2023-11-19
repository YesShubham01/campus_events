import 'package:campus_events/Pages/Hidden%20Drawer/custom_drawer.dart';
import 'package:campus_events/Services/FireStore%20Services/firestore.dart';
import 'package:flutter/material.dart';

class DetailForm extends StatefulWidget {
  const DetailForm({Key? key}) : super(key: key);

  @override
  _DetailFormState createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  // Create controllers for each TextFormField
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _graduationYearController =
      TextEditingController();

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
              controller: _nameController,
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              label: 'Phone number',
              hintText: 'Enter your phone number',
              keyboardType: TextInputType.phone,
              controller: _phoneController,
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              label: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              label: 'Roll no.',
              hintText: 'Enter your roll number',
              controller: _rollNoController,
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              label: 'Branch',
              hintText: 'Enter your branch',
              controller: _branchController,
            ),
            const SizedBox(height: 16),
            _buildTextFormField(
              label: 'Graduation Year',
              hintText: 'Enter your graduation year',
              keyboardType: TextInputType.number,
              controller: _graduationYearController,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement your form submission logic here
                // Access the values using the controllers
                String name = _nameController.text;
                String phone = _phoneController.text;
                String email = _emailController.text;
                String rollNo = _rollNoController.text;
                String branch = _branchController.text;
                String graduationYear = _graduationYearController.text;

                // You can use these values as needed, for example, send them to the server
                // or perform any other actions.
                // For now, let's print them.
                FireStore.saveUserDataToFirestore(
                    name, phone, email, rollNo, branch, graduationYear);
                print('Name: $name');
                print('Phone: $phone');
                print('Email: $email');
                print('Roll No: $rollNo');
                print('Branch: $branch');
                print('Graduation Year: $graduationYear');

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
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        filled: true,
        fillColor: const Color.fromARGB(255, 126, 143, 239),
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

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _rollNoController.dispose();
    _branchController.dispose();
    _graduationYearController.dispose();
    super.dispose();
  }
}
