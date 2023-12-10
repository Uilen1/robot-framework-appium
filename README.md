# Automação mobile com robot-framework e appium-library


## Principais comandos para trabalhar com o android-emulator

#### Apresenta todos os devices conectados:
`adb-devices`
#### Lista o nome de todos os emuladores:
`emulator -list-avds`
#### Executa o emulador com o nome informado:
`emulator -avd <nome-device>`

# Principais comandos para execução dos testes
**1. Comando para adicionar relatorios + execução das tags + arquivos com os testes**
```
robot -d <diretorio-relatorios> --include <tag-para-ser-executada> --exclude <tag-para-nao-executar> <diretorio-arquivo-teste>
```
**EX:**
```
robot -d src\resources\report --include validado --exclude failed src\runner.robot
```
**2. Comando para executar mais de um arquivo de teste**
```
robot *.robot
```

## Erros conhecidos

**1. Erro ao iniciar a JVM Ao executar o "uiautomatorviewer"
Para solucionar:**
```
File > Settings > Kotlin Compiler
```
*na opção 'Target JVM version' selecione a versão
instalada na sua maquina*

**2. Erro ao acessar a URL local do appium**

- Para solucionar devemos executar o comando:

```
appium --base-path /wd/hub
```
