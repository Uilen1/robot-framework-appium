import re
import yaml

class string_utils:
    def extrair_digitos_nao_numericos_do_cpf(self,cpf):
        digitos = re.findall(r'\d', cpf)
        return ''.join(digitos)
    

    def validar_cpf(self,cpf):
        cpf_numerico = self.extrair_digitos_nao_numericos_do_cpf(cpf)
        print(cpf_numerico)

        # Verifica se o cpf tem 11 digitos
        if len(cpf_numerico) != 11:
            print('cpf tem uma quantidade de digitos diferente de 11')
            return False
        
        # Verifica se todos os digitos sao iguais
        if len(set(cpf_numerico)) == 1:
            print('cpf tem todos os digitos iguais')
            return False
        return True
    
    def separar_string(self,string):
        lista_caracteres = []
        string = str(string)
        for caractere in string:
            lista_caracteres.append(caractere)
        return lista_caracteres
    
    def alterar_campo_yaml(self,caminho_arquivo, caminho_campo, novo_valor):
        """
        Altera as informacoes de arquivos yaml

        Args:
         - caminho_arquivo - o endereço do arquivo yaml
         - caminho_campo - caminho até a posicao desejada dentro do arquivo. Os niveis separados por ponto ('.')
         - valor - valor a ser inserido no arquivo

        Usage:
        | Altera Campo Yaml | ${EXECDIR}/ios/resources/test_data/password.yaml | seguranca.mensagem | alguma mensagem |
        """
        # Ler o arquivo original linha por linha
        with open(caminho_arquivo, 'r', encoding='utf-8') as file:
            linhas = file.readlines()
        keys = caminho_campo.split('.')
        campo_encontrado = False
        novo_conteudo = []
        valores_keys = {key : None for key in keys}

        for linha in linhas:
            linha_strip = linha.split(':',1)[0].strip()
            # Valida o aninhamento das chaves
            if linha_strip in valores_keys:
                valores_keys[linha_strip] = True

            if keys[-1] in linha_strip and all(key is True for key in valores_keys.values()) and not campo_encontrado:
                # Substituir a linha pelo novo valor
                indentacao = ' ' * (len(linha) - len(linha.lstrip()))  # Preserva a indentação
                nova_linha = f"{indentacao}{keys[-1]}: {novo_valor}\n"
                novo_conteudo.append(nova_linha)
                campo_encontrado = True
            else:
                novo_conteudo.append(linha)
    
        # Atualizar a linha correspondente ao campo desejado
        with open(caminho_arquivo, 'w', encoding='utf-8') as file:
            file.writelines(novo_conteudo)
    
        if not campo_encontrado:
            raise ValueError(f"Campo {caminho_campo} não encontrado no arquivo YAML.")
        else:
            print(f"Campo {caminho_campo} alterado para: {novo_valor}")
        