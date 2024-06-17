import zipfile
import biplist
import plistlib
import os

class commands_utils:
    
    def get_app_bundled_id(self,caminho_app):
        caminho_info_list = os.path.join(caminho_app, 'Info.plist')

        if os.path.exists(caminho_info_list):
            with open(caminho_info_list,'rb') as arquivo_plist:
                plist_data = plistlib.load(arquivo_plist)
                bundled_id = plist_data.get('CFBundleIdentifier')
                if bundled_id:
                    return bundled_id
                else:
                    print("Nao foi possivel encontrar o bundle_id no arquivo Info.plist")
                    return None
        else:
            print("Arquivo Info.plist nao encontrado no arquivo .app")
            return None
    
    def get_ipa_bundled_id(self,caminho_ipa):
        with zipfile.ZipFile(caminho_ipa, 'r') as ipa_zip:
            for nome_arquivo in ipa_zip.namelist():
                if nome_arquivo.startswith('Payload/') and nome_arquivo.endswith('.app/Info.plist'):
                    plist_data = ipa_zip.read(nome_arquivo)
                    plist_dict = biplist.readPlistFromString(plist_data)
                    caminho_app = os.path.join(caminho_ipa,nome_arquivo)
                    bundled_id = plist_dict.get('CFBundleIdentifier')
                    if bundled_id:
                        return bundled_id
                    else:
                        print("Nao foi possivel encontrar o bundle_id no arquivo Info.plist")
                        return None
                    
        print("Arquivo Info.plist nao encontrado no arquivo .ipa")
        return None