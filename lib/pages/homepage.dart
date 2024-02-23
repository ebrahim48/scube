import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../apiservice/apiservice.dart';
import '../model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ProjectService.fetchAllProjects(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 170,
                    color: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('start_date: ${snapshot.data?[index].startDate}',
                            style: TextStyle(
                                fontSize: 18),
                          ),
                          Text('end_date: ${snapshot.data?[index].endDate}',
                            style: TextStyle(
                                fontSize: 18),
                          ),
                          Text('project_name: ${snapshot.data?[index].projectName}',
                            style: TextStyle(
                                fontSize: 18),
                          ),
                          Text('project_update: ${snapshot.data?[index].projectUpdate}',
                            style: TextStyle(
                                fontSize: 18),
                          ),
                          Text('assigned_engineer: ${snapshot.data?[index].assignedEngineer}',
                            style: TextStyle(
                                fontSize: 18),
                          ),
                          Text('assigned_technician: ${snapshot.data?[index].assignedTechnician}',
                            style: TextStyle(
                                fontSize: 18),
                          ),
                          Text('start_day_of_year: ${snapshot.data?[index].startDayOfYear}',
                            style: TextStyle(
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator(),);
        }
    );
  }
}
