/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.story;


public class Helper {
    
    public  static String getLimitedChar(String string) {
       
        if (string.length()>50) {
            //System.out.println("Helper :- "+string);
            return (string.substring(0, 50)+"...");
            
        }
        else{
             //System.out.println("Helper :- "+(string+"..."));
        return (string+"...");
        }
        
        
        
        
       /* if (string.length()>25) {
             String[] str= string.split(" ");
             if (str.length>8) {
                 String res="";
                 for (int i=0;i<8;i++) {
                     res=res+str[i]+" ";
                     
                 }
                 return (res+"...");
            
             }
             else{
                    return (str.toString()+"...");
             }
        }
        else{
            return (string+"...");
        }*/
    }


    

}
