import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorMessage extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h , horizontal: 20.w),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: ()=>{
                  Navigator.pop(context)
                },
                icon: Icon(Icons.close),
                )),
    
               Container(
     
        width: double.infinity,
    
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/icons/dialogPic.png"),
    
            SizedBox(height: 40.h,),
    
            Text("Oops! Order Failed", textAlign: TextAlign.center , style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600
            ),),
    
            SizedBox(height: 15.h,),
        
            Text("Something went tembly wrong." , style: TextStyle(
              color: Color.fromRGBO(124, 124, 124, 1)
            ),) 
            ,
    
            SizedBox(height: 30.h,),
    
             Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
            
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(83, 177, 117, 1),
              borderRadius: BorderRadius.circular(20.r)
            ),
            child: MaterialButton(
              onPressed: ()=>{
                Navigator.pop(context)
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)
              ),
              padding: EdgeInsets.symmetric(vertical: 5.h),
              height: 50.h,
              child: Text("Please Try Again" , style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(255, 249, 255, 1)
              ),)
            ),
          ),
    
           Container(
        margin: EdgeInsets.symmetric(horizontal: 0.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r)
            ),
            child: MaterialButton(
              onPressed: ()=>{
               
              },
              splashColor: Color.fromRGBO(255, 255, 255, 0.43),
              focusColor: Color.fromRGBO(255, 255, 255, 0.43),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)
              ),
              padding: EdgeInsets.symmetric(vertical: 5.h),
              height:50.h,
              child: Text("Back to home" , style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),)
            ),
          ),
          ],
        ),
      ),
          ],
        ),
      ) ,
    
      
    );
  }
}