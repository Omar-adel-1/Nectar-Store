import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OrderAcceptedScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [Container(
          width: double.infinity,
          child: Stack(
            children: [
              Image.asset("assets/images/backGround.png" , fit: BoxFit.fill,),
              Positioned(child: 
                Container(
                  width: double.infinity,
                  child: Column(
                    
                    children: [
        
                      SizedBox(height: 151.7.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/correctIcon.png"),
                          SizedBox(width: 30.w,)
                        ],
                      ) ,
        
                      SizedBox(height: 66.67.h,) ,
        
                      Text("Your Order has been accepted !", textAlign: TextAlign.center , style: TextStyle(
                        fontSize: 28.sp ,
                        fontWeight: FontWeight.w600,
                        color:Color.fromRGBO(24, 23, 37, 1),
                        
                      ),) ,
        
                      SizedBox(height: 20.h,),
        
        
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w ) ,
                        child: Text("Your items has been placcd and is on it’s way to being processed", textAlign: TextAlign.center , style: TextStyle(
                          fontSize: 16.sp ,
                          fontWeight: FontWeight.w400,
                          color:Color.fromRGBO(124, 124, 124, 1),
                          
                        ),),
                      ) ,
        
        
                      SizedBox(height: 20.h,),
        
                       Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                            
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(83, 177, 117, 1),
                              borderRadius: BorderRadius.circular(20.r)
                            ),
                            child: MaterialButton(
                              onPressed: ()=>{
                                
                              },
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              height: 60.h,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)
                              ),
                              child: Text("Track Order" , style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 249, 255, 1)
                              ),)
                            ),
                          ),
                          
        
                           Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r)
                            ),
                            child: 
                            
                            MaterialButton(
                              
                              onPressed: ()=>{
        
                                
        
                              },
        
                              splashColor: Color.fromRGBO(255, 255, 255, 0.43),
                              focusColor: Color.fromRGBO(255, 255, 255, 0.43),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)
                              ),
        
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              height: 67.h,
                              child: Text("Back to home" , style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),)
                            ),
                          ),
                          
                    ],
                    ),
                )
              )
            ],
          ),
        ),]
      ),
    );

  }
}