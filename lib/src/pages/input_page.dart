import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name  = '';
  String _email = '';
  String _password;

  String _date = '';
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0 ),
        children: [
          _createInputName(),
          Divider(),
          _createInputEmail(),
          Divider(),
          _createInputPassword(),
          Divider(),
          _createInputDatePicker(context),
          Divider(),
          _infoPerson()
        ],
      ),
    );
  }

  Widget _createInputName() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        counter: Text('Letras ${ _name.length }'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (name){
        setState(() {
          _name = name;          
        });
      },
    );
  }

  
Widget _createInputEmail() {
  return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        hintText: 'Correo de la persona',
        labelText: 'Correo Electrónico',
        helperText: 'Solo es el emnail',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email_outlined)
      ),
      onChanged: (email){
        setState(() {
          _email = email;          
        });
      },
    );
}

Widget _createInputPassword() {
  return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        hintText: 'Contraseña de la persona',
        labelText: 'Contraseña',
        helperText: 'Solo es la contraseña',
        suffixIcon: Icon(Icons.remove_red_eye_outlined),
        icon: Icon(Icons.lock)
      ),
      onChanged: (password){
        setState(() {
          _password = password;          
        });
      },
    );
}

Widget _createInputDatePicker(BuildContext context) {
  return TextField(
    controller: _inputFieldDateController,
    enableInteractiveSelection: false,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      hintText: 'Fecha de nacimiento',
      labelText: 'Fecha de nacimiento',
      helperText: 'Fecha de nacimiento',
      suffixIcon: Icon(Icons.perm_contact_calendar),
      icon: Icon(Icons.calendar_today)
    ),
    onTap: (){
      FocusScope.of(context).requestFocus(new FocusNode());
      _selectDate(context);
    },
  );
}

_selectDate(BuildContext context) async{
  DateTime picked = await showDatePicker(
    context: context,
    initialDate: new DateTime.now(),
    firstDate: new DateTime(2018),
    lastDate: new DateTime(2025),
    locale: Locale('es', 'ES')
  );

  if(picked != null){
    setState(() {
          _date = picked.toString();
          _inputFieldDateController.text = _date;
        });
  }
}



Widget _infoPerson() {
    return ListTile(
      title: Text('Nombre es $_name'),
      subtitle: Text('Correo electrónico $_email'),
    );
  }



  
}