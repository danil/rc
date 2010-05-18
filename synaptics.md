<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009,
     2010 Danil Kutkevich <http://danil.kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Synaptics touchpad
==================

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
