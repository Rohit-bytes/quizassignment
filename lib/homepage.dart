import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'package:quizassignment/model/quiz_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? title = "";
  List<Question>? questions = [];
  List<bool> isPressedList = [];
  List<Option>? globaloption;
  List<int?> selectedoptionids=[];
  bool optionfinal=false; 
   List<bool> showSolutionList = [];
        



  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.jsonserve.com/Uw5CrX'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final apiResquiz = Quizmodel.fromJson(data);
       
        

        setState(() {
         
          title = apiResquiz.title;
          questions = apiResquiz.questions;
          
          
          isPressedList =
              List<bool>.filled(apiResquiz.questions?.length ?? 0, false);
// List<T>.filled(int length, T fillValue, {bool growable = false});

             selectedoptionids=   List<int?>.filled(apiResquiz.questions?.length ?? 1, null);
             showSolutionList =
              List<bool>.filled(apiResquiz.questions?.length ?? 1, false);
             });
        print('API response: $data');
      } else {
        print('API not found');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      appBar: AppBar(
        bottomOpacity: 1,
        bottom:  PreferredSize(
            preferredSize: Size.fromHeight(6.0), // Thickness of the line
            child: Container(
              color: Colors.black, // Color of the line
              height: 3.0, // Height of the line
            ),
          ),
        backgroundColor:  Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
       

  Icon(Ionicons.menu,weight: 20,),
            Container(
              
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: BoxDecoration(
                boxShadow:  [BoxShadow(
                color: Color.fromARGB(255, 210, 187, 13), // Shadow color
                offset: Offset(5, 4), // Shadow offset (x: right, y: down)
               // Softness of the shadow
                spreadRadius: 2, // Spread radius
              ),],
                color: const Color.fromARGB(255, 246, 225, 4),borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: Colors.black)),
              child: Text(
               'Quiz: ${  title }',
                style: const TextStyle(color: Colors.black,fontSize: 12),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: questions != null && questions!.isNotEmpty
          ? Container(
            color: const Color.fromARGB(58, 210, 224, 8),
            child: ListView.builder(
                itemCount: questions!.length,
                itemBuilder: (context, index) {
                  final question = questions![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Icon(
                            //   Ionicons.extension_puzzle_sharp,
                            //   size: 25,
                            //   color: Colors.red,
                            // ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                question.description ?? 'No description',
                                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 112, 78, 65)),
                              ),
                            ),
                          ],
                        ),
                       
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                             showSolutionList[index]?
                            ElevatedButton(
                              style: ButtonStyle().copyWith(
                                side:WidgetStateProperty.all(BorderSide(color: Colors.black)),
            
                                backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 255, 73, 73)
            
                                
                                ),
                                minimumSize: WidgetStateProperty.all(Size(100, 30)),
                              ),
                              onPressed: () {
                                setState(() {
                                  isPressedList[index] = !isPressedList[index];
                                });
                              },
                              child: Row(
                                children: [
                                  Text(isPressedList[index] ? 'Hide' : 'Answer',style: TextStyle(color: Colors.white),),
                                  SizedBox(width: 10,),
                                  Icon(Ionicons.star,color: Colors.amberAccent,)
                                ],
                              ),
                            ):Container()
                          ],
                        ),

                        //if iscorrect==false than show this other wise dont show
                      
                       isPressedList[index]?
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              question.detailedSolution ?? "No solution",
                              style: const TextStyle(fontStyle: FontStyle.italic),
                            ),
                          )
                     
                     :Container() ,


                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          
                          child: Column(
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: question.options.map((option){
                                final isSelected = selectedoptionids[index]==option.id;
                                final iscorrect = option.isCorrect?? false;
            return Padding(padding: EdgeInsets.all(10),
            child: GestureDetector(

              onTap: (){
                setState(() {
                    selectedoptionids[index] = option.id;
                   optionfinal = !(option.isCorrect ?? false);
                   showSolutionList[index]=!iscorrect;
                });
              
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                     boxShadow:  [BoxShadow(
                color: isSelected? ( iscorrect?  const Color.fromARGB(255, 22, 178, 28):const Color.fromARGB(255, 148, 13, 3)):Color.fromARGB(255, 210, 187, 13), // Shadow color
                offset: Offset(5, 4), // Shadow offset (x: right, y: down)
               // Softness of the shadow
                spreadRadius: 2, // Spread radius
              ),],
                  borderRadius: BorderRadius.circular(10),color:isSelected? ( iscorrect?  const Color.fromARGB(255, 82, 254, 88):const Color.fromARGB(255, 244, 21, 21)):const Color.fromARGB(255, 255, 255, 0)),
                width: double.infinity,
                
                child: Center(child: Text(option.description??"no option"))),
            ),);
            
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
          )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
