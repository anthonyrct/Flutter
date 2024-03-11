// import 'package:flutter/material.dart';

// void main(){
//   runApp(MyApp5());
// }

// class MyApp5 extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: 'Contact Form',
//       home:Scaffold(
//         appBar: AppBar(
//           title: Text('Contact Form'),
//         ),
//         body: ContactForm(),
//       ),
//     );
//   }
// }
// class ContactForm extends StatefulWidget{
//   @override
//   _ContactFormState createState()=> _ContactFormState();
// }

// class _ContactFormState extends State<ContactForm> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _email = '';
//   String _message = '';

//   @override
//   Widget build(BuildContext context){
//     return Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Nome'),
//               validator: (value){
//                 if(value.isEmpty){
//                   return 'Porfavor, insira seu nome';
//                 }
//                 return null;
//               },
//               onSaved: (value){
//                 _name = value;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'E-mail')
//               validator: (value){
//                 return 'porfavor, insira seu e-mail';
//               },
//               //adicionar uma autenticção de email(em progresso)
//               return null;
//             ),
//             onSaved:(value){
//               _email = value;
//             },
//         ),
//         TextFormField(
//           Decoration:InputDecoration(labelText: 'Mensagem'),
//           maxLines:5,
//           validator:(value){
//             if (value.isEmpty){
//               return ' porfavor, insira sua mensagem';
//             }
//             return null;
//           },
//           onSaved:(value){
//             _message = value;
//           },
//         ),
//         SizedBox(height: 20),
//         RaisedButton(
//           onPressed:(){
//             if(_formKey.currentState.validate()){
//               _formKey.currentState.save();
//               //enviar os dados do usuario pra algum lugar, possivelmente para o banco de dados(em progresso)
//               print('Nome: $_name');
//               print('E-mail: $_email');
//               print('Mensagem: $_message');
//             }
//           },
//           child: Text('Enviar'),
//         ),
//           ],
//         ),
//       ),
//     )
//   }
// }