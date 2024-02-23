import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../apiservice/apiservice.dart';
import '../model/model.dart';

class ProductAddPage extends StatefulWidget {
  @override
  _ProductAddPageState createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  final nameController = TextEditingController();
  final updateController = TextEditingController();
  final assignedController = TextEditingController();
  final techController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Project Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter project name',
              ),
              controller: nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter project name';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
              'Assigned Engineer',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: assignedController,
              decoration: InputDecoration(
                hintText: 'Enter assigned engineer name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter assigned engineer name';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
              'Start Date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              onTap: () {
                _selectDate(context);
              },
              readOnly: true,
              controller: TextEditingController(
                  text: '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}'),
              decoration: InputDecoration(
                hintText: 'Select start date',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'End Date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              onTap: () {
                _selectEndDate(context);
              },
              readOnly: true,
              controller: TextEditingController(
                  text: '${_endDate.year}-${_endDate.month}-${_endDate.day}'),
              decoration: InputDecoration(
                hintText: 'Select end date',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Project Update',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: updateController,
              decoration: InputDecoration(
                hintText: 'Enter project update',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter project update';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
              'Assigned Technician',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: techController,
              decoration: InputDecoration(
                hintText: 'Enter assigned technician name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter assigned technician name';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final data = Project();
                 final data = {
                   "start_date": _selectDate,
                   "end_date": _endDate,
                   "project_name": nameController.text,
                   "project_update": updateController.text,
                   "assigned_engineer": assignedController.text,
                   "assigned_technician": techController.text
                 };
                 ProjectService.addProject(data);
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate)
      setState(() {
        _endDate = picked;
      });
  }
}