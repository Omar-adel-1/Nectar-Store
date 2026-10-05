import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardAccount extends StatelessWidget {
  const new({
    super.key,
    required this.myIcon,
    required this.title,
    required this.onPressed
  });

  final IconData myIcon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.symmetric(vertical: 10.h),
     decoration: BoxDecoration(
     border: Border(
         bottom: BorderSide(
           color: Color.fromRGBO(226, 226, 226, 1)
         )
       ),
     ) ,
    
     child: Row(
       
       children: [
           Icon(myIcon , color: Colors.black87,),
     
           SizedBox(width: 15.w,),
     
          Text(title , style: TextStyle(
           color: Colors.black,
           fontSize: 18.sp ,
           fontWeight: FontWeight.w600,
         ),),
     
           Spacer(),
     
          IconButton(
           
           onPressed: onPressed,
           
            icon: Icon(Icons.arrow_forward_ios , color: Colors.black,)
            ),
       ], 
     ),
    );
  }
}