import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../database/note.dart';
import '../database/notes_database.dart';
import '../screens/today_list.dart';
import '../widget/change_language_style.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';
import 'package:sqflite/sqflite.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Note> notes = [];
  int count = 2;

  List<int> todoCardControll = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    refreshNotes();
    super.didChangeDependencies();
  }

  Future refreshNotes() async {
    this.notes = await NotesDataBase.instance.readAllnotes();
    setState(() {});
  }

  Widget buildNotes_2() {
    return Column(
      children: notes.map((element) {
        return GestureDetector(
          onTap: () {
            Get.to(() => TodayList(element.title, element.id));
          },
          child: Container(
            margin: const EdgeInsets.only(left: 15, top: 20, right: 15),
            height: MediaQuery.of(context).size.height * 0.17,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 248, 248, 1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 40, left: 30),
                      child: Text(
                          // 'My new task'
                          element.title,
                          style: getcustomertextStyle(
                              context,
                              22,
                              FontWeight.w500,
                              const Color.fromRGBO(34, 53, 53, 1))),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Text(
                              DateFormat("dd/MM/yyyy")
                                  .format(element.createdDate),
                              style: getcustomertextStyle(
                                  context,
                                  12,
                                  FontWeight.normal,
                                  const Color.fromRGBO(34, 53, 53, 1))),
                          const Icon(Icons.calendar_today, size: 13)
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    // IconButton(
                    //   icon:const Icon(Icons.edit),
                    //     onPressed: (){
                    //       _showEditTitleDialog(element.id!);
                    //     }
                    //     ),
                    IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () async {
                          await NotesDataBase.instance.deleteNote(element.id!);
                          refreshNotes();
                        })
                  ],
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Future updateTitleVisit(int ID) async {
    Note visitTitle = notes.firstWhere((element) => ID == element.id);

    visitTitle = visitTitle.copy(title: newTitle);
    await NotesDataBase.instance.updateNote(visitTitle);
    refreshNotes();
  }

  String newTitle = '';

  _showEditTitleDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext ctx) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.white,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    // margin: const EdgeInsets.only(left: 10),
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: const Color.fromRGBO(236, 238, 244, 1)
                        // color:Colors.orange
                        ),
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          newTitle = text;
                        });
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!
                            .getTranslatedValue('add_title')
                            .toString(),
                        hintStyle: getcustomertextStyle(
                            context,
                            15,
                            FontWeight.normal,
                            const Color.fromRGBO(196, 198, 204, 1)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.63,
                        height: MediaQuery.of(context).size.height * 0.09,
                        child: RaisedButton(
                          color: const Color.fromRGBO(210, 140, 84, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onPressed: () {
                            Navigator.pop(ctx);
                            // updateTitleVisit(id);
                            newTitle.isEmpty ? null : addNote();
                          },
                          child: Text(
                            AppLocalizations.of(context)!
                                .getTranslatedValue('save_new_task')
                                .toString(),
                            style: getcustomertextStyle(
                                context, 15, FontWeight.bold, Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: notes == null
                  ? const Center(child: Text('No Notes'))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: LanguageEnglish(context) == 'English'
                                      ? 140
                                      : 130,
                                  top: 25,
                                  bottom: 15),
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  )),
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .getTranslatedValue('todo_list')
                                      .toString(),
                                  style: getcustomertextStyle(
                                      context,
                                      20,
                                      FontWeight.bold,
                                      const Color.fromRGBO(34, 53, 53, 1))),
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(() {
                              return TodayList(
                                  AppLocalizations.of(context)!
                                      .getTranslatedValue('today_visit_text')
                                      .toString(),
                                  0);
                            }),
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 15, top: 5, right: 15),
                              height: MediaQuery.of(context).size.height * 0.17,
                              width: MediaQuery.of(context).size.width * 0.95,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(248, 248, 248, 1),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 40, left: 30),
                                    child: Text(
                                        AppLocalizations.of(context)!
                                            .getTranslatedValue(
                                                'today_visit_text')
                                            .toString(),
                                        style: getcustomertextStyle(
                                            context,
                                            22,
                                            FontWeight.w500,
                                            const Color.fromRGBO(
                                                34, 53, 53, 1))),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: [
                                        Text(
                                            // '12/12/2021',
                                            DateFormat("dd/MM/yyyy")
                                                .format(DateTime.now()),
                                            style: getcustomertextStyle(
                                                context,
                                                12,
                                                FontWeight.normal,
                                                const Color.fromRGBO(
                                                    34, 53, 53, 1))),
                                        const Icon(Icons.calendar_today,
                                            size: 13)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          buildNotes_2(),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  _showEditTitleDialog();
                                  // addNote();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  height:
                                      MediaQuery.of(context).size.height * 0.17,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(248, 248, 248, 1),
                                    borderRadius: BorderRadius.circular(25),
                                    // color: Colors.red
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.add,
                                          size: 50,
                                          color: Color.fromRGBO(34, 53, 53, 1)),
                                      Text(
                                          AppLocalizations.of(context)!
                                              .getTranslatedValue(
                                                  'add_new_text')
                                              .toString(),
                                          style: getcustomertextStyle(
                                              context,
                                              17,
                                              FontWeight.normal,
                                              const Color.fromRGBO(
                                                  34, 53, 53, 1))),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(5),
    );
  }

  Future addNote() async {
    final note = Note(
      id: 2,
      title: newTitle,
      createdDate: DateTime.now(),
    );
    await NotesDataBase.instance.create(note);
    await refreshNotes();
  }
}
