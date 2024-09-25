import 'package:flutter/material.dart';
import 'package:yesnomaybe/config/helpers/get_yes_no_answer.dart';
import 'package:yesnomaybe/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [
    Message(text: 'hola soy ella', fromWho: FromWho.mine),
    Message(text: 'ya regresaste del trabajo?', fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    if (text.isNotEmpty) {
      messageList.add(newMessage);
      if (text.endsWith('?')) {
        herReply();
      }
      notifyListeners();
      moveScrollTuBottom();
    }
  }

  void moveScrollTuBottom() {
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollTuBottom();
  }
}
