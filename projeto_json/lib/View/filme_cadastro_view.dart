import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilmeCadastroScreen extends StatefulWidget {
  const FilmeCadastroScreen({super.key});

  @override
  State<FilmeCadastroScreen> createState() => _FilmeCadastroScreenState();
}

class _FilmeCadastroScreenState extends State<FilmeCadastroScreen> {
   final FormState _formKey = new GlobalKey<FormState> _formkey = globalKey<
 final TextEditingController _nomeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Filme'),
      ),
      body: Center(
        child: Form(
          key:_formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText:"Nome do filme"),
                controller: _nomeController,
                validator: (value){
                if(value!.trim().isEmpty){
                   return "Campo Nome Deve ser Preenchido";
                }else{
                  return null;
                }
                }),
              ElevatedButton(onPressed: () => {
                if(_formKey.currentState!.validate()){
                  _cadastrarFilme()
                }
              },
               child: const Text("cadastrar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}