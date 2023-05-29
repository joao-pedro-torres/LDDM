import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-R.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: ListView(children: const [
          SizedBox(height: 20),

          ListTile(title: Text('LDDM04'),subtitle: Text('Consta página de login'
              ' contendo as entradas de texto \'E-mail\' e \'Senha\', botões'
              ' \'Entrar\' e \'Criar conta\' e caixa de seleção \'Remeber'
              ' me\'.')),
          ListTile(title: Text('LDDM05'),subtitle: Text('Consta página de'
              ' cadastro contendo as entradas de texto \'Nome\','
              ' \'Data de Nascimento\', \'Telefone\', \'E-mail\' e \'Senha\','
              ' com limite de caracteres, teclados especiais e ocultação/mostra'
              ' do campo \'Senha\', caixas de seleção para seleção de gênero,'
              ' swithces para seleção de preferências de notificação, botão'
              ' \'Cadastrar\', e slider para alteração de tamanho de fonte.')),
          ListTile(title: Text('LDDM06'),subtitle: Text('Consta link entre as'
              ' as páginas de \'Login\' e \'Cadastro\' por meio de botões, e'
              ' navegação usando menus entre as páginas \'Login\' e \'About\'.')),
          ListTile(title: Text('LDDM07'),subtitle: Text('Consta verificação de'
              ' entrada de texto nos campos \'E-mail\' e \'Senha\' mediante'
              ' acionamento do botão \'Entrar\', link entre as páginas por meio'
              ' de rotas nomeadas, tela \'Home\' contendo 20 itens com \'Alertas'
              ' de diálogo\' contendo os botões \'Sim\' e \'Não\' para saída,'
              ' e passagem de uma variável \'Nome\' gerada na tela \'Login\' e'
              ' e recebida pela tela \'Home\' para ser mostrada no AppBar.')),
        ],),
      )
    );
  }
}