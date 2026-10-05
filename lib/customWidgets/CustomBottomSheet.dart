import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:nectar/customWidgets/CustomErrorMessage.dart';
import 'package:nectar/screens/orderAcceptedScreen.dart';

class CustomBottomSheet extends StatefulWidget {
   new({
    super.key,
    required this.totalCost
  });

     final double? totalCost;
  

  @override 
  State<CustomBottomSheet> createState()=> _CustomBottomSheetState(); }


class _CustomBottomSheetState extends State<CustomBottomSheet>{

TextEditingController MasterCardController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();
String? DeliveryChoice;
double currentTotalCost = 0.0;


@override 
void dispose(){
  MasterCardController.dispose();
  super.dispose();
}

  @override
  void initState(){
    super.initState();
    currentTotalCost = widget.totalCost ?? 0.0;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.h , horizontal: 15.w),
      height: 450.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 243, 242, 1),
        borderRadius: BorderRadius.circular(30.r)
      ),
    
      child: ListView(
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(226, 226, 226, 0.7)
                  )
                )
              ),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Checkout" , style: TextStyle(
                    fontSize: 24.sp,
                    color: Color.fromRGBO(24, 23, 37, 1),
                    fontWeight: FontWeight.w600
                  ),), 
              
                  
                   IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    } ,
              
                    icon: Icon(Icons.close ,color: Color.fromRGBO(24, 23, 37, 1) , size: 24),
                    ), 
                    ]
              ),
            ),
        
            // delivery
           Container(
            padding: EdgeInsets.symmetric(vertical: 10.h ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(226, 226, 226, 0.7)
                  )
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Delivery" , style: TextStyle(
                    fontSize: 17.sp,
                    color: Color.fromRGBO(124, 124, 124, 1),
                    fontWeight: FontWeight.w600
                  ),), 
              
                  
                   Row(
                     children: [
                       Text("Select Method" , style: TextStyle(
                        fontSize: 16.sp,
                        color: Color.fromRGBO(24, 23, 37, 1),
                        fontWeight: FontWeight.w600
                       ),)
                       ,
                       IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          showDialog(context: context, 
                          builder: (context){
                            return  StatefulBuilder(
                                  builder: (context , setStateDialog){

                                   return Dialog(
                                   backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                                   insetPadding: EdgeInsets.all(30),
                                   child: Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child : Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        IconButton(onPressed: ()=> Navigator.pop(context)
                                        , icon: Icon(Icons.close)
                                        ) ,
                                         
                                         Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10 , ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 9.h,),
                                               Text("Choose: " , style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                              ),),
                              
                                              SizedBox(height: 9.h,),
                              
                                              RadioListTile(
                                                title: Text("Regular Delivery" , style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w500
                                                ),),
                                                subtitle: Text("Recieve your Order in 30-45 min , for \$2"),
                                                value: "Regular Delivery",
                                                activeColor: Colors.green,
                                                groupValue: DeliveryChoice,
                                                onChanged: (value){
                                                  setStateDialog(() {
                                                    DeliveryChoice = value;
                                                  }); 

                                                  setState(() {
                                                    currentTotalCost = (widget.totalCost ?? 0.0) + 2.0;
                                                  });
                                                },                                              
                                                ) ,
                              
                                                RadioListTile(
                                                title: Text("Express Delivery" , style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red
                                                ), ),
                                                subtitle: Text("Recieve your Order in 15-20 min , for \$5"),
                                                value: "Express Delivery",
                                                activeColor: Colors.red,
                                                groupValue: DeliveryChoice,
                                                onChanged: (value){
                                                  setStateDialog(() {
                                                    DeliveryChoice = value;
                                                  });

                                                  setState(() {
                                                    currentTotalCost = (widget.totalCost ?? 0.0) + 5.0;
                                                  });
                                                },                                              
                                                ) ,

                                                SizedBox(height: 10.h,)
                                            ],
                                          )),
                              
                                      ]
                                    )
                                )
                              );}
                            );
                          });
                        } ,
                                               
                        icon: Icon(Icons.arrow_forward_ios ,color: Color.fromRGBO(24, 23, 37, 1) , size: 16.r),
                        ),
                     ],
                   ), 
                    ]
              ),
            ),
        
        
            Container(
            padding: EdgeInsets.symmetric(vertical: 10.h ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(226, 226, 226, 0.7)
                  )
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment" , style: TextStyle(
                    fontSize: 17.sp,
                    color: Color.fromRGBO(124, 124, 124, 1),
                    fontWeight: FontWeight.w600
                  ),), 
              
                  
                   Row(
                    mainAxisSize: MainAxisSize.min,
                     children: [
                       Image.asset("assets/icons/card.png" , width: 21.614089965820312.w, height: 16.h,
                       fit: BoxFit.contain,
                       ) ,
        
                    
                       
                       IconButton(
                        onPressed: (){
                          showDialog(context: context, 
                          builder: (context){
                            return Form(
                              key: formKey,
                              child: Dialog(
                                 backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                                 insetPadding: EdgeInsets.all(30),
                                 child: Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      IconButton(onPressed: ()=> Navigator.pop(context)
                                      , icon: Icon(Icons.close)
                                      ),
                              
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              maxLength: 16,
                                              keyboardType: TextInputType.number,
                                              controller: MasterCardController,
                                              validator: (value) {
                                                if(value == null || value.trim().isEmpty){
                                                  return "Field can't be Empty !";
                                                }

                                                if(value.trim().length < 16){
                                                  return "Number can't be less than 16";
                                                }
                                              },
                                               decoration: InputDecoration(
                                                suffix: Image.asset("assets/icons/card.png"),
                                                label: Text("MasterCard number:"), 
                                              ),
                                            
                                            ),

                                            SizedBox(height: 10.h,),
                              
                                            Container(
                                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                                                
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(83, 177, 117, 1),
                                                  borderRadius: BorderRadius.circular(20)
                                                ),
                              
                              
                                                child: MaterialButton(
                              
                                                  onPressed: ()=>{

                                                    if(formKey.currentState!.validate()){
                                                    Navigator.pop(context),}

                                                   

                              
                                                  },
                              
                              
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20)
                                                  ),
                                                  padding: EdgeInsets.symmetric(vertical: 5),
                                                  height: 60.h,
                              
                                                  
                                                  child: Text("Save" , style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(255, 249, 255, 1)
                                                  ),)
                                                ),
                                              ),
                                          ],
                                        ),
                              
                                        
                                      )
                                    ],
                                  )
                                 ),
                              ),
                            );
                          });
                        } ,
                                               
                        icon : Icon(Icons.arrow_forward_ios ,color: Color.fromRGBO(24, 23, 37, 1) , size: 16.r),
                        ),
                     ],
                   ), 
                    ]
              ),
            ),
        
         
            Container(
            padding: EdgeInsets.symmetric(vertical: 10.h ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(226, 226, 226, 0.7)
                  )
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Cost" , style: TextStyle(
                    fontSize: 17.sp,
                    color: Color.fromRGBO(124, 124, 124, 1),
                    fontWeight: FontWeight.w600
                  ),), 
              
                  
                   Row(
                    mainAxisSize: MainAxisSize.min,
                     children: [
                        Text("\$${currentTotalCost}" , style: TextStyle(
                        fontSize: 16.sp,
                        color: Color.fromRGBO(24, 23, 37, 1),
                        fontWeight: FontWeight.w600
                       ),),
        
                    
                       
                       IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          showDialog(context: context,
                           builder: (context){
                            return Dialog(
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.close)
                                        ),

                                        SizedBox(height: 10.h,),

                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Order Cost : " , style: TextStyle(
                                                    color: Colors.black ,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16
                                                  ),),

                                                    SizedBox(width: 8.h,), 

                                                  Text("\$${widget.totalCost}" , style: TextStyle(
                                                    fontSize: 16
                                                  ),) ,
                                                ],
                                              ),

                                              SizedBox(height: 20.h,),

                                              Row(
                                                children: [
                                                  Text("Total Cost : " , style: TextStyle(
                                                    color: Colors.black ,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16
                                                  ),),

                                                      SizedBox(width: 8.h,), 

                                                   Text("\$$currentTotalCost" , style: TextStyle(
                                                    fontSize: 16
                                                  ),)
                                                ],
                                              ),

                                              SizedBox(height: 15.h,),

                                              Text("Note: " , style: TextStyle(
                                                color: const Color.fromARGB(151, 87, 86, 86),
                                                fontWeight: FontWeight.bold
                                              )),

                                             Text("   \$2 for Regular Delivery" , style: TextStyle(
                                                color: const Color.fromARGB(151, 87, 86, 86),
                                                fontWeight: FontWeight.bold
                                              )),

                                              Text("   \$5 for Express Delivery" , style: TextStyle(
                                                color: const Color.fromARGB(151, 87, 86, 86),
                                                fontWeight: FontWeight.bold
                                              )),
                                            ],
                                          ))
                                    ]
                                  ),
                                ),
                              );
                            
                           });
                        } ,
                                               
                        icon : Icon(Icons.arrow_forward_ios ,color: Color.fromRGBO(24, 23, 37, 1) , size: 16.r),
                        ),
                     ],
                   ), 
                    ]
              ),
            ),
        
              SizedBox(height: 20.h,),
        
        
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text("By placing an order you agree to our" ,
                style: TextStyle(
                  color: Color.fromRGBO(124, 124, 124, 1),
                  fontWeight: FontWeight.w600
                ),
                ),
             ],
           ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
        
                 
                Text("Terms" ,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600
                ),
                ), 
        
                 Text(" And " ,
                  style: TextStyle(
                    color: Color.fromRGBO(124, 124, 124, 1),
                    fontWeight: FontWeight.w600
                  ),
                  ),
        
                  Text("Conditions" ,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),
                ), 
        
              ],
            ) ,
    
            SizedBox(height: 26.5.h),
        
             Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
              
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(83, 177, 117, 1),
                borderRadius: BorderRadius.circular(20)
              ),


              child: MaterialButton(

                onPressed: ()=>{
                  if((MasterCardController.text.startsWith('51') || MasterCardController.text.startsWith('55')) && DeliveryChoice != null){
                    Navigator.pushReplacement(context , MaterialPageRoute(builder: (context)=> OrderAcceptedScreen()))
                  }
                    else{
                    Navigator.push(context , MaterialPageRoute(builder: (context) => CustomErrorMessage()))
                  }
                },


                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                padding: EdgeInsets.symmetric(vertical: 5),
                height: 67,

                
                child: Text("Place Order" , style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(255, 249, 255, 1)
                ),)
              ),
            ),
           
          ],
        ),]
      ),
    );
  }
}