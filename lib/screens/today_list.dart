import 'package:flutter/material.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../database/note.dart';
import '../database/notes_database.dart';
import '../widget/change_language_style.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';
import '../widget/todo_field.dart';
import '../main.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodayList extends StatefulWidget {
  final String title;
  final int? id;

  TodayList(this.title, this.id);

  @override
  _TodayListState createState() => _TodayListState(title, id);
}

class _TodayListState extends State<TodayList> {
  final String Containertitle;
  final int? today_id;
  _TodayListState(this.Containertitle, this.today_id);
  List<TodatVisit> newVisit = [];
  bool isClicked = false;

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
                        hintText:
                            // 'Title...'؟
                            AppLocalizations.of(context)!
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
                            newTitle.isEmpty ? null : addVisit();
                          },
                          child: Text(
                            // 'Save',
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

  Widget buildCard_2() {
    return SingleChildScrollView(
      child: Column(
        children: newVisit.map((element) {
          // in iconPosition = element.title.length ;
          return element.today_id == today_id
              ? GestureDetector(
                  onTap: () {
                    refreshVisits();
                    isClicked = true;
                    // _showEditTitleDialog (element.id!);
                  },
                  child: Slidable(
                    actionPane: const SlidableDrawerActionPane(),
                    // actions: [
                    //   Container(
                    //     margin: const EdgeInsets.only(left: 10),
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(13)),
                    //     height: MediaQuery.of(context).size.height * 0.08,
                    //     width: MediaQuery.of(context).size.width * 0.02,
                    //     child: IconSlideAction(
                    //       onTap: () {
                    //         // _showEditTitleDialog(element.id!);
                    //       },
                    //       icon: Icons.edit,
                    //       caption: 'Edit',
                    //       color: const Color.fromRGBO(210, 140, 84, 1),
                    //     ),
                    //   )
                    // ],
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(248, 248, 248, 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Text(
                              element.title.length < 30
                                  ? element.title
                                  : element.title.replaceRange(
                                      30, element.title.length, '...'),
                              style: getcustomertextStyle(
                                  context,
                                  14,
                                  FontWeight.w500,
                                  const Color.fromRGBO(34, 53, 53, 1))),
                          const Spacer(),
                          InkWell(
                            onTap: () async {
                              await NotesDataBase.instance
                                  .deleteVisit(element.id!);
                              refreshVisits();
                            },
                            child: Container(
                                // padding: EdgeInsets.only(
                                //     left: element.title.length < 30 ? 150:30 ,
                                //     bottom: 10),
                                child: const Icon(Icons.close, size: 20)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container();
        }).toList(),
      ),
    );
  }

  Widget buildAddCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            // addVisit();
            _showEditTitleDialog();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 15, top: 10),
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 248, 248, 1),
              borderRadius: BorderRadius.circular(25),
              // color: Colors.red
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add,
                    size: 40, color: Color.fromRGBO(34, 53, 53, 1)),
                Text(
                    AppLocalizations.of(context)!
                        .getTranslatedValue('add_new_text')
                        .toString(),
                    style: getcustomertextStyle(context, 15, FontWeight.normal,
                        const Color.fromRGBO(34, 53, 53, 1)))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future refreshVisits() async {
    this.newVisit = await NotesDataBase.instance.readAllnewvisits();
    setState(() {});
  }

  String newTitle = '';
  // await updateProductToCar(element.id! , true);
  Future updateTitleVisit(int ID) async {
    TodatVisit visitTitle = newVisit.firstWhere((element) => ID == element.id);

    visitTitle = visitTitle.CopyVisit(title: newTitle);
    await NotesDataBase.instance.updateVsist(visitTitle);
    refreshVisits();
  }

  @override
  void didChangeDependencies() {
    refreshVisits();
    super.didChangeDependencies();
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
              padding: const EdgeInsets.only(top: 25),
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Text(Containertitle,
                  style: getcustomertextStyle(context, 22, FontWeight.bold,
                      const Color.fromRGBO(34, 53, 53, 1))),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.68,
                padding: EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(color: Colors.white),
                child: newVisit == null
                    ? const Center(child: Text('No visits'))
                    : SingleChildScrollView(
                        child: Column(
                          children: [buildCard_2(), buildAddCard()],
                        ),
                      )),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(5),
    );
  }

  Future addVisit() async {
    final newvisit = TodatVisit(
      title: newTitle,
      today_id: today_id!,
    );
    await NotesDataBase.instance.createnewVisit(newvisit);
    await refreshVisits();
  }
}
