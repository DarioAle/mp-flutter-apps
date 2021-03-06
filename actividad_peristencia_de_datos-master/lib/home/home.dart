import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage/home/bloc/home_bloc.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool switchValue = false;
  bool switchCheckBoxValue = false;
  double sliderValue = 0.0;

  // Drop down list variables
  String _dropSelectedValue = "dos";
  static const List<String> _options = ["uno", "dos", "tres", "cuatro"];
  final List<DropdownMenuItem<String>> _itemOptionsList = _options
      .map(
        (val) => DropdownMenuItem<String>(
          value: val,
          child: Text("$val"),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(LoadConfigsEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if(state is LoadedConfigsState) {            
            switchValue = state.configs["switch"];
            switchCheckBoxValue = state.configs["checkbox"]; 
            sliderValue = state.configs["slider"];
            _dropSelectedValue = state.configs["dropdow"];
          } else if(state is ErrorState) {
            ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text("Configuraciones no cargadas"),));
          }
          // TODO: inicializar aqui los valores que se cargan en el BLoC
          // como solo observa los estados 1 vez, aqui se puede hacer
          
        },
        builder: (context, state) {
          return buildListView(context);
        },
      ),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      children: <Widget>[
        // Drop down list
        ListTile(
          title: Text("Dropdown"),
          trailing: DropdownButton(
            items: _itemOptionsList,
            value: _dropSelectedValue,
            onChanged: (newValue) {
              setState(() {
                _dropSelectedValue = newValue;
              });
            },
          ),
        ),
        Divider(),
        // Switch
        ListTile(
          trailing: Switch(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
          ),
        ),
        // TODO: agregar List tile con Title = text y trailing = Switch
        Divider(),
        ListTile(
          trailing: Checkbox(
            value: switchCheckBoxValue,
            onChanged: (value) {
              setState(() {
                switchCheckBoxValue = value;
              });
            },
          ),
        ),
        // TODO: agregar List tile con Title = text y trailing = Checkbox
        Divider(),
        // Slider
        Text("Slider", textAlign: TextAlign.center),
        Slider(
          value: sliderValue,
          min: 0,
          max: 10,
          label: "${sliderValue.round()}",
          onChanged: (value) {
            setState(() {
              sliderValue = value;
            });
          },
        ),
        Divider(),
        MaterialButton(
          color: Colors.green,
          child: Text("Guardar"),
          onPressed: () {
            BlocProvider.of<HomeBloc>(context).add(SaveConfigsEvent(configs: {
              "switch": switchValue,
              "checkbox": switchCheckBoxValue,
              "dropdown": _dropSelectedValue,
              "slider": sliderValue
            }));
            ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text("No se que poner")));
            //  TODO: Agregar evento para guardar
          },
        ),
      ],
    );
  }
}
