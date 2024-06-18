import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/audio_model.dart';

class AudioController {
  List<AudioModel> _list = [];
  List<AudioModel> get list => _list;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchFromFireStore() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('audio').get();
      _list = querySnapshot.docs.map((doc) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?; // Convertendo para Map<String, dynamic>?
        return AudioModel.fromMap(data!); // Usando ! para garantir que data não é nulo
      }).toList();
    } catch (e) {
      print('Erro ao buscar audios do Firestore: $e');
    }
  }
}
