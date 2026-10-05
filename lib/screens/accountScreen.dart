import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nectar/customWidgets/CustomCardAccount.dart';

class accountScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
         backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),


      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(226, 226, 226, 1)
                      )
                    ),
                  ) ,

                  child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color.fromRGBO(242, 243, 242, 1),
                        foregroundColor: const Color.fromRGBO(83, 177, 117, 1),
                        radius: 27.r,
                        child: Icon(Icons.person_2_outlined , size: 40,),
                        )
                      ,
                    
                        title: Text("" , style: TextStyle( // UserName
                          color: Colors.black,
                          fontSize: 20.sp ,
                          fontWeight: FontWeight.bold,
                        ),),
                    
                        subtitle: Text("" , style: TextStyle( // Email@.com
                          color: Color.fromRGBO(124, 124, 124, 1),
                          fontSize: 16
                        ),),
                    ),

                    SizedBox(height: 20.h,)
                  ],
                ),
                ),
                
                CustomCardAccount(myIcon: Icons.shopping_bag_outlined, title: "Orders", onPressed: (){}),

               

                CustomCardAccount(myIcon: Icons.location_on_outlined, title: "Delivery Address" , onPressed: (){
                  showDialog(
                    context: context,
                     builder: (context){
                      return Dialog(
                        insetPadding: EdgeInsets.all(20),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                        
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: ()=> Navigator.pop(context)
                                            , icon: Icon(Icons.close)
                                    ),
                                    SizedBox(width: 10.w,),

                                    Text("Location" , style: TextStyle(
                                      color: Colors.black87 ,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp
                                    ),) ,
                                ],
                              ),

                                SizedBox(height: 10.h,),

                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                                  child: Row(
                                    children: [
                                      Text("Your Current location : " , style: TextStyle(
                                        color : Colors.black, 
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold
                                      ),),
                                      Text(" " , style: TextStyle( // User Location
                                        color : const Color.fromARGB(157, 158, 158, 158),
                                        fontSize: 14.sp,
                                      ),)
                                    ],
                                  ),
                                )
                            ]
                          )
                        )
                      );                      
                      
                     });
                },),

                CustomCardAccount(myIcon: Icons.help_outline, title: "Help" , onPressed: (){
                  showDialog(
                    context: context,
                     builder: (context){
                      return Dialog(
                        insetPadding: EdgeInsets.all(20),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                        
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: ()=> Navigator.pop(context)
                                            , icon: Icon(Icons.close)
                                    ),
                                    SizedBox(width: 10.w,),

                                    Text("Help & Support" , style: TextStyle(
                                      color: Colors.black87 ,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp
                                    ),)
                                ],
                              ),

                                SizedBox(height: 10.h,),

                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("How can we help you?" , 
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),),

                                    SizedBox(height: 8.h),
                                  Text(
                                    "If you have any issues with your order, payment, or delivery, please contact our support team:",
                                    style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                                  ),
                                  SizedBox(height: 12.h),
                                  Text("📧 support@nectar.com", style: TextStyle(fontWeight: FontWeight.w600)),
                                  SizedBox(height: 4.h),
                                  Text("📞 +123 456 789", style: TextStyle(fontWeight: FontWeight.w600)),
                                  ],
                                ))
                            ],
                          ),
                        ),
                      );
                     });
                },),

                CustomCardAccount(myIcon: Icons.info_outline, title: "About" , onPressed: (){
                   showDialog(
                    context: context,
                     builder: (context){
                      return Dialog(
                        insetPadding: EdgeInsets.all(20),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                        
                            children: [
                              Row(
                                children: [
                                  IconButton(onPressed: ()=> Navigator.pop(context)
                                            , icon: Icon(Icons.close)
                                    ),
                                    SizedBox(width: 10.w,),

                                    Text("About Nectar" , style: TextStyle(
                                      color: Colors.black87 ,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp
                                    ),)
                                ],
                              ),

                                SizedBox(height: 10.h,),

                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Nectar 🥕" , style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green
                                    ),) ,


                                    Text("Nectar is your go-to app for fresh groceries and daily essentials, delivered directly to your doorstep with speed and care." , 
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),),

                                    SizedBox(height: 8.h),

                                    Text(
                                      "Version: 1.0.0",
                                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                                    ),
                                  ],
                                )),

                            ],
            
                          ),
                        ),
                      );
                },);
              }
              ) ,

              SizedBox(height: 50.h,),

        Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
            
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(242, 243, 242, 1),
              borderRadius: BorderRadius.circular(20.r)
            ),
            child: MaterialButton(
              onPressed: ()=>{
               
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)
              ),
              padding: EdgeInsets.symmetric(vertical: 5.h , horizontal: 20.w),
              height: 50.h,
              child: Row(
                
                children: [
                  Icon(Icons.exit_to_app , color: Color.fromRGBO(83, 177, 117, 1)),

                  SizedBox(width: 80.w,),

                  Text("Log Out" , style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(83, 177, 117, 1)
                  ),),
                ],
              )
            ),
          ),
              ],
          ),
      ),
    );
  }
}

