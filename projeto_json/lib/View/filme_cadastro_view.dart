import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FilmeCadastroScreen extends StatefulWidget {
  const FilmeCadastroScreen({super.key});

  @override
  State<FilmeCadastroScreen> createState() => _FilmeCadastroScreenState();
}

class _FilmeCadastroScreenState extends State<FilmeCadastroScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();

  File? _imagemSelecionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Filme'),
      ),
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                  decoration: const InputDecoration(hintText: "Nome do Filme"),
                  controller: _nomeController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Nome do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
                   TextFormField(
                  decoration: const InputDecoration(hintText: "genero do Filme"),
                  controller: _nomeController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "genero do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
                   TextFormField(
                  decoration: const InputDecoration(hintText: "sinopse do Filme"),
                  controller: _nomeController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "sinopse do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
                  TextFormField(
                  decoration: const InputDecoration(hintText: "duracao do Filme"),
                  controller: _nomeController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "duracao do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
                  TextFormField(
                  decoration: const InputDecoration(hintText: "ano do Filme"),
                  controller: _nomeController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "ano do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
                  TextFormField(
                  decoration: const InputDecoration(hintText: "classificação do Filme"),
                  controller: _nomeController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "clasificação do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
                  TextFormField(
                  decoration: const InputDecoration(hintText: "elenco do Filme - Separe por Virgula"),
                  controller: _nomeController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "elenco do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
                  SizedBox(height: 12,),
                  _imagemSelecionada !=null
                  ? Image.file(
                    _imagemSelecionada!,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  )
                  : SizedBox.shrink(),
                  ElevatedButton(
                    onPressed: _tirarfoto, child: null,
                  ),
                   TextFormField(
                   decoration: const InputDecoration(hintText: "imagem do Filme"),
                  controller: _nomeController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "imagem do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
              ElevatedButton(
                onPressed: () => {
                  if(_formkey.currentState!.validate()){
                    _cadastrarFilme()
                  }
                },
                child: const Text("Cadastrar"),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _tirarfoto() async{
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);
  setState(() {
    _imagemSelecionada = File(pickedFile!.path);
  });
  }

  void _cadastrarFilme() {
    //método para cadastrar filme no json
    //chamar classe controller
  }
}