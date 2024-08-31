import 'package:flutter/material.dart';
import 'package:flutter_monetization_course/extensions/string_extension.dart';
import 'package:flutter_monetization_course/model/question.dart';
import 'package:intl/intl.dart';

class QuestionCard extends StatelessWidget {
  final Question _question;

  QuestionCard(this._question);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text("Should I ${_question.query}?"),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(_question.answer!.capitalize(),
                      style: Theme.of(context).textTheme.titleLarge),
                  Spacer(),
                  Text(
                      "${DateFormat('MM/dd/yyyy').format(_question.created!).toString()}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
