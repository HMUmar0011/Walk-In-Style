String? isValidEmail(String? email) {
  // Regular expression pattern for email validation
  final RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
  if (email==null||email.isEmpty) {
  return '\u26A0 This field cant be null';
}
else if(!(emailRegex.hasMatch(email))){
  return '\u26A0 Enter valid email';
}else{
  return null;
}
}
String? isValidUsername(String? input) {
  // Regular expression pattern for username validation
 final RegExp inputRegex = RegExp(r'^[a-zA-Z0-9_ ]{3,50}$',);
  if (input == null || input.isEmpty) {
    return '\u26A0This field cannot be null';
  } else if (!inputRegex.hasMatch(input)) {
    return '\u26A0Enter a valid username (3-20 characters, alphanumeric and underscore only)';
  } else {
    return null;
  }
}

 
String? isValidPassword(String? password) {
  // Regular expression pattern for email validation
  final RegExp passwordRegex =RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');
if (password==null||password.isEmpty) {
  return '\u26A0 This field cant be null';

} else if(password.length<7){
  return '\u26A0Password must be more than 7 characters';
}else if(!(passwordRegex.hasMatch(password))){
  return '\u26A0Enter Strong Password';
}else{
  return null;
}}
String? isValidComfirmPassword(String? value,String? password) {
  // Regular expression pattern for email validation
if (password==null||password.isEmpty) {
  return '\u26A0This field cant be null';

} else if(password.length<7){
  return '\u26A0Password must be more than 7 characters';
}else if(value!=password){
  return '\u26A0Password does not match';
}else{
  return null;
}}