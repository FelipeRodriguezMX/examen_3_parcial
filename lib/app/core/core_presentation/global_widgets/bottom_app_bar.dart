part of './global_widgets.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.business),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('/'),
          ),
          IconButton(
            icon: const Icon(Icons.electric_car),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('/vehiculos'),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('/settings'),
          ),
        ],
      ),
    );
  }
}

class BlankBottomAppBar extends StatelessWidget {
  const BlankBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[],
      ),
    );
  }
}
