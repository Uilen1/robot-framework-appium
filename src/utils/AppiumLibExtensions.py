from robot.libraries.BuiltIn import BuiltIn
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from AppiumLibrary import AppiumLibrary
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import NoSuchElementException

class appium_lib_extensions:
         
    def accept_alerts(self,labelButton,timeout=5):
        try:
            self.get_driver()._current_application().execute_script('mobile: alert', {
                'action': 'accept',
                'buttonLabel': labelButton
            })
        except Exception:
            print("Nenhum alerta presente na tela")

    def get_driver(self):
        print(BuiltIn().get_library_instance('AppiumLibrary'))
        return BuiltIn().get_library_instance('AppiumLibrary')
    
    def get_session_id(self):
        print(BuiltIn().get_library_instance('AppiumLibrary')._current_application().session_id)
        return BuiltIn().get_library_instance('AppiumLibrary')._current_application().session_id
    
    def scroll_left(self):
        """Scrolls left"""
        driver = self.get_driver()._current_application()
        driver.execute_script("mobile: scroll", {"direction": 'left'})

    def scroll_left_to_element(self, locator):
        """Scrolls left to element"""
        driver = self.get_driver()._current_application()
        element = self.get_driver()._element_find(locator, True, True)
        driver.execute_script("mobile: scroll", {"direction": 'left', 'elementid': element.id})

    def scroll_right(self):
        """Scrolls rigth"""
        driver = self.get_driver()._current_application()
        driver.execute_script("mobile: scroll", {"direction": 'right'})

    def scroll_right_to_element(self, locator):
        """Scrolls rigth to element"""
        driver = self.get_driver()._current_application()
        element = self.get_driver()._element_find(locator, True, True)
        driver.execute_script("mobile: scroll", {"direction": 'right', 'elementid': element.id})
    
    def do_swipe_by_percent(self, start_x, start_y, end_x, end_y,duration=1000):
        """
        Realize o swipe na tela a partir da porcentagem.

        Args:
         - start_x - x-porcentagem para começar
         - start_y - y-porcentagem para começar
         - end_x - x-porcentagem para parar
         - end_y - y-porcentagem para parar
         - duration - (optional) tempo para realizar o swipe, in ms.

        Usage:
        | Do Swipe By Percent  | 90 | 50 | 10 | 50 | # Realiza o swipe da direita para a esquerda. |
        """
        print(BuiltIn().get_library_instance('AppiumLibrary'))
        driver = BuiltIn().get_library_instance('AppiumLibrary')
        width = driver.get_window_width()
        height = driver.get_window_height()
        x_start = float(start_x) / 100 * width
        x_end = float(end_x) / 100 * width
        y_start = float(start_y) / 100 * height
        y_end = float(end_y) / 100 * height
        x_offset = x_end - x_start
        y_offset = y_end - y_start
        driver.swipe(x_start, y_start, x_offset, y_offset, duration)

    def tap_element_invisible_element(self,locator, duration=500):
        """
        Toca no elemento a partir da localizaçao via xpath. Esse metodo pode ser capaz
        de interagir com elementos com visible=false mas que estao na tela.
        Internamento ele obtem o elemento e calcula as coordenadas, realizando posteriormente
        toque.

        Args:
         - xpath - locator do elemento
         - duration - (optional) tempo para realizar o toque, in ms.

        Usage:
        | Tap Element | xpath=//*[@name="btn_entrar"] |

        _*NOTE: *_
        Esse metodo foi criado para trabalhar com elementos com visible=false. Utilize
        somente nesses casos.
        """
        try:
            locations = []
            driver = self.get_driver()._current_application()
            element = self.find_element(driver,locator)
            location = element.location
            size = element.size
            x = location['x'] + size['width'] / 2
            locations.append(x)
            y = location['y'] + size['height'] / 2
            locations.append(y)
            print(f"Coodenada x=  {x} | coordenada y = {y}")
            driver.tap(positions=[locations], duration=duration)
        except Exception as e:
            raise ValueError(f"Nao foi possivel realizar o TAP no elemento com o xpath: {xpath}")

    def send_keys_invisible_element(self, text, locator ):
        """
        Realiza a escrita em campos de texto em elementos que estejam com visible=false

        Args:
         - text - texto a ser preenchido
         - xpath - locator do elemento
         - duration - (optional) tempo para realizar o toque, in ms.

        Usage:
        | Send Keys Invisible Element | 1234 | xpath=//XCUIElementTypeOther[@name="textfield_cpf"] |

        _*NOTE: *_
        Esse metodo foi criado para trabalhar com elementos com visible=false. Utilize
        somente nesses casos.
        """
        try:
            driver = self.get_driver()._current_application()
            element = self.find_element(driver,locator)
            element.send_keys(text)
        except Exception as e:
            raise ValueError(f"Nao foi possivel realizar o envio da mensagem para o elemento com o xpath: {xpath}")
        

    def find_element(self,driver, locator):
        locator_type, locator_value = None, None
        if "=" in locator:
            locator_type, locator_value = locator.split("=",1)
            locator_type = locator_type.strip().lower()
            locator_value = locator_value.strip()
        else:
            print(f"Formato do locator invalido: {locator}.")
            return None
        try:
            locator_map = {
                "id": AppiumBy.ID,
                "name": AppiumBy.NAME,
                "accessibility_id": AppiumBy.ACCESSIBILITY_ID,
                "class_name": AppiumBy.CLASS_NAME,
                "css_selector": AppiumBy.CSS_SELECTOR,
                "link_text": AppiumBy.LINK_TEXT,
                "partial_link_text": AppiumBy.PARTIAL_LINK_TEXT,
                "tag_name": AppiumBy.TAG_NAME,
                "xpath": AppiumBy.XPATH,
            }

            if locator_type in locator_map:
                return driver.find_element(locator_map[locator_type], locator_value)
            else:
                print(f"Formato informado nao suportado: {locator_type}.")
                return None
        except NoSuchElementException: # type: ignore
            print(f"Elemento nao encontrado usando {locator_type} = {locator_value} ")
            return None