import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Practice 01',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final roll = TextEditingController();
  final reg = TextEditingController();
  final phone = TextEditingController();
  final about = TextEditingController();

  String? bloodGroup;
  String gender = "Male";

  Map<String, String>? result;

  void submit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        result = {
          "Name": name.text,
          "Roll": roll.text,
          "Reg No": reg.text,
          "Blood": bloodGroup ?? "-",
          "Gender": gender,
          "Phone": phone.text,
          "About": about.text,
        };
      });

      name.clear();
      roll.clear();
      reg.clear();
      phone.clear();
      about.clear();

      setState(() {
        bloodGroup = null;
        gender = "Male";
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Submitted Successfully")));
    }
  }

  InputDecoration boxStyle(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffeef2ff), Color(0xfff8fafc)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // HEADER
                  const Text(
                    "Student Form",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // FORM CARD
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: name,
                              decoration: boxStyle("Name"),
                              validator: (v) =>
                                  v!.isEmpty ? "Enter name" : null,
                            ),

                            const SizedBox(height: 12),

                            // ROW (REQUIRED DESIGN PART)
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: roll,
                                    decoration: boxStyle("Roll"),
                                    validator: (v) =>
                                        v!.isEmpty ? "Enter roll" : null,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextFormField(
                                    controller: reg,
                                    decoration: boxStyle("Reg No"),
                                    validator: (v) =>
                                        v!.isEmpty ? "Enter reg" : null,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            DropdownButtonFormField<String>(
                              value: bloodGroup,
                              decoration: boxStyle("Blood Group"),
                              items:
                                  [
                                        "A+",
                                        "A-",
                                        "B+",
                                        "B-",
                                        "O+",
                                        "O-",
                                        "AB+",
                                        "AB-",
                                      ]
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (v) {
                                setState(() => bloodGroup = v);
                              },
                            ),

                            const SizedBox(height: 12),

                            Row(
                              children: [
                                const Text("Gender: "),
                                Radio(
                                  value: "Male",
                                  groupValue: gender,
                                  onChanged: (v) => setState(() => gender = v!),
                                ),
                                const Text("Male"),
                                Radio(
                                  value: "Female",
                                  groupValue: gender,
                                  onChanged: (v) => setState(() => gender = v!),
                                ),
                                const Text("Female"),
                              ],
                            ),

                            const SizedBox(height: 12),

                            TextFormField(
                              controller: phone,
                              decoration: boxStyle("Phone"),
                            ),

                            const SizedBox(height: 12),

                            TextFormField(
                              controller: about,
                              maxLines: 3,
                              decoration: boxStyle("About Me"),
                            ),

                            const SizedBox(height: 18),

                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: submit,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: Colors.indigo,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text("Submit"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // RESULT CARD
                  if (result != null)
                    Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Submitted Data",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(),

                            ...result!.entries.map(
                              (e) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: Text(
                                  "${e.key}: ${e.value}",
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
