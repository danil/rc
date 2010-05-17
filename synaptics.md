<!--*- coding: utf-8-unix; -*-->

    Section "InputDevice"
      Identifier "Synaptics Touchpad"
      Driver "synaptics"
      Option "SendCoreEvents" "true"
      Option "Device" "/dev/psaux"
      Option "Protocol" "auto-dev"
      Option "CircularScrolling" "on" # Включить круговую прокрутку
      Option "CircScrollTrigger" "2" # Привязка начала кругов на правый верхний угол
      Option "HorizEdgeScroll" "on" # Горизонталная прокрутка по нижнему краю
      Option "SHMConfig" "on" # Системная настройка, необходима для следующих строк
      Option "TapButton2" "3" # Два пальца - на правую кнопку
      Option "TapButton3" "2" # Три пальца - на среднюю (колесо)
    EndSection
