import 'package:disenos/routes/routes.dart';
import 'package:disenos/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  const _MenuPrincipal(),
      appBar: AppBar(
        title:  const Text('Diseños en flutter - telefono'),
      ),
      body:  const _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
   const _ListaOpciones({super.key});
  @override
  Widget build(BuildContext context) {
    final appTheme=Provider.of<ThemeChange>(context);
    return ListView.separated(
      physics:  const BouncingScrollPhysics(),
      separatorBuilder: (context, index) =>  Divider(
        color: appTheme.currenttheme.primaryColor,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading:  FaIcon(
          pageRoutes[index].icon,
          color: appTheme.currenttheme.primaryColor,
        ),
        title:  Text(pageRoutes[index].titulo, style: appTheme.currenttheme.textTheme.bodyLarge,),
        trailing:  FaIcon(
          FontAwesomeIcons.chevronRight,
          color: appTheme.currenttheme.primaryColor,
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[index].page,) );
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
   const _MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {

    final appTheme=Provider.of<ThemeChange>(context);


    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                // padding:  EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child:  CircleAvatar(
                  backgroundColor: appTheme.currenttheme.primaryColor,
                  child: const Text(
                    'RT',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
             const Expanded(child: _ListaOpciones()),
            ListTile(
              leading:  Icon(
                Icons.light_outlined,
                color: appTheme.currenttheme.primaryColor,
              ),
              title:  const Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: appTheme.currenttheme.primaryColor,
                value: appTheme.darkTheme,
                onChanged: (value) =>appTheme.darkTheme=value,
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              right: false,
              left: false,
              child: ListTile(
                leading:  Icon(
                  Icons.add_to_home_screen,
                  color: appTheme.currenttheme.primaryColor,
                ),
                title:  const Text('Custom Theme'),
                trailing: Switch.adaptive(
                  activeColor: appTheme.currenttheme.primaryColor,
                  value: appTheme.customThem,
                  onChanged: (value) =>appTheme.customTheme=value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
